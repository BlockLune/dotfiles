local wezterm = require 'wezterm';
local config = wezterm.config_builder()
config = {
    automatically_reload_config = true,
    color_scheme = "Dracula (Official)",
    default_prog = { "C:\\Program Files\\PowerShell\\7\\pwsh.exe" },
    font = wezterm.font 'Fira Code',
    font_size = 14,
    tab_bar_at_bottom = true,
    use_fancy_tab_bar = false,
    window_padding = { left = 16, right = 16, top = 0, bottom = 0 },
    window_background_opacity = 0.95,
}
return config
