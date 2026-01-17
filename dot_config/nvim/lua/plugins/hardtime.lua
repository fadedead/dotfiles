return {
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		event = "VeryLazy",
		opts = {
			max_time = 1000,
			max_count = 3,
			disable_mouse = false,
			hint = true,
			notification = true,
			restriction_mode = "block", -- Blocks keys to force better habits
			disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil", "snacks_picker_list", "snacks_input", "snacks_terminal" },
			disabled_keys = {
				["<Up>"] = {},
				["<Down>"] = {},
				["<Left>"] = {},
				["<Right>"] = {},
			},
		},
	},
}
