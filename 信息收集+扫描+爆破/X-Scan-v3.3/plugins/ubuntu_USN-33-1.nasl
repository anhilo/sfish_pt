# This script was automatically generated from the 33-1 Ubuntu Security Notice
# It is released under the Nessus Script Licence.
# Ubuntu Security Notices are (C) 2005 Canonical, Inc.
# USN2nasl Convertor is (C) 2005 Tenable Network Security, Inc.
# See http://www.ubuntulinux.org/usn/
# Ubuntu(R) is a registered trademark of Canonical, Inc.

if (! defined_func("bn_random")) exit(0);
include('compat.inc');

if (description) {
script_id(20649);
script_version("$Revision: 1.5 $");
script_copyright("Ubuntu Security Notice (C) 2009 Canonical, Inc. / NASL script (C) 2009 Tenable Network Security, Inc.");
script_category(ACT_GATHER_INFO);
script_family(english: "Ubuntu Local Security Checks");
script_dependencies("ssh_get_info.nasl");
script_require_keys("Host/Ubuntu", "Host/Ubuntu/release", "Host/Debian/dpkg-l");

script_xref(name: "USN", value: "33-1");
script_summary(english:"libgd vulnerabilities");
script_name(english:"USN33-1 : libgd vulnerabilities");
script_set_attribute(attribute:'synopsis', value: 'These remote packages are missing security patches :
- libgd-dev 
- libgd-noxpm-dev 
- libgd-xpm-dev 
- libgd1 
- libgd1-noxpm 
- libgd1-xpm 
');
script_set_attribute(attribute:'description', value: 'CVE-2004-0990 described several buffer overflows which had been
discovered in libgd\'s PNG handling functions. Another update is
required because the update from USN-21-1 was not sufficient to
prevent every possible attack.

If an attacker tricks a user into loading a malicious PNG or XPM
image, they could leverage this into executing arbitrary code in the
context of the user opening image.

This vulnerability might lead to privilege escalation in customized
systems that use server applications which link libgd. However, Warty
does not ship such server applications (PHP in Warty uses libgd2 which
was already fixed in USN-25-1).');
script_set_attribute(attribute:'solution', value: 'Upgrade to : 
- libgd-dev-1.8.4-36ubuntu0.2 (Ubuntu 4.10)
- libgd-noxpm-dev-1.8.4-36ubuntu0.2 (Ubuntu 4.10)
- libgd-xpm-dev-1.8.4-36ubuntu0.2 (Ubuntu 4.10)
- libgd1-1.8.4-36ubuntu0.2 (Ubuntu 4.10)
- libgd1-noxpm-1.8.4-36ubuntu0.2 (Ubuntu 4.10)
- libgd1-xpm-1.8.4-36ubuntu0.2 (Ubuntu 4.10)
');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C');
script_end_attributes();

script_cve_id("CVE-2004-0941","CVE-2004-0990");
exit(0);
}

include('ubuntu.inc');

if ( ! get_kb_item('Host/Ubuntu/release') ) exit(1, 'Could not gather the list of packages');

extrarep = NULL;

found = ubuntu_check(osver: "4.10", pkgname: "libgd-dev", pkgver: "1.8.4-36ubuntu0.2");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libgd-dev-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to libgd-dev-1.8.4-36ubuntu0.2
');
}
found = ubuntu_check(osver: "4.10", pkgname: "libgd-noxpm-dev", pkgver: "1.8.4-36ubuntu0.2");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libgd-noxpm-dev-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to libgd-noxpm-dev-1.8.4-36ubuntu0.2
');
}
found = ubuntu_check(osver: "4.10", pkgname: "libgd-xpm-dev", pkgver: "1.8.4-36ubuntu0.2");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libgd-xpm-dev-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to libgd-xpm-dev-1.8.4-36ubuntu0.2
');
}
found = ubuntu_check(osver: "4.10", pkgname: "libgd1", pkgver: "1.8.4-36ubuntu0.2");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libgd1-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to libgd1-1.8.4-36ubuntu0.2
');
}
found = ubuntu_check(osver: "4.10", pkgname: "libgd1-noxpm", pkgver: "1.8.4-36ubuntu0.2");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libgd1-noxpm-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to libgd1-noxpm-1.8.4-36ubuntu0.2
');
}
found = ubuntu_check(osver: "4.10", pkgname: "libgd1-xpm", pkgver: "1.8.4-36ubuntu0.2");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libgd1-xpm-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to libgd1-xpm-1.8.4-36ubuntu0.2
');
}

if (w) { security_hole(port: 0, extra: extrarep); }
else exit(0, "Host is not vulnerable");
