#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");

if (description)
{
  script_id(31855);
  script_version("$Revision: 1.6 $");

  script_cve_id("CVE-2008-1728");
  script_bugtraq_id(28722);
  script_xref(name:"Secunia", value:"29751");
  script_xref(name:"OSVDB", value:"44268");

  script_name(english:"Openfire < 3.5.0 ConnectionManagerImpl.java Queue Handling Remote DoS");
  script_summary(english:"Checks version in admin login page");

 script_set_attribute(attribute:"synopsis", value:
"The remote host contains an application that is prone to a denial of
service attack." );
 script_set_attribute(attribute:"description", value:
"The remote host is running Openfire / Wildfire, an instant messaging
server supporting the XMPP protocol. 

According to its version, the installation of Openfire or Wildfire on
the remote host suffers from a denial of service vulnerability that
could bring the server down because it has no limit on a client
session's send buffer and can not handle clients that fail to read
messages." );
 script_set_attribute(attribute:"see_also", value:"http://www.igniterealtime.org/issues/browse/JM-1289" );
 script_set_attribute(attribute:"see_also", value:"http://www.openwall.com/lists/oss-security/2008/04/10/7" );
 script_set_attribute(attribute:"solution", value:
"Upgrade to Openfire version 3.5.0 or later." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:C" );
script_end_attributes();


  script_category(ACT_GATHER_INFO);
  script_family(english:"Denial of Service");

  script_copyright(english:"This script is Copyright (C) 2007-2009 Tenable Network Security, Inc.");

  script_dependencies("http_version.nasl");
  script_require_ports("Services/www", 9090);

  exit(0);
}


include("global_settings.inc");
include("http_func.inc");
include("http_keepalive.inc");


# nb: banner checks of open-source software are prone to false-
#     positives so only run the check if reporting is paranoid.
if (report_paranoia < 2) exit(0);


port = get_http_port(default:9090);


# Grab the version from the admin console's login page.
req = http_get(item:"/login.jsp?url=%2Findex.jsp", port:port);
res = http_keepalive_send_recv(port:port, data:req, bodyonly:TRUE);
if (res == NULL) exit(0);

if (
  'id="jive-loginVersion">' >< res &&
  (
    "<title>Openfire Admin Console" >< res &&
    "Openfire, Version: " >< res
  ) ||
  (
    "<title>Wildfire Admin Console" >< res &&
    "Wildfire, Version: " >< res
  )
)
{
  prod = strstr(res, "<title>") - "<title>";
  prod = prod - strstr(prod, " Admin Console</title>");

  ver = strstr(res, "fire, Version: ") - "fire, Version: ";
  if (ver) ver = ver - strstr(ver, '\n');

  # The issue was addressed in version 3.5.0 so treat any 
  # versions before that as vulnerable.
  if (
    strlen(ver) && ver =~ "^([0-2]\.|3\.[0-4]\.)" &&
    prod =~ "^(Open|Wild)fire$"
  )
  {
    if (report_verbosity)
    {
      report = string(
        "\n",
        prod, " version ", ver, " is installed on the remote host.\n"
      );
      security_hole(port:port, extra:report);
    }
    else security_hole(port);
  }
}
