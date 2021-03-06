# This script was automatically generated from the dsa-1464
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(29984);
 script_version("$Revision: 1.4 $");
 script_xref(name: "DSA", value: "1464");
 script_cve_id("CVE-2007-6437");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-1464 security update');
 script_set_attribute(attribute: 'description', value:
'Oriol Carreras discovered that syslog-ng, a next generation logging
daemon can be tricked into dereferencing a NULL pointer through
malformed timestamps, which can lead to denial of service and the
disguise of an subsequent attack, which would otherwise be logged.


The old stable distribution (sarge) is not affected.


For the stable distribution (etch), this problem has been fixed in
version 2.0.0-1etch1.

');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2008/dsa-1464');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your syslog-ng package.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:P');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA1464] DSA-1464-1 syslog-ng");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-1464-1 syslog-ng");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'syslog-ng', release: '4.0', reference: '2.0.0-1etch1');
if (deb_report_get()) security_warning(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
