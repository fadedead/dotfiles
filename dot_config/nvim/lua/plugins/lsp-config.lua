return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "html", "ts_ls", "cssls", "pyright", "emmet_ls", "tailwindcss", "terraformls", "gopls", "golangci_lint_ls" },
            })
        end,
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = { "prettierd", "eslint_d", "debugpy", "black", "isort", "pylint", "tflint", "golangci-lint", "golangci-lint-langserver", "delve", "gofumpt" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            vim.lsp.enable("lua_ls")
            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
            })

            vim.lsp.enable("ts_ls")
            vim.lsp.config("ts_ls", {
                capabilities = capabilities,
                root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
                settings = {
                    typescript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "all",
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayEnumMemberValueHints = true,
                        },
                    },
                    javascript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "all",
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayEnumMemberValueHints = true,
                        },
                    },
                },
            })

            vim.lsp.enable("html")
            vim.lsp.config("html", {
                capabilities = capabilities,
            })

            vim.lsp.enable("cssls")
            vim.lsp.config("cssls", {
                capabilities = capabilities,
            })

            vim.lsp.enable("emmet_ls")
            vim.lsp.config("emmet_ls", {
                capabilities = capabilities,
            })

            vim.lsp.enable("tailwindcss")
            vim.lsp.config("tailwindcss", {
                capabilities = capabilities,
            })

            vim.lsp.enable("pyright")
            vim.lsp.config("pyright", {
                capabilities = capabilities,
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            diagnosticMode = "workspace",
                            typeCheckingMode = "basic",
                        },
                    },
                },
                on_init = function(client)
                    local venv_path = vim.fn.getcwd() .. "/.venv"
                    local env_path = vim.fn.getcwd() .. "/venv"
                    local conda_env = vim.fn.getenv("CONDA_PREFIX")

                    if vim.fn.isdirectory(venv_path) == 1 then
                        client.config.settings.python.pythonPath = venv_path .. "/bin/python"
                    elseif vim.fn.isdirectory(env_path) == 1 then
                        client.config.settings.python.pythonPath = env_path .. "/bin/python"
                    elseif conda_env ~= vim.NIL and conda_env ~= "" then
                        client.config.settings.python.pythonPath = conda_env .. "/bin/python"
                    end
                end,
            })

            vim.lsp.enable("terraformls")
            vim.lsp.config("terraformls", {
                capabilities = capabilities,
                filetypes = { "terraform", "tf", "hcl" },
            })

            vim.lsp.enable("gopls")
            vim.lsp.config("gopls", {
                capabilities = capabilities,
                settings = {
                    gopls = {
                        completeUnimported = true,
                        usePlaceholders = true,
                        analyses = {
                            unusedparams = true,
                            unreachable = true,
                        },
                    },
                },
            })

            vim.lsp.enable("golangci_lint_ls")
            vim.lsp.config("golangci_lint_ls", {
                capabilities = capabilities,
            })

            vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "[C]ode [H]over" })
            vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "[C]ode [D]efinition" })
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
            vim.keymap.set("n", "<leader>cr", require("telescope.builtin").lsp_references, { desc = "[C]ode [R]eferences" })
            vim.keymap.set("n", "<leader>ci", require("telescope.builtin").lsp_implementations, { desc = "[C]ode [I]mplementations" })
            vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
            vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "[C]ode [D]eclaration" })
        end,
    },
}
