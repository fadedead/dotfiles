local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

local colors = {
	bg = "#000000",
	bg_alt = "#121820",
	fg = "#e0def4",
	fg_dim = "#6e6a86",
	red = "#eb6f92",
	green = "#a3be8c",
	yellow = "#f6c177",
	blue = "#569fba",
	magenta = "#eb98c3",
	purple = "#c4a7e7",
	cyan = "#9ccfd8",
	white = "#e0def4",
	orange = "#ea9a97",
	selection_bg = "#131b24",
}

config.audible_bell = "Disabled"
config.color_scheme = "waybar_black"
config.color_schemes = {
	["waybar_black"] = {
		foreground = colors.fg,
		background = colors.bg,
		cursor_bg = colors.purple,
		cursor_fg = colors.bg,
		selection_bg = colors.selection_bg,
		selection_fg = colors.fg,
		scrollbar_thumb = colors.bg_alt,
		split = colors.bg_alt,
		ansi = {
			"#191724",
			colors.red,
			colors.green,
			colors.yellow,
			colors.blue,
			colors.purple,
			colors.cyan,
			colors.white,
		},
		brights = {
			"#26233a",
			colors.red,
			colors.green,
			colors.yellow,
			colors.blue,
			colors.magenta,
			colors.cyan,
			colors.white,
		},
	},
}

config.colors = {
	tab_bar = {
		background = colors.bg,
		active_tab = {
			bg_color = colors.bg_alt,
			fg_color = colors.purple,
		},
		inactive_tab = {
			bg_color = colors.bg,
			fg_color = colors.fg_dim,
		},
		inactive_tab_hover = {
			bg_color = colors.selection_bg,
			fg_color = colors.fg,
		},
		new_tab = {
			bg_color = colors.bg,
			fg_color = colors.bg,
		},
		new_tab_hover = {
			bg_color = colors.bg,
			fg_color = colors.bg,
		},
	},
}

config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })
config.font_size = 14.0
config.line_height = 1.1

config.window_padding = {
	left = 15,
	right = 15,
	top = 15,
	bottom = 0,
}

config.window_background_opacity = 1.0
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = false

config.inactive_pane_hsb = {
	saturation = 0.9,
	brightness = 0.5,
}

config.enable_wayland = false
config.default_workspace = "main"

config.keys = {
	{ key = "Enter", mods = "ALT", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "v", mods = "ALT", action = act.ActivateCopyMode },
	{ key = "t", mods = "ALT|SHIFT", action = wezterm.action.ShowLauncherArgs({ flags = "TABS" }) },

	-- Panes
	{ key = "w", mods = "ALT", action = act.CloseCurrentPane({ confirm = true }) },
	{
		key = "h",
		mods = "ALT|SHIFT",
		action = wezterm.action.SplitPane({ direction = "Left", size = { Percent = 50 } }),
	},
	{
		key = "j",
		mods = "ALT|SHIFT",
		action = wezterm.action.SplitPane({ direction = "Down", size = { Percent = 50 } }),
	},
	{
		key = "k",
		mods = "ALT|SHIFT",
		action = wezterm.action.SplitPane({ direction = "Up", size = { Percent = 50 } }),
	},
	{
		key = "l",
		mods = "ALT|SHIFT",
		action = wezterm.action.SplitPane({ direction = "Right", size = { Percent = 50 } }),
	},

	-- Tabs (vim navigation)
	{ key = "h", mods = "ALT", action = act.ActivateTabRelative(-1) },
	{ key = "l", mods = "ALT", action = act.ActivateTabRelative(1) },
	{ key = "q", mods = "ALT", action = act.CloseCurrentTab({ confirm = true }) },
	{ key = "1", mods = "ALT", action = act.ActivateTab(0) },
	{ key = "2", mods = "ALT", action = act.ActivateTab(1) },
	{ key = "3", mods = "ALT", action = act.ActivateTab(2) },
	{ key = "4", mods = "ALT", action = act.ActivateTab(3) },
	{ key = "5", mods = "ALT", action = act.ActivateTab(4) },

	-- Workspaces (vim navigation)
	{ key = "j", mods = "ALT", action = act.SwitchWorkspaceRelative(1) },
	{ key = "k", mods = "ALT", action = act.SwitchWorkspaceRelative(-1) },
	{ key = "f", mods = "ALT", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
	{
		key = "Enter",
		mods = "ALT|SHIFT",
		action = act.PromptInputLine({
			description = "Enter workspace name:",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:perform_action(act.SwitchToWorkspace({ name = line }), pane)
				end
			end),
		}),
	},
}

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local process = tab.active_pane.foreground_process_name
	if process then
		process = process:match("([^/\\]+)$")
	end
	local title = (tab.tab_index + 1) .. ": " .. (process or "zsh")
	local bg = colors.bg
	local fg = colors.fg_dim
	if tab.is_active then
		bg = colors.bg_alt
		fg = colors.purple
	elseif hover then
		bg = colors.selection_bg
		fg = colors.fg
	end
	return {
		{ Background = { Color = colors.bg } },
		{ Foreground = { Color = bg } },
		{ Text = " " },
		{ Background = { Color = bg } },
		{ Foreground = { Color = fg } },
		{ Text = " " .. title .. " " },
		{ Background = { Color = colors.bg } },
		{ Foreground = { Color = bg } },
		{ Text = " " },
	}
end)

wezterm.on("update-right-status", function(window, pane)
	local workspace = window:active_workspace()
	window:set_right_status(wezterm.format({
		{ Background = { Color = colors.bg_alt } },
		{ Foreground = { Color = colors.purple } },
		{ Text = " " .. workspace .. " " },
	}))
end)

return config
