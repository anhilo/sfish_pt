
#
# (C) Tenable Network Security
#
# This plugin text was extracted from Mandrake Linux Security Advisory ADVISORY
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(25429);
 script_version ("$Revision: 1.3 $");
 script_name(english: "MDKSA-2007:111: util-linux");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory MDKSA-2007:111 (util-linux).");
 script_set_attribute(attribute: "description", value: "login in util-linux-2.12a (and later versions) skips pam_acct_mgmt
and chauth_tok when authentication is skipped, such as when a
Kerberos krlogin session has been established, which might allow
users to bypass intended access policies that would be enforced by
pam_acct_mgmt and chauth_tok.
Updated packages have been patched to address this issue.
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:L/AC:M/Au:S/C:P/I:P/A:P");
script_set_attribute(attribute: "see_also", value: "http://wwwnew.mandriva.com/security/advisories?name=MDKSA-2007:111");
script_set_attribute(attribute: "solution", value: "Apply the newest security patches from Mandriva.");
script_end_attributes();

script_cve_id("CVE-2006-7108");
script_summary(english: "Check for the version of the util-linux package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "Mandriva Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Mandrake/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/Mandrake/rpm-list") ) exit(1, "Could not get the list of packages");

if ( rpm_check( reference:"losetup-2.12r-8.2mdv2007.0", release:"MDK2007.0", yank:"mdv") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"mount-2.12r-8.2mdv2007.0", release:"MDK2007.0", yank:"mdv") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"util-linux-2.12r-8.2mdv2007.0", release:"MDK2007.0", yank:"mdv") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"losetup-2.12r-12.1mdv2007.1", release:"MDK2007.1", yank:"mdv") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"mount-2.12r-12.1mdv2007.1", release:"MDK2007.1", yank:"mdv") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"util-linux-2.12r-12.1mdv2007.1", release:"MDK2007.1", yank:"mdv") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if (rpm_exists(rpm:"util-linux-", release:"MDK2007.0")
 || rpm_exists(rpm:"util-linux-", release:"MDK2007.1") )
{
 set_kb_item(name:"CVE-2006-7108", value:TRUE);
}
exit(0, "Host is not affected");
