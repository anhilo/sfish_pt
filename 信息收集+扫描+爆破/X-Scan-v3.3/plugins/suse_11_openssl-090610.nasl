
#
# (C) Tenable Network Security, Inc.
#
# The text description of this plugin is (C) Novell, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(41443);
 script_version("$Revision: 1.1 $");
 script_name(english: "SuSE Security Update:  openssl (2009-06-10)");
 script_set_attribute(attribute: "synopsis", value: 
"The remote SuSE system is missing a security patch for openssl");
 script_set_attribute(attribute: "description", value: "OpenSSL DTLS remote DoS in ChangeCipherSpec (CVE-2009-1386)
and in out-of-sequence message handling (CVE-2009-1387)
have been fixed.
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:P");
script_set_attribute(attribute: "solution", value: "Run yast to install the security patch for openssl");
script_set_attribute(attribute: "see_also", value: "https://bugzilla.novell.com/show_bug.cgi?id=509031");
script_end_attributes();

 script_cve_id("CVE-2009-1386", "CVE-2009-1387");
script_summary(english: "Check for the openssl package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
 script_family(english: "SuSE Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/SuSE/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/SuSE/rpm-list") ) exit(1, "Could not gather the list of packages");
if ( rpm_check( reference:"libopenssl0_9_8-0.9.8h-30.14.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"openssl-0.9.8h-30.14.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"openssl-doc-0.9.8h-30.14.1", release:"SLES11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"libopenssl0_9_8-0.9.8h-30.14.1", release:"SLED11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
if ( rpm_check( reference:"openssl-0.9.8h-30.14.1", release:"SLED11", cpu:"i586") )
{
	security_warning(port:0, extra:rpm_report_get() );
	exit(0);
}
# END OF TEST
exit(0,"Host is not affected");
