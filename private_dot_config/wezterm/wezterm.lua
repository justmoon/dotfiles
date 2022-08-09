local wezterm = require("wezterm")
local dracula = require("dracula")
local mux = wezterm.mux
local act = wezterm.action

local mykeys = {}
for i = 1, 8 do
	-- CTRL+ALT + number to activate that tab
	table.insert(mykeys, {
		key = tostring(i),
		mods = "CTRL",
		action = act.ActivateTab(i - 1),
	})
end

-- Will become available in next release of Wezterm
--//wezterm.on("gui-startup", function(cmd)
--  local tab, pane, window = mux.spawn_window(cmd or {})
--  window:gui_window():maximize()
--end)

return {
	colors = dracula,
	use_fancy_tab_bar = false,
	window_decorations = "RESIZE",
	font = wezterm.font_with_fallback({
		"MonoLisa",
		"Symbols Nerd Font",
	}),
	keys = mykeys,
}
