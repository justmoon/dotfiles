local wezterm = require("wezterm")
local mux = wezterm.mux
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.keys = {}

for i = 1, 8 do
	-- CTRL + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CTRL",
		action = act.ActivateTab(i - 1),
	})
end

-- Start maximized
wezterm.on("gui-startup", function(cmd)
	local _, _, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

config.color_scheme = "Dracula (Official)"

config.use_fancy_tab_bar = false

config.hide_tab_bar_if_only_one_tab = true

config.window_decorations = "RESIZE"

config.font = wezterm.font_with_fallback({
	"MonoLisa",
	"IBM Plex Mono",
	"Symbols Nerd Font",
})

config.check_for_updates = false

config.enable_scroll_bar = true

config.initial_cols = 100

config.initial_rows = 28

return config
