return {
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        vim.keymap.set("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "[H]arpoon [A]dd" })
        vim.keymap.set("n", "<leader>hm", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "[H]arpoon [M]enu" })
        vim.keymap.set("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "[H]arpoon [N]ext" })
        vim.keymap.set("n", "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { desc = "[H]arpoon [P]rev" })
        vim.keymap.set("n", "<leader>h1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", { desc = "[H]arpoon File [1]" })
        vim.keymap.set("n", "<leader>h2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", { desc = "[H]arpoon File [2]" })
        vim.keymap.set("n", "<leader>h3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", { desc = "[H]arpoon File [3]" })
        vim.keymap.set("n", "<leader>h4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", { desc = "[H]arpoon File [4]" })

        require("harpoon").setup({
            global_settings = {
                save_on_toggle = false,
                save_on_change = true,
                enter_on_sendcmd = false,
                tmux_autoclose_windows = false,
                excluded_filetypes = { "harpoon" },
                mark_branch = true,
            },
        })

        require("telescope").load_extension("harpoon")
    end,
}
