return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "windwp/nvim-ts-autotag" },
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup({
            ensure_installed = {
                "vim",
                "vimdoc",
                "lua",
                "python",
                "javascript",
                "typescript",
                "html",
                "css",
                "json",
                "tsx",
                "markdown",
                "markdown_inline",
                "gitignore",
                "go",
            },
            highlight = { enable = true },
        })
        require("nvim-ts-autotag").setup()
    end,
}
