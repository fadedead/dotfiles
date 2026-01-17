return {
    "mbbill/undotree",
    event = "VeryLazy",
    config = function()
        vim.keymap.set("n", "<leader>uu", vim.cmd.UndotreeToggle, { desc = "[U]ndo Tree" })
    end,
}
