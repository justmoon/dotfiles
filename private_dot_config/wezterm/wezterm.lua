local wezterm = require 'wezterm'
local dracula = require 'dracula'
local mux = wezterm.mux

-- Will become available in next release of Wezterm
--//wezterm.on("gui-startup", function(cmd)
--  local tab, pane, window = mux.spawn_window(cmd or {})
--  window:gui_window():maximize()
--end)

return {
  colors = dracula,
  use_fancy_tab_bar = false,
  window_decorations = "RESIZE",
  font = wezterm.font_with_fallback {
    'MonoLisa',
    'Symbols Nerd Font',
  },
}
