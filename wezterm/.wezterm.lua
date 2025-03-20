-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.max_fps = 120

config.color_scheme = "Solarized Dark - Patched"
-- config.color_scheme = "Tokyo Night Moon"

config.font = wezterm.font("PlemolJP Console NF")
config.font_size = 18

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.window_background_opacity = 0.75
config.macos_window_background_blur = 10

-- and finally, return the configuration to wezterm
return config
