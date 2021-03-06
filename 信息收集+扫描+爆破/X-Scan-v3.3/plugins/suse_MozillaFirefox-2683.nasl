
#
# (C) Tenable Network Security
#
# The text description of this plugin is (C) Novell, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(29359);
 script_version ("$Revision: 1.8 $");
 script_name(english: "SuSE Security Update:  Security update for MozillaFirefox (MozillaFirefox-2683)");
 script_set_attribute(attribute: "synopsis", value: 
"The remote SuSE system is missing the security patch MozillaFirefox-2683");
 script_set_attribute(attribute: "description", value: "This update brings Mozilla Firefox to security update
version 1.5.0.10.

- MFSA 2007-01: As part of the Firefox 2.0.0.2  and
  1.5.0.10 update releases several bugs were fixed to
  improve the stability of the browser. Some of these were
  crashes that showed evidence of memory corruption and we
  presume that with enough effort at least some of these
  could be exploited to run arbitrary code. These fixes
  affected the layout engine (CVE-2007-0775), SVG renderer
  (CVE-2007-0776) and javascript engine (CVE-2007-0777).

- MFSA 2007-02: Various enhancements were done to make XSS
  exploits against websites less effective. These included
  fixes for invalid trailing characters (CVE-2007-0995),
  child frame character set inheritance (CVE-2007-0996),
  password form injection (CVE-2006-6077), and the Adobe
  Reader universal XSS problem.

- MFSA 2007-03/CVE-2007-0778: AAd reported a potential disk
  cache collision that could be exploited by remote
  attackers to steal confidential data or execute code.

- MFSA 2007-04/CVE-2007-0779: David Eckel reported that
  browser UI elements--such as the host name and security
  indicators--could be spoofed by using a large, mostly
  transparent, custom cursor and adjusting the CSS3 hotspot
  property so that the visible part of the cursor floated
  outside the browser content area.

- MFSA 2007-05: Manually opening blocked popups could be
  exploited by remote attackers to allow XSS attacks
  (CVE-2007-0780) or to execute code in local files
  (CVE-2007-0800).

- MFSA 2007-06: Two buffer overflows were found in the NSS
  handling of Mozilla.

  CVE-2007-0008: SSL clients such as Firefox and
Thunderbird can suffer a buffer overflow if a malicious
server presents a certificate with a public key that is too
small to encrypt the entire 'Master Secret'. Exploiting
this overflow appears to be unreliable but possible if the
SSLv2 protocol is enabled.

  CVE-2007-0009: Servers that use NSS for the SSLv2
protocol can be exploited by a client that presents a
'Client Master Key' with invalid length values in any of
several fields that are used without adequate error
checking. This can lead to a buffer overflow that
presumably could be exploitable.

- MFSA 2007-06/CVE-2007-0981: Michal Zalewski demonstrated
  that setting location.hostname to a value with embedded
  null characters can confuse the browsers domain checks.
  Setting the value triggers a load, but the networking
  software reads the hostname only up to the null character
  while other checks for 'parent domain' start at the right
  and so can have a completely different idea of what the
  current host is.
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
script_set_attribute(attribute: "solution", value: "Install the security patch MozillaFirefox-2683");
script_end_attributes();

script_cve_id("CVE-2006-6077", "CVE-2007-0008", "CVE-2007-0009", "CVE-2007-0775", "CVE-2007-0776", "CVE-2007-0777", "CVE-2007-0778", "CVE-2007-0779", "CVE-2007-0780", "CVE-2007-0800", "CVE-2007-0981", "CVE-2007-0995", "CVE-2007-0996");
script_summary(english: "Check for the MozillaFirefox-2683 package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "SuSE Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/SuSE/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/SuSE/rpm-list") ) exit(1, "Could not gather the list of packages");

if ( rpm_check( reference:"MozillaFirefox-1.5.0.10-0.2", release:"SLES10") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"MozillaFirefox-translations-1.5.0.10-0.2", release:"SLES10") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"MozillaFirefox-1.5.0.10-0.2", release:"SLED10") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"MozillaFirefox-translations-1.5.0.10-0.2", release:"SLED10") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
# END OF TEST
exit(0,"Host is not affected");
