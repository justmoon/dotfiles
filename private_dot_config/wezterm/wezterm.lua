local wezterm = require("wezterm")
local mux = wezterm.mux
local act = wezterm.action
local projects = require("menus.projects")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.leader = { key = "b", mods = "CTRL" }

config.keys = {}

for i = 1, 8 do
	-- CTRL + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CTRL",
		action = act.ActivateTab(i - 1),
	})
end

local projects_input_selector = projects.get_input_selector()
table.insert(config.keys, {
	key = "e",
	mods = "LEADER",
	action = wezterm.action.InputSelector(projects_input_selector),
})

config.mouse_bindings = {
	-- Change the default click behavior so that it only selects
	-- text and doesn't open hyperlinks
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = act.CompleteSelection("ClipboardAndPrimarySelection"),
	},

	-- and make CTRL-Click open hyperlinks
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = act.OpenLinkAtMouseCursor,
	},
}

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
	"Monaspace Neon",
	"IBM Plex Mono",
	"Symbols Nerd Font",
})

config.harfbuzz_features = { 'calt', 'liga', 'ss01', 'ss02', 'ss03', 'ss04' }

config.freetype_load_target = "HorizontalLcd"

config.warn_about_missing_glyphs = false

config.check_for_updates = false

config.enable_scroll_bar = true

config.initial_cols = 100

config.initial_rows = 28

return config
