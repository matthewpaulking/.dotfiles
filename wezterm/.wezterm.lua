local wezterm = require("wezterm")

local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

local nightfox = wezterm.color.get_builtin_schemes()["nightfox"]
nightfox.background = "#11161d"
config = {
	leader = { key = "b", mods = "CTRL" },
	color_schemes = { ["nightfox"] = nightfox },
	color_scheme = "nightfox",
	window_frame = {
		active_titlebar_bg = "#11161d",
		inactive_titlebar_bg = "#11161d",
		font = wezterm.font("MonoLisa Variable", { weight = 700 }),
		font_size = 13,
	},
	colors = {
		tab_bar = {
			new_tab = {
				bg_color = "#11161d",
				fg_color = "#c0c0c0",
				intensity = "Bold",
			},
			new_tab_hover = {
				bg_color = "#11161d",
				fg_color = "#c0c0c0",
				intensity = "Bold",
			},
		},
	},
	font = wezterm.font("MonoLisa Variable"),
	font_size = 18,
	line_height = 1.6,
	underline_position = -7,
	window_padding = {
		left = "1.5cell",
		right = "1.5cell",
		top = "0.4cell",
		bottom = "0.2cell",
	},
	window_decorations = "RESIZE",
	window_close_confirmation = "NeverPrompt",
	enable_tab_bar = true,
	adjust_window_size_when_changing_font_size = false,
	keys = {
		-- { key = "t", mods = "SUPER", action = wezterm.action.Nop },
		{ key = "\\", mods = "CTRL", action = wezterm.action.ShowDebugOverlay },
		{ key = "x", mods = "LEADER", action = wezterm.action.CloseCurrentPane({ confirm = true }) },

		{ key = "h", mods = "SUPER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
		{ key = "j", mods = "SUPER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
		{ key = "k", mods = "SUPER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
		{ key = "l", mods = "SUPER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
		{
			key = "5",
			mods = "LEADER",
			action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
		},
		{
			key = "4",
			mods = "LEADER",
			action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }),
		},
		{ key = "k", mods = "ALT|SHIFT|SUPER", action = wezterm.action.SwitchWorkspaceRelative(1) },
		{ key = "j", mods = "ALT|SHIFT|SUPER", action = wezterm.action.SwitchWorkspaceRelative(-1) },
		{ key = "n", mods = "ALT|SHIFT|SUPER", action = wezterm.action.SwitchToWorkspace },
		{ key = "n", mods = "SHIFT|SUPER", action = wezterm.action.SpawnWindow },
		{ key = "j", mods = "SHIFT|SUPER", action = wezterm.action.ActivateWindowRelative(1) },
		{ key = "k", mods = "SHIFT|SUPER", action = wezterm.action.ActivateWindowRelative(-1) },
		{ key = "t", mods = "LEADER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
		{
			key = "c",
			mods = "LEADER",
			action = wezterm.action.PromptInputLine({
				description = "Enter new name for tab",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
		{
			key = "w",
			mods = "LEADER",
			action = wezterm.action.ShowLauncherArgs({
				flags = "FUZZY|WORKSPACES",
			}),
		},
		{
			key = "s",
			mods = "LEADER",
			action = wezterm.action.PromptInputLine({
				description = "Enter new name for workspace",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
					end
				end),
			}),
		},
	},
	front_end = "WebGpu", -- Temp: This is new default in nightly, can remove later!
}

function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local edge_background = "#11161d"
	local background = "#11161d"
	local foreground = "#c0c0c0"

	if tab.is_active then
		background = "#649ddb"
		foreground = "#11161d"
	elseif hover then
		background = "#649ddb"
		foreground = "#11161d"
	end

	local edge_foreground = background

	local title = " " .. string.upper(tab_title(tab)) .. " "

	-- ensure that the titles fit in the available space,
	-- and that we have room for the edges.
	-- title = wezterm.truncate_right(title, max_width - 2)

	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
	}
end)

wezterm.on("update-right-status", function(window, pane)
	-- window:set_right_status(window:active_workspace())
	local workspace_name = window:active_workspace()
	window:set_right_status(wezterm.format({
		-- { Attribute = { Underline = 'Dotted' } },
		{ Background = { Color = "#11161d" } },
		{ Text = workspace_name .. "    " },
	}))
end)

return config
