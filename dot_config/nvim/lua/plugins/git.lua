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
            vim.keymap.set("n", "<leader>gb", function()
                local found = false
                for _, win in ipairs(vim.api.nvim_list_wins()) do
                    local buf = vim.api.nvim_win_get_buf(win)
                    if vim.bo[buf].filetype == "fugitiveblame" then
                        vim.api.nvim_win_close(win, true)
                        found = true
                        break
                    end
                end
                if not found then
                    vim.cmd("Git blame")
                end
            end, { desc = "[G]it [B]lame Toggle" })
            vim.keymap.set("n", "<leader>gA", ":Git add .<cr>", { desc = "[G]it Add [A]ll" })
            vim.keymap.set("n", "<leader>ga", ":Git add<cr>", { desc = "[G]it [A]dd" })
            vim.keymap.set("n", "<leader>gC", ":Git commit<cr>", { desc = "[G]it [C]ommit" })
            vim.keymap.set("n", "<leader>gp", ":Git push<cr>", { desc = "[G]it [P]ush" })
        end,
    },
}
