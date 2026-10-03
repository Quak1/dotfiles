---@diagnostic disable: undefined-global

local paneru = require("paneru")

paneru.setup({
	options = {
		focus_follows_mouse = false,
		mouse_follows_focus = false,
		preset_column_widths = { 0.25, 0.33, 0.5, 0.66, 0.75 },
		reap_empty_workspaces = true,
	},
	swipe = {
		gesture = {
			fingers_count = 4,
		},
		scroll = {},
	},
	padding = {},
	decorations = {
		active = {
			border = {
				enabled = true,
				color = "#febc2e",
				opacity = 1.0,
				width = 2.0,
				radius = "auto",
			},
		},
	},
	bindings = {
		["window focus west"] = "alt - h",
		["window focus east"] = "alt - l",
		["window swap west"] = "alt + shift - h",
		["window swap east"] = "alt + shift - l",
		["window swap north"] = "alt + shift - k",
		["window swap south"] = "alt + shift - j",
		["window virtual north"] = "alt + ctrl - k",
		["window virtual south"] = "alt + ctrl - j",
		["window virtualmove north"] = "alt + ctrl + shift - k",
		["window virtualmove south"] = "alt + ctrl + shift - j",
		["window virtualsendnum 1"] = "alt + ctrl - 1",
		["window center"] = "alt - c",
		["window resize"] = "alt - r",
		["window shrink"] = "alt + shift - r",
		["window fullwidth"] = "alt - f",
		["window manage"] = "alt + shift - z",
		["window stack"] = "alt - ]",
		["window unstack"] = "alt + shift - ]",
		["window nextdisplay"] = "alt + shift - n",
		["mouse nextdisplay"] = "alt - n",
		["window equalize"] = "alt + shift - e",
		["quit"] = "ctrl + alt - q",
	},
	windows = {
		pip = {
			title = "Picture.*(in)?.*[Pp]icture",
			floating = true,
		},
		neovide = {
			title = "Neovide.*",
			index = 1,
			width = 0.5,
			bindings_passthrough = { "ctrl-h", "ctrl-l" },
		},
		popup = {
			title = "Unimportant popup window",
			dont_focus = true,
			index = 100,
		},
		passwords = {
			title = "Passwords.*",
			floating = true,
			grid = "6:6:1:1:4:4",
		},
		focus = {
			title = "Exocus",
			floating = true,
			dont_focus = true,
		},
		["finder-server"] = {
			title = "Connect to Server",
			floating = true,
		},
		MacMouseFix = {
			title = "Mac Mouse Fix",
			floating = true,
		},
		FinderSettings = {
			title = "Finder Settings",
			floating = true,
		},
		Printer = {
			title = "Canon.*",
			floating = true,
		},
		["firefox-download"] = {
			title = "Opening .*",
			floating = true,
		},
		AutodeskFusionSide = {
			bundle_id = "com.autodesk.fusion360",
			title = ".*",
			floating = true,
		},
		AutodeskFusionMain = {
			bundle_id = "com.autodesk.fusion360",
			title = ".*Autodesk Fusion Personal.*",
			floating = false,
		},
		all = {
			title = ".*",
			horizontal_padding = 2,
			vertical_padding = 0,
		},
	},
})
