-- Copyright (C) 2019 Xusser
-- Licensed to the public under the GNU General Public License v3.

module("luci.controller.goquiet", package.seeall)

function index()
	entry({"admin", "services", "goquiet"}, cbi("goquiet"), _("GoQuiet"), 100)
end

local function is_running(name)
	return luci.sys.call("pidof %s >/dev/null" %{name}) == 0
end

function action_status()
	luci.http.prepare_content("application/json")
	luci.http.write_json({
		goquiet_client = is_running("gq-client"),
	})
end
