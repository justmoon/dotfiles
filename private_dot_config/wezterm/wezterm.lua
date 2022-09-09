local wezterm = require("wezterm")
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

-- Start maximized
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

return {
	color_scheme = "Dracula (Official)",
	use_fancy_tab_bar = false,
	window_decorations = "RESIZE",
	font = wezterm.font_with_fallback({
		"MonoLisa",
		"IBM Plex Mono",
		"Symbols Nerd Font",
	}),
	keys = mykeys,
	check_for_updates = false,
	enable_scroll_bar = true,
	initial_cols = 100,
	initial_rows = 28,
}
