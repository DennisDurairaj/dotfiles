-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "catppuccin-mocha"
-- config.default_domain = "WSL:Ubuntu"
config.font = wezterm.font("JetBrains Mono", { weight = "DemiBold" })
config.font_size = 16.0
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.enable_tab_bar = false

-- and finally, return the configuration to wezterm
return config
