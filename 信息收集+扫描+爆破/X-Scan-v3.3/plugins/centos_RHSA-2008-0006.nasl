#
# (C) Tenable Network Security, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);

if ( description )
{
 script_id(29967);
 script_version("$Revision: 1.5 $");
 script_name(english:"CentOS : RHSA-2008-0006");
 script_set_attribute(attribute: "synopsis", value: "The remote host is missing a security update.");
 script_set_attribute(attribute: "description", value: 
"The remote CentOS system is missing a security update which has been 
documented in Red Hat advisory RHSA-2008-0006.");
 script_set_attribute(attribute: "see_also", value:
"https://rhn.redhat.com/errata/RHSA-2008-0006.html");
 script_set_attribute(attribute: "solution", value:
"Upgrade to the newest packages by doing :

  yum update");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:N/I:P/A:N");
script_end_attributes();

script_cve_id("CVE-2007-4465","CVE-2007-5000","CVE-2007-6388","CVE-2008-0005");

 script_summary(english:"Checks for missing updates on the remote CentOS system");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is (C) 2009 Tenable Network Security, Inc.");
 script_family(english:"CentOS Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/CentOS/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/CentOS/rpm-list") ) exit(1, "Could not obtain the list of packages");

if ( rpm_check(reference:"httpd-2.0.52-38.ent.centos4.2", release:"CentOS-4.2", cpu:"i386") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"httpd-devel-2.0.52-38.ent.centos4.2", release:"CentOS-4.2", cpu:"i386") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"httpd-manual-2.0.52-38.ent.centos4.2", release:"CentOS-4.2", cpu:"i386") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"httpd-suexec-2.0.52-38.ent.centos4.2", release:"CentOS-4.2", cpu:"i386") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mod_ssl-2.0.52-38.ent.centos4.2", release:"CentOS-4.2", cpu:"i386") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"httpd-2.0.52-38.ent.centos4.2", release:"CentOS-4.2", cpu:"x86_64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"httpd-devel-2.0.52-38.ent.centos4.2", release:"CentOS-4.2", cpu:"x86_64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"httpd-manual-2.0.52-38.ent.centos4.2", release:"CentOS-4.2", cpu:"x86_64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"httpd-suexec-2.0.52-38.ent.centos4.2", release:"CentOS-4.2", cpu:"x86_64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mod_ssl-2.0.52-38.ent.centos4.2", release:"CentOS-4.2", cpu:"x86_64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"httpd-2.0.52-38.ent.centos4.2", release:"CentOS-4.2", cpu:"ia64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"httpd-devel-2.0.52-38.ent.centos4.2", release:"CentOS-4.2", cpu:"ia64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"httpd-manual-2.0.52-38.ent.centos4.2", release:"CentOS-4.2", cpu:"ia64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"httpd-suexec-2.0.52-38.ent.centos4.2", release:"CentOS-4.2", cpu:"ia64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check(reference:"mod_ssl-2.0.52-38.ent.centos4.2", release:"CentOS-4.2", cpu:"ia64") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host is not affected");
