local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.automatically_reload_config = true
config.color_scheme = "Dracula (Official)"
config.font = wezterm.font 'FiraCode Nerd Font Mono'
config.font_size = 14
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.window_padding = { left = 16, right = 16, top = 16, bottom = 16 }

-- Windows --
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.default_prog = { "C:\\Program Files\\PowerShell\\7\\pwsh.exe" }
  config.window_background_opacity = 0.95
end

-- macOS (Apple Silicon) --
if wezterm.target_triple == 'aarch64-apple-darwin' then
  config.macos_window_background_blur = 20
  config.window_background_opacity = 0.75
end

return config

