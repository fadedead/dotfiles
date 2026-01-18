return {
	{
		"saghen/blink.cmp",
		version = "*",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"L3MON4D3/LuaSnip",
		},
		event = { "InsertEnter", "CmdlineEnter" },
		opts = {
			keymap = {
				preset = "default",
				["<CR>"] = { "select_and_accept", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
				["<C-k>"] = { "select_prev", "fallback" },
				["<Tab>"] = { "snippet_forward", "fallback" },
				["<S-Tab>"] = { "snippet_backward", "fallback" },
			},
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			snippets = {
				preset = "luasnip",
			},
			signature = { enabled = true },
			completion = {
				list = {
					selection = {
						preselect = true,
						auto_insert = true,
					},
				},
				documentation = {
					auto_show = true,
					window = {
						border = "single",
					},
				},
			},
		},
	},
}
