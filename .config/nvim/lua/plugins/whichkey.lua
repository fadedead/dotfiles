return {
    "folke/which-key.nvim",
    event = "VimEnter",
    config = function()
        local which_key = require("which-key")
        which_key.setup()
        which_key.add({
            { "<leader>c", group = "[C]ode" },
            { "<leader>d", group = "[D]ebug" },
            { "<leader>f", group = "[F]iles" },
            { "<leader>g", group = "[G]it" },
            { "<leader>h", group = "[H]arpoon" },
            { "<leader>s", group = "[S]earch" },
            { "<leader>w", group = "[W]indow" },
        })
    end,
}
