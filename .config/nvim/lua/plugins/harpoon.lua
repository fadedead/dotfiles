return {
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        vim.keymap.set("n", "<leader>la", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Add File To Harpoon List" })
        vim.keymap.set("n", "<leader>lv", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", { desc = "Show Harpoon List" })
        vim.keymap.set("n", "<C-h>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "Next Harpoon File" })
        vim.keymap.set("n", "<C-l>", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", { desc = "Previous Harpoon File" })
        vim.keymap.set("n", "<C-1>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", { desc = "Go to Harpoon File 1" })
        vim.keymap.set("n", "<C-2>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", { desc = "Go to Harpoon File 2" })
        vim.keymap.set("n", "<C-3>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", { desc = "Go to Harpoon File 3" })
        vim.keymap.set("n", "<C-4>", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", { desc = "Go to Harpoon File 4" })
        require('harpoon').setup({
            global_settings = {
                -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
                save_on_toggle = false,

                -- saves the harpoon file upon every change. disabling is unrecommended.
                save_on_change = true,

                -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
                enter_on_sendcmd = false,

                -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
                tmux_autoclose_windows = false,

                -- filetypes that you want to prevent from adding to the harpoon list menu.
                excluded_filetypes = { "harpoon" },

                -- set marks specific to each git branch inside git repository
                -- Each branch will have it's own set of marked files
                mark_branch = true,

                -- enable tabline with harpoon marks
                tabline = false,
                tabline_prefix = "   ",
                tabline_suffix = "   ",
            }
        })

        -- Harpoon telescope extension
        require('telescope').load_extension('harpoon')
    end
}
