local wezterm = require 'wezterm'

local config = wezterm.config_builder()
local act = wezterm.action

config.audible_bell = "Disabled"

config.color_scheme = "duskfox"
config.color_schemes = {
['duskfox'] = {
background = 'black',
}
}

config.colors = {
	tab_bar = {
		background = 'black',
		active_tab = {
			bg_color = '#393552',
			fg_color = '#e0def4',
		},
		inactive_tab = {
			bg_color = 'black',
			fg_color = '#6e6a86',
		},
		inactive_tab_hover = {
			bg_color = '#232136',
			fg_color = '#e0def4',
		},
		new_tab = {
			bg_color = 'black',
			fg_color = 'black',
		},
		new_tab_hover = {
			bg_color = 'black',
			fg_color = 'black',
		},
	},
}

config.font = wezterm.font "Fira Code"
config.font_size = 14.0

config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 8,
}

config.line_height = 1.0

config.window_decorations = 'NONE'
config.window_close_confirmation = 'NeverPrompt'
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = false


config.enable_wayland = false
config.default_workspace = 'main'

config.keys = {
	{ key = 'Enter', mods = 'ALT',       action = act.SpawnTab 'CurrentPaneDomain' },
	{ key = 'v',     mods = 'ALT',       action = act.ActivateCopyMode },
	{ key = 't',     mods = 'ALT|SHIFT', action = wezterm.action.ShowLauncherArgs { flags = 'TABS' } },

	-- Panes
	{ key = 'w',     mods = 'ALT',       action = act.CloseCurrentPane({ confirm = true }) },
	{ key = 'h',     mods = 'ALT|SHIFT', action = wezterm.action.SplitPane { direction = 'Left', size = { Percent = 50 }, } },
	{ key = 'j',     mods = 'ALT|SHIFT', action = wezterm.action.SplitPane { direction = 'Down', size = { Percent = 50 }, } },
	{ key = 'k',     mods = 'ALT|SHIFT', action = wezterm.action.SplitPane { direction = 'Up', size = { Percent = 50 }, } },
	{ key = 'l',     mods = 'ALT|SHIFT', action = wezterm.action.SplitPane { direction = 'Right', size = { Percent = 50 }, } },
	-- Tabs (vim navigation)
	{ key = 'h',     mods = 'ALT',       action = act.ActivateTabRelative(-1) },
	{ key = 'l',     mods = 'ALT',       action = act.ActivateTabRelative(1) },
	{ key = 'q',     mods = 'ALT',       action = act.CloseCurrentTab({ confirm = true }) },
	{ key = '1',     mods = 'ALT',       action = act.ActivateTab(0) },
	{ key = '2',     mods = 'ALT',       action = act.ActivateTab(1) },
	{ key = '3',     mods = 'ALT',       action = act.ActivateTab(2) },
	{ key = '4',     mods = 'ALT',       action = act.ActivateTab(3) },
	{ key = '5',     mods = 'ALT',       action = act.ActivateTab(4) },

	-- Workspaces (vim navigation)
	{ key = 'j',     mods = 'ALT',       action = act.SwitchWorkspaceRelative(1) },
	{ key = 'k',     mods = 'ALT',       action = act.SwitchWorkspaceRelative(-1) },
	{ key = 'f',     mods = 'ALT',       action = act.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' } },
	{ key = 'Enter', mods = 'ALT|SHIFT', action = act.PromptInputLine {
		description = 'Enter workspace name:',
		action = wezterm.action_callback(function(window, pane, line)
			if line then
				window:perform_action(act.SwitchToWorkspace { name = line }, pane)
			end
		end),
	}},

}

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
	local process = tab.active_pane.foreground_process_name
	if process then
		process = process:match("([^/\\]+)$")
	end
	local title = (tab.tab_index + 1) .. ': ' .. (process or 'unknown')
	
	local bg = 'black'
	local fg = '#6e6a86'
	
	if tab.is_active then
		bg = '#393552'
		fg = '#e0def4'
	elseif hover then
		bg = '#232136'
		fg = '#e0def4'
	end
	
	return {
		{ Background = { Color = bg } },
		{ Foreground = { Color = fg } },
		{ Text = ' ' .. title .. ' ' },
	}
end)

wezterm.on('update-right-status', function(window, pane)
	local workspace = window:active_workspace()
	local tab_count = #window:mux_window():tabs()
	local tab_idx = window:active_tab():tab_id()
	
	window:set_right_status(wezterm.format {
		{ Foreground = { Color = '#6e6a86' } },
		{ Text = ' ' .. workspace .. ' ' },
		{ Foreground = { Color = '#393552' } },
		{ Text = '│' },
		{ Foreground = { Color = '#6e6a86' } },
		{ Text = ' ' .. (tab_idx + 1) .. '/' .. tab_count .. ' ' },
	})
end)

return config
