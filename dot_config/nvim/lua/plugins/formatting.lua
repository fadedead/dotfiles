return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                svelte = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                graphql = { "prettier" },
                lua = { "stylua" },
                python = { "isort", "black" },
                terraform = { "terraform_fmt" },
                tf = { "terraform_fmt" },
                hcl = { "terraform_fmt" },
                go = { "gofumpt", "goimports" },
            },
            format_on_save = {
                lsp_fallback = false,
                async = false,
                timeout_ms = 1000,
            },
        })

        vim.keymap.set("n", "<leader>cf", function()
            conform.format({ lsp_fallback = true })
        end, { desc = "[C]ode [F]ormat" })
    end,
}
