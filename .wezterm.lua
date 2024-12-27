local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- general --
config.automatically_reload_config = true
config.color_scheme = 'Dracula (Official)'
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.window_padding = { left = 16, right = 16, top = 16, bottom = 16 }

-- font --
config.font = wezterm.font_with_fallback { 'FiraCode Nerd Font Mono', 'Fira Code', 'PingFang SC', 'Microsoft YaHei' }
config.font_size = 14

-- Windows --
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.default_prog = { 'C:\\Program Files\\PowerShell\\7\\pwsh.exe' }
  config.keys = {
    -- copy & paste
    { key = 'c',  mods = 'ALT', action = wezterm.action.CopyTo('Clipboard') },
    { key = 'v',  mods = 'ALT', action = wezterm.action.PasteFrom('Clipboard') },
    -- search --
    { key = 'f',  mods = 'ALT', action = wezterm.action.Search({ CaseInSensitiveString = '' }) },
    -- tab --
    { key = 't',  mods = 'ALT', action = wezterm.action.SpawnTab('CurrentPaneDomain') },
    { key = '[',  mods = 'ALT', action = wezterm.action.ActivateTabRelative(-1) },
    { key = ']',  mods = 'ALT', action = wezterm.action.ActivateTabRelative(1) },
    { key = '1',  mods = 'ALT', action = wezterm.action.ActivateTab(0) },
    { key = '2',  mods = 'ALT', action = wezterm.action.ActivateTab(1) },
    { key = '3',  mods = 'ALT', action = wezterm.action.ActivateTab(2) },
    { key = '4',  mods = 'ALT', action = wezterm.action.ActivateTab(3) },
    { key = '5',  mods = 'ALT', action = wezterm.action.ActivateTab(4) },
    { key = '6',  mods = 'ALT', action = wezterm.action.ActivateTab(5) },
    { key = '7',  mods = 'ALT', action = wezterm.action.ActivateTab(6) },
    { key = '8',  mods = 'ALT', action = wezterm.action.ActivateTab(7) },
    { key = '9',  mods = 'ALT', action = wezterm.action.ActivateTab(-1) },
    -- pane --
    { key = 'w',  mods = 'ALT', action = wezterm.action.CloseCurrentPane { confirm = true } },
    { key = '-',  mods = 'ALT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = '\\', mods = 'ALT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 'h',  mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Left' },
    { key = 'j',  mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Down' },
    { key = 'k',  mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Up' },
    { key = 'l',  mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Right' },
  }
  config.win32_system_backdrop = 'Mica'
  config.window_background_opacity = 0
end

-- macOS (Apple Silicon) --
if wezterm.target_triple == 'aarch64-apple-darwin' then
  config.keys = {
    { key = 'Enter', mods = 'SUPER', action = wezterm.action.ToggleFullScreen },
    -- search --
    { key = 'f',     mods = 'SUPER', action = wezterm.action.Search({ CaseInSensitiveString = '' }) },
    -- tab --
    { key = '[',     mods = 'SUPER', action = wezterm.action.ActivateTabRelative(-1) },
    { key = ']',     mods = 'SUPER', action = wezterm.action.ActivateTabRelative(1) },
    -- pane --
    { key = '-',     mods = 'SUPER', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = '\\',    mods = 'SUPER', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = 'h',     mods = 'SUPER', action = wezterm.action.ActivatePaneDirection 'Left' },
    { key = 'j',     mods = 'SUPER', action = wezterm.action.ActivatePaneDirection 'Down' },
    { key = 'k',     mods = 'SUPER', action = wezterm.action.ActivatePaneDirection 'Up' },
    { key = 'l',     mods = 'SUPER', action = wezterm.action.ActivatePaneDirection 'Right' },
  }
  config.macos_window_background_blur = 20
  config.window_background_opacity = 0.75
end

return config
