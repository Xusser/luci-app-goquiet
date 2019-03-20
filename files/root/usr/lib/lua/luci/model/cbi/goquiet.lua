-- Copyright (C) 2019 Xusser
-- Licensed to the public under the GNU General Public License v3.

require("luci.sys")

m = Map("goquiet", translate("GoQuiet"), translate("GoQuiet客户端控制"))

s = m:section(TypedSection, "goquiet", "")
s.addremove = false
s.anonymous = true

enable = s:option(Flag, "enable", translate("使能"))
remoteIP = s:option(Value, "remoteIP", translate("服务器IP"))
remotePort = s:option(Value, "remotePort", translate("服务器端口"))
localPort = s:option(Value, "localPort", translate("本地端口"))
ServerName = s:option(Value, "ServerName", translate("SNI伪装名"))
Key = s:option(Value, "Key", translate("密钥"))
Key.password = true
TicketTimeHint = s:option(Value, "TicketTimeHint", translate("Ticket超时时间"))
Browser = s:option(Value, "Browser", translate("浏览器"))

local apply = luci.http.formvalue("cbi.apply")
if apply then
	io.popen("/etc/init.d/goquiet restart")
end

return m
