
#
# (C) Tenable Network Security
#
# The text of this plugin is (C) Red Hat Inc.
#

include("compat.inc");
if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(21029);
 script_version ("$Revision: 1.5 $");
 script_name(english: "RHSA-2006-0016: initscripts");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory RHSA-2006-0016");
 script_set_attribute(attribute: "description", value: '
  An updated initscripts package that fixes a privilege escalation issue and
  several bugs is now available.

  This update has been rated as having moderate security impact by the Red
  Hat Security Response Team.

  The initscripts package contains the basic system scripts used to boot
  your Red Hat system, change runlevels, and shut the system down cleanly.
  Initscripts also contains the scripts that activate and deactivate most
  network interfaces.

  A bug was found in the way initscripts handled various environment
  variables when the /sbin/service command is run. It is possible for a local
  user with permissions to execute /sbin/service via sudo to execute
  arbitrary commands as the \'root\' user. The Common Vulnerabilities and
  Exposures project (cve.mitre.org) assigned the name CVE-2005-3629 to
  this issue.

  The following issues have also been fixed in this update:

  * extraneous characters were logged on bootup

  * fsck was attempted on file systems marked with _netdev in rc.sysinit
  before they were available

  * the dynamically-linked /sbin/multipath was called instead of the correct
  /sbin/multiplath.static

  Additionally, this update includes support for partitioned multipath
  devices and a technology preview of static IP over InifiniBand.

  All users of initscripts should upgrade to this updated package, which
  resolves these issues.


');
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:L/AC:L/Au:N/C:C/I:C/A:C");
script_set_attribute(attribute: "see_also", value: "http://rhn.redhat.com/errata/RHSA-2006-0016.html");
script_set_attribute(attribute: "solution", value: "Get the newest RedHat Updates.");
script_end_attributes();

script_cve_id("CVE-2005-3629");
script_summary(english: "Check for the version of the initscripts packages");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "Red Hat Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/RedHat/rpm-list") ) exit(1, "Could not get the list of packages");

if ( rpm_check( reference:"initscripts-7.93.24.EL-1.1", release:'RHEL4') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host if not affected");
