# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200409-33.xml
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
 script_id(14811);
 script_version("$Revision: 1.7 $");
 script_xref(name: "GLSA", value: "200409-33");
 script_cve_id("CVE-2004-0811");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200409-33 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200409-33
(Apache: Exposure of protected directories)


    A bug in the way Apache handles the Satisfy directive, which is used to
    require that certain conditions (client host, client authentication, etc)
    be met before access to a certain directory is granted, could allow the
    exposure of protected directories to unauthorized clients.
  
Impact

    Directories containing protected data could be exposed to all visitors to
    the webserver.
  
Workaround

    There is no known workaround at this time.
  
');
script_set_attribute(attribute:'solution', value: '
    All Apache users should upgrade to the latest version:
    # emerge sync
    # emerge -pv ">=www-servers/apache-2.0.51-r1"
    # emerge ">=www-servers/apache-2.0.51-r1"
  ');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P');
script_set_attribute(attribute: 'see_also', value: 'http://issues.apache.org/bugzilla/show_bug.cgi?id=31315');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CAN-2004-0811');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200409-33.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200409-33] Apache: Exposure of protected directories');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'Apache: Exposure of protected directories');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "www-servers/apache", unaffected: make_list("ge 2.0.51-r1", "lt 2.0.51"), vulnerable: make_list("eq 2.0.51")
)) { security_hole(0); exit(0); }
exit(0, "Host is not affected");
