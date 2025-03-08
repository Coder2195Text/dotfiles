-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font_with_fallback({ "Iosevka Nerd Font", "Noto Color Emoji" })
config.initial_cols = 180
config.initial_rows = 39
config.font_size = 11
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.background = {
	{
		source = { Color = "#1e1e2e" },
		opacity = 0.9,
		width = "100%",
		height = "100%",
	},
}

config.enable_wayland = false

config.colors = {
	tab_bar = {
		-- The color of the strip that goes along the top of the window
		-- (does not apply when fancy tab bar is in use)
		background = "#1e1e2e",

		-- Inactive tabs are the tabs that do not have focus
		inactive_tab = {
			bg_color = "#1e1e2e",
			fg_color = "#cdd6f4",

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab`.
		},

		-- You can configure some alternate styling when the mouse pointer
		-- moves over inactive tabs
		inactive_tab_hover = {
			bg_color = "#6c7086",

			fg_color = "#cdd6f4",

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab_hover`.
		},

		-- The new tab button that let you create new tabs
		new_tab = {
			bg_color = "#1e1e2e",

			fg_color = "#cdd6f4",
			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `new_tab`.
		},

		-- You can configure some alternate styling when the mouse pointer
		-- moves over the new tab button
		new_tab_hover = {
			bg_color = "#6c7086",

			fg_color = "#cdd6f4",
			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `new_tab_hover`.
		},
	},
}

-- wezterm.on('gui-startup', function(cmd)
--   local tab, pane, window = mux.spawn_window(cmd or {})
--   window:gui_window():maximize()
-- end)
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local color = { ["local"] = "#1e1e2e" } -- change local to that domain for powershell
	local background = color[tab.active_pane.domain_name]
	return {
		{ background = { color = background } },
		{ text = tab.active_pane.title },
	}
end)
-- and finally, return the configuration to wezterm
return config
