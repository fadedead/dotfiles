return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			ensure_installed = {
				"lua_ls",
				"html",
				"ts_ls",
				"cssls",
				"pyright",
				"emmet_ls",
				"tailwindcss",
				"terraformls",
				"gopls",
				"golangci_lint_ls",
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"prettierd",
				"eslint_d",
				"debugpy",
				"ruff",
				"tflint",
				"golangci-lint",
				"golangci-lint-langserver",
				"delve",
				"gofumpt",
				"goimports",
				"selene",
				"stylua",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp" },
		config = function()
			-- 1. Setup Defaults (Keymaps & UI)
			vim.lsp.config("*", {
				root_markers = { ".git", "lua", "init.lua" },
			})

			-- 2. Define Custom Server Configurations

			-- LUA
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						workspace = {
							checkThirdParty = false,
							library = {
								-- Neovim runtime and plugin types are handled by lazydev.nvim
							},
						},
						completion = { callSnippet = "Replace" },
					},
				},
			})

			-- TYPESCRIPT
			vim.lsp.config("ts_ls", {
				root_markers = { "package.json", "tsconfig.json", ".git" },
			})

			-- PYTHON
			vim.lsp.config("pyright", {
				settings = {
					python = {
						analysis = {
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							typeCheckingMode = "basic",
						},
					},
				},
			})

			-- GO
			vim.lsp.config("gopls", {
				settings = {
					gopls = {
						completeUnimported = true,
						usePlaceholders = true,
						analyses = { unusedparams = true, unreachable = true },
					},
				},
			})

			-- 3. Enable All Servers
			local servers = {
				"lua_ls",
				"html",
				"ts_ls",
				"cssls",
				"pyright",
				"emmet_ls",
				"tailwindcss",
				"terraformls",
				"gopls",
				"golangci_lint_ls",
			}

			for _, server in ipairs(servers) do
				vim.lsp.enable(server)
			end
		end,
	},
}
