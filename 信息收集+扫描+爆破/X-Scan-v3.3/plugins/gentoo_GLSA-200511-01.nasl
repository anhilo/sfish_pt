# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200511-01.xml
# It is released under the Nessus Script Licence.
# The messages are release under the Creative Commons - Attribution /
# Share Alike license. See http://creativecommons.org/licenses/by-sa/2.0/
#
# Avisory is copyright 2001-2006 Gentoo Foundation, Inc.
# GLSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description)
{
 script_id(20140);
 script_version("$Revision: 1.5 $");
 script_xref(name: "GLSA", value: "200511-01");
 script_cve_id("CVE-2005-2958");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200511-01 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200511-01
(libgda: Format string vulnerabilities)


    Steve Kemp discovered two format string vulnerabilities in the
    gda_log_error and gda_log_message functions. Some applications may pass
    untrusted input to those functions and be vulnerable.
  
Impact

    An attacker could pass malicious input to an application making
    use of the vulnerable libgda functions, potentially resulting in the
    execution of arbitrary code with the rights of that application.
  
Workaround

    There is no known workaround at this time.
  
');
script_set_attribute(attribute:'solution', value: '
    All libgda users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=gnome-extra/libgda-1.2.2-r1"
  ');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2005-2958');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200511-01.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200511-01] libgda: Format string vulnerabilities');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'libgda: Format string vulnerabilities');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "gnome-extra/libgda", unaffected: make_list("ge 1.2.2-r1"), vulnerable: make_list("lt 1.2.2-r1")
)) { security_hole(0); exit(0); }
exit(0, "Host is not affected");
