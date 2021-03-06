#
#  (C) Tenable Network Security, Inc.
#


include("compat.inc");

if (description)
{
  script_id(33129);
  script_version("$Revision: 1.4 $");

  script_cve_id("CVE-2008-2152");
  script_bugtraq_id(29622);
  script_xref(name:"Secunia", value:"30599");
  script_xref(name:"OSVDB", value:"46052");

  script_name(english:"OpenOffice < 2.4.1 rtl_allocateMemory() Function Crafted Document Handling Integer Overflow");
  script_summary(english:"Checks version of OpenOffice"); 
 
 script_set_attribute(attribute:"synopsis", value:
"The remote Windows host has a program affected by an integer overflow
vulnerability." );
 script_set_attribute(attribute:"description", value:
"The version of OpenOffice installed on the remote host reportedly
contains an integer overflow vulnerability in 'rtl_allocateMemory()',
a custom memory allocation function used by the application.  If an
attacker can trick a user on the affected system, he can leverage this
issue to execute arbitrary code subject to his privileges." );
 script_set_attribute(attribute:"see_also", value:"http://labs.idefense.com/intelligence/vulnerabilities/display.php?id=714" );
 script_set_attribute(attribute:"see_also", value:"http://www.securityfocus.com/archive/1/493227/30/0/threaded" );
 script_set_attribute(attribute:"see_also", value:"http://www.openoffice.org/security/cves/CVE-2008-2152.html" );
 script_set_attribute(attribute:"solution", value:
"Upgrade to OpenOffice version 2.4.1 or later." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C" );
script_end_attributes();

 
  script_category(ACT_GATHER_INFO);
  script_family(english:"Windows");

  script_copyright(english:"This script is Copyright (C) 2008-2009 Tenable Network Security, Inc.");

  script_dependencies("openoffice_installed.nasl");
  script_require_keys("SMB/OpenOffice/Build");

  exit(0);
}


build = get_kb_item("SMB/OpenOffice/Build");
if (build)
{
  matches = eregmatch(string:build, pattern:"([0-9]+[a-z][0-9]+)\(Build:([0-9]+)\)");
  if (!isnull(matches))
  {
    buildid = int(matches[2]);
    if (buildid < 9310) security_hole(get_kb_item("SMB/transport"));
  }
}
