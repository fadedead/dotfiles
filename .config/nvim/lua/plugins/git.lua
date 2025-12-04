return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
            vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<CR>", { desc = "[G]it Preview [H]unk" })
        end,
    },
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gb", ":Git blame<cr>", { desc = "[G]it [B]lame" })
            vim.keymap.set("n", "<leader>gA", ":Git add .<cr>", { desc = "[G]it Add [A]ll" })
            vim.keymap.set("n", "<leader>ga", ":Git add<cr>", { desc = "[G]it [A]dd" })
            vim.keymap.set("n", "<leader>gC", ":Git commit<cr>", { desc = "[G]it [C]ommit" })
            vim.keymap.set("n", "<leader>gp", ":Git push<cr>", { desc = "[G]it [P]ush" })
        end,
    },
}
