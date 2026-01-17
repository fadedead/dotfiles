return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		explorer = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		notifier = { enabled = true },
		picker = {
			enabled = true,
			sources = {
				explorer = {
					auto_close = true,
					layout = { preset = "default" },
					win = {
						list = {
							wo = {
								number = true,
								relativenumber = true,
							},
						},
					},
				},
			},
		},
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
	keys = {
		-- Top Pickers & Explorer
		{ "<leader>sf", function() Snacks.picker.files() end, desc = "Find Files" },
		{ "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
		{ "<leader>sb", function() Snacks.picker.buffers() end, desc = "Buffers" },
		{ "<leader>s.", function() Snacks.picker.recent() end, desc = "Recent" },
		{ "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
		{ "<leader>sr", function() Snacks.picker.resume() end, desc = "Resume" },
		{ "<leader>f", function() Snacks.explorer() end, desc = "File Explorer" },
		-- Git
		{ "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
		{ "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
		{ "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
		{ "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (CWD)" },
		-- Other
		{ "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode" },
		{ "<leader>.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
		{ "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
		{ "<leader>n", function() Snacks.notifier.show_history() end, desc = "Notification History" },
		{ "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
		{ "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
		{ "<c-/>", function() Snacks.terminal() end, desc = "Toggle Terminal" },
	},
}
