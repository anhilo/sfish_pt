#
# (C) Tenable Network Security, Inc.
#



include("compat.inc");

if (description)
{
  script_id(33168);
  script_version("$Revision: 1.5 $");

  script_cve_id("CVE-2008-2714", "CVE-2008-2715", "CVE-2008-2716");
  script_bugtraq_id(29684);
  script_xref(name:"OSVDB", value:"46293");
  script_xref(name:"OSVDB", value:"46294");
  script_xref(name:"OSVDB", value:"46295");
  script_xref(name:"Secunia", value:"30636");

  script_name(english:"Opera < 9.50 Multiple Vulnerabilities");
  script_summary(english:"Checks version number of Opera");

 script_set_attribute(attribute:"synopsis", value:
"The remote host contains a web browser that is affected by several
issues." );
 script_set_attribute(attribute:"description", value:
"The version of Opera installed on the remote host reportedly is
affected by several issues :

  - Improper handling of special characters in page addresses
    can make addresses look like other ones, aiding in phishing attacks.
    
  - Specially-crafted HTML canvas elements could violate the
    same-origin image policy.
    
  - Framed sources contained on the same parent page can modify
    each other's location." );
 script_set_attribute(attribute:"see_also", value:"http://www.opera.com/support/search/view/878/" );
 script_set_attribute(attribute:"see_also", value:"http://www.opera.com/support/search/view/883/" );
 script_set_attribute(attribute:"see_also", value:"http://www.opera.com/support/search/view/885/" );
 script_set_attribute(attribute:"see_also", value:"http://www.opera.com/docs/changelogs/windows/950/" );
 script_set_attribute(attribute:"solution", value:
"Upgrade to Opera version 9.50 or later." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:N/I:P/A:N" );
script_end_attributes();


  script_category(ACT_GATHER_INFO);
  script_family(english:"Windows");

  script_copyright(english:"This script is Copyright (C) 2008-2009 Tenable Network Security, Inc.");

  script_dependencies("opera_installed.nasl");
  script_require_keys("SMB/Opera/Version_UI");

  exit(0);
}


include("global_settings.inc");


version_ui = get_kb_item("SMB/Opera/Version_UI");
if (isnull(version_ui)) exit(0);

if (version_ui =~ "^([0-8]\.|9\.([0-4][0-9]|50 *[a-z])($|[^0-9]))")
{
  if (report_verbosity)
  {
    report = string(
      "\n",
      "Opera version ", version_ui, " is currently installed on the remote host.\n"
    );
    security_warning(port:get_kb_item("SMB/transport"), extra:report);
  }
  else security_warning(get_kb_item("SMB/transport"));
}
