
#
# (C) Tenable Network Security
#
# This plugin text was extracted from Mandrake Linux Security Advisory ADVISORY
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(24617);
 script_version ("$Revision: 1.3 $");
 script_name(english: "MDKSA-2006:234: mono");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory MDKSA-2006:234 (mono).");
 script_set_attribute(attribute: "description", value: "XSP (the Mono ASP.NET server) is vulnerable to source disclosure attack
which allow a malicious user to obtain the source code of the
server-side application. This vulnerability grants the attacker deeper
knowledge of the Web application logic.
Updated packages have been patched to correct this issue.
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:N/A:N");
script_set_attribute(attribute: "see_also", value: "http://wwwnew.mandriva.com/security/advisories?name=MDKSA-2006:234");
script_set_attribute(attribute: "solution", value: "Apply the newest security patches from Mandriva.");
script_end_attributes();

script_cve_id("CVE-2006-6104");
script_summary(english: "Check for the version of the mono package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "Mandriva Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Mandrake/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/Mandrake/rpm-list") ) exit(1, "Could not get the list of packages");

if ( rpm_check( reference:"jay-1.1.17.1-5.2mdv2007.0", release:"MDK2007.0", yank:"mdv") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libmono-runtime-1.1.17.1-5.2mdv2007.0", release:"MDK2007.0", yank:"mdv") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libmono0-1.1.17.1-5.2mdv2007.0", release:"MDK2007.0", yank:"mdv") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libmono0-devel-1.1.17.1-5.2mdv2007.0", release:"MDK2007.0", yank:"mdv") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"mono-1.1.17.1-5.2mdv2007.0", release:"MDK2007.0", yank:"mdv") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"mono-data-sqlite-1.1.17.1-5.2mdv2007.0", release:"MDK2007.0", yank:"mdv") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"mono-doc-1.1.17.1-5.2mdv2007.0", release:"MDK2007.0", yank:"mdv") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if (rpm_exists(rpm:"mono-", release:"MDK2007.0") )
{
 set_kb_item(name:"CVE-2006-6104", value:TRUE);
}
exit(0, "Host is not affected");
