#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");

if (description)
{
  script_id(38156);
  script_version("$Revision: 1.3 $");

  script_name(english:"FogBugz Interface Detection");
  script_summary(english:"Detects FogBugz Web Interface");

 script_set_attribute(attribute:"synopsis", value:
"The remote web server contains a project management software");

 script_set_attribute(attribute:"description", value:
"The remote web server is running the web interface for FogBugz,
a web interface for a project management software

As this interface is likely to contain sensitive information, make sure
only authorized personel can log into this site");
 script_set_attribute(attribute:"see_also", value:"http://www.fogcreek.com/Fogbugz/");
 script_set_attribute(
   attribute:"solution",
   value:string(
    "Make sure the proper access controls are put in place")
  );

  script_set_attribute(
    attribute:"risk_factor",
    value:"None"
  );


  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_family(english:"CGI abuses");
  script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
  script_dependencies("http_version.nasl");
  script_require_ports("Services/www", 80);
  exit(0);
}

include("global_settings.inc");
include("misc_func.inc");
include("http.inc");

port = get_http_port(default:80);
if (!get_port_state(port)) exit(0);

# Loop through directories.
dirs = make_list("/", "/fogbugz");
foreach dir (dirs)
{
  url = string(dir, "/default.php");
  res = http_get_cache(item:url, port:port);
  if (isnull(res)) exit(0);

  if ( '<a href="http://www.fogcreek.com/FogBugz">FogBugz</a> Version' >< res )
  {
    line = egrep(pattern:'<a href="http://www\\.fogcreek\\.com/FogBugz">FogBugz</a> Version', string:res);
    if ( ! line ) exit(0);
    version = ereg_replace(pattern:".*FogBugz</a> Version&nbsp;([0-9.]+)&nbsp;\(.*Build ([0-9]+).*", 
			  string:line,
			  replace:"\1 (Build \2)");
    set_kb_item(name:"www/" + port + "/fogbugz", value:version + " under " + dir);
    security_note(port:port, extra:'FogBugz ' + version + ' is reachable under ' + dir);
    exit(0);
  }
}
