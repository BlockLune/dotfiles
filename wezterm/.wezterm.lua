-- ---------------------------------
-- BlockLune's Wezterm Configuration
-- ---------------------------------

local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Platform detection
local is_windows = wezterm.target_triple == "x86_64-pc-windows-msvc"
local is_linux = wezterm.target_triple == "x86_64-unknown-linux-gnu"
local is_macos = wezterm.target_triple == "x86_64-apple-darwin" or wezterm.target_triple == "aarch64-apple-darwin"

-- General configuration
config.automatically_reload_config = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.window_close_confirmation = "NeverPrompt"
config.window_padding = { left = 16, right = 16, top = 16, bottom = 16 }

-- Color scheme configuration
local light_theme = "Github" -- or "Gruvbox (Gogh)", "Catppuccin Latte", etc.
local dark_theme = "GitHub Dark" -- or "Gruvbox Dark (Gogh)", "Catppuccin Mocha", "Dracula (Official)", etc.
local static_theme = dark_theme

local function scheme_for_appearance(appearance)
    -- If static_theme is set, use static theme
    -- Autodetection is not available on Linux, so static theme is always applied on Linux
    if not (static_theme == "") or is_linux then
        return static_theme
    end

    if appearance:find("Dark") then
        return dark_theme
    else
        return light_theme
    end
end

wezterm.on("window-config-reloaded", function(window, _)
    local overrides = window:get_config_overrides() or {}
    local appearance = window:get_appearance()
    local scheme = scheme_for_appearance(appearance)
    if overrides.color_scheme ~= scheme then
        overrides.color_scheme = scheme
        window:set_config_overrides(overrides)
    end
end)

-- Font configuration
config.font = wezterm.font_with_fallback({
    "FiraCode Nerd Font",
    "FiraCode Nerd Font Mono",
    "Maple Mono NF",
    "PingFang SC",
    "Microsoft YaHei",
    "Noto Sans CJK SC",
    "Noto Sans SC",
    "Noto Sans",
})
config.font_size = 14

-- Key mappings
local function create_key_bindings()
    -- Determine modifier key based on platform (cmd on macOS, alt on others)
    local mod_key = is_macos and "SUPER" or "ALT"

    local keys = {
        -- copy & paste
        { key = "c", mods = mod_key, action = wezterm.action.CopyTo("Clipboard") },
        { key = "v", mods = mod_key, action = wezterm.action.PasteFrom("Clipboard") },

        -- search
        { key = "f", mods = mod_key, action = wezterm.action.Search({ CaseInSensitiveString = "" }) },

        -- tab management
        { key = "t", mods = mod_key, action = wezterm.action.SpawnTab("CurrentPaneDomain") },
        { key = "[", mods = mod_key, action = wezterm.action.ActivateTabRelative(-1) },
        { key = "]", mods = mod_key, action = wezterm.action.ActivateTabRelative(1) },

        -- tab direct access
        { key = "1", mods = mod_key, action = wezterm.action.ActivateTab(0) },
        { key = "2", mods = mod_key, action = wezterm.action.ActivateTab(1) },
        { key = "3", mods = mod_key, action = wezterm.action.ActivateTab(2) },
        { key = "4", mods = mod_key, action = wezterm.action.ActivateTab(3) },
        { key = "5", mods = mod_key, action = wezterm.action.ActivateTab(4) },
        { key = "6", mods = mod_key, action = wezterm.action.ActivateTab(5) },
        { key = "7", mods = mod_key, action = wezterm.action.ActivateTab(6) },
        { key = "8", mods = mod_key, action = wezterm.action.ActivateTab(7) },
        { key = "9", mods = mod_key, action = wezterm.action.ActivateTab(-1) },

        -- pane management
        { key = "w", mods = mod_key, action = wezterm.action.CloseCurrentPane({ confirm = true }) },
        { key = "-", mods = mod_key, action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
        {
            key = "d",
            mods = mod_key .. "|SHIFT",
            action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
        },
        {
            key = "\\",
            mods = mod_key,
            action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
        },
        {
            key = "d",
            mods = mod_key,
            action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
        },

        -- pane navigation
        { key = "h", mods = mod_key, action = wezterm.action.ActivatePaneDirection("Left") },
        { key = "j", mods = mod_key, action = wezterm.action.ActivatePaneDirection("Down") },
        { key = "k", mods = mod_key, action = wezterm.action.ActivatePaneDirection("Up") },
        { key = "l", mods = mod_key, action = wezterm.action.ActivatePaneDirection("Right") },

        -- pane size adjustment
        { key = "LeftArrow", mods = mod_key, action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
        { key = "DownArrow", mods = mod_key, action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },
        { key = "UpArrow", mods = mod_key, action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
        { key = "RightArrow", mods = mod_key, action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
    }

    -- macOS specific keys
    if is_macos then
        table.insert(keys, { key = "Enter", mods = "SUPER", action = wezterm.action.ToggleFullScreen })
    end

    return keys
end

-- Apply key bindings
config.keys = create_key_bindings()

-- Platform-specific configurations
if is_windows then
    -- https://github.com/wezterm/wezterm/discussions/3346
    config.wsl_domains = {
        {
            name = "wsl:archlinux",
            distribution = "archlinux",
        }
    }
    config.default_domain = "wsl:archlinux",
    -- config.default_prog = { "C:\\Program Files\\PowerShell\\7\\pwsh.exe" }
elseif is_macos then
    config.macos_window_background_blur = 20
    config.window_background_opacity = 0.85
elseif is_linux then
    config.window_background_opacity = 0.97
end

return config
