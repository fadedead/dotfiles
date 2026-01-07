return {
    "EdenEast/nightfox.nvim",
    config = function()
        require("nightfox").setup({
            options = {
                module_default = false,
            },
            palettes = {
                duskfox = {
                    bg1 = "#000000",
                    bg0 = "#000000",
                    bg3 = "#121820",
                    sel0 = "#131b24",
                },
            },
            specs = {
                all = {
                    inactive = "bg0",
                },
                duskfox = {
                    inactive = "#090909",
                },
            },
            groups = {
                all = {
                    NormalNC = { fg = "fg1", bg = "bg1" },
                },
            },
            modules = {
                options = "duskfox",
                terminal = "duskfox",
                lsp = "duskfox",
                gitsigns = "duskfox",
                telescope = "duskfox",
                nvimtree = "duskfox",
                indent_blankline = "duskfox",
                whichkey = "duskfox",
                lualine = "duskfox",
                notify = "duskfox",
                cmp = "duskfox",
                dap = "duskfox",
            },
        })

        vim.cmd.colorscheme("duskfox")
    end,
}
