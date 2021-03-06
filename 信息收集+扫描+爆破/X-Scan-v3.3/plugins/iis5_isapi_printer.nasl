#
# This script was written by Matt Moore <matt.moore@westpoint.ltd.uk>
#
# www.westpoint.ltd.uk
#
# Script audit and contributions from Carmichael Security 
#      Erik Anderson <eanders@carmichaelsecurity.com>
#      Added link to the Bugtraq message archive
#
# See the Nessus Scripts License for details
#
# Changes by Tenable:
# - Revised title (12/19/2008)


include("compat.inc");

if(description)
{
 script_id(10661);
 script_version ("$Revision: 1.30 $");

 script_name(english:"Microsoft IIS 5 .printer ISAPI Filter Enabled");
 
 script_set_attribute(attribute:"synopsis", value:
"Remote Web server supports Internet Printing Protocol" );
 script_set_attribute(attribute:"description", value:
"IIS 5 has support for the Internet Printing Protocol(IPP), which is 
enabled in a default install. The protocol is implemented in IIS5 as an 
ISAPI extension. At least one security problem (a buffer overflow)
has been found with that extension in the past, so we recommend
you disable it if you do not use this functionality." );
 script_set_attribute(attribute:"see_also", value:"http://www.cert.org/advisories/CA-2001-10.html" );
 script_set_attribute(attribute:"solution", value:
"To unmap the .printer extension:
 1.Open Internet Services Manager. 
 2.Right-click the Web server choose Properties from the context menu. 
 3.Master Properties 
 4.Select WWW Service -> Edit -> HomeDirectory -> Configuration 
and remove the reference to .printer from the list." );
 script_set_attribute(attribute:"risk_factor", value:"None" );

script_end_attributes();

 
 summary["english"] = "Tests for IIS5 .printer ISAPI filter";
 
 script_summary(english:summary["english"]);
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2001-2009 Matt Moore");
 family["english"] = "Web Servers";
 script_family(english:family["english"]);
 script_dependencie("find_service1.nasl", "no404.nasl", "http_version.nasl", "www_fingerprinting_hmap.nasl");
 script_require_ports("Services/www", 80);
 exit(0);
}

# Actual check starts here...
# Check makes a request for NULL.printer

include("http_func.inc");
include("http_keepalive.inc");



port = get_http_port(default:80);


sig = get_kb_item("www/hmap/" + port + "/description");
if ( sig && "IIS" >!< sig ) exit(0);

if(get_port_state(port))
{ 
 req = http_get(item:"/NULL.printer", port:port);
 r = http_keepalive_send_recv(port:port, data:req);
 if("Error in web printer install" >< r)	
 	security_note(port);

}
