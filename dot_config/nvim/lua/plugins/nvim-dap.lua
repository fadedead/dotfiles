return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        "mfussenegger/nvim-dap-python",
        {
            "microsoft/vscode-js-debug",
            build = "npm install --legacy-peer-deps --ignore-scripts && npx gulp vsDebugServerBundle && mv dist out",
        },
        "mxsdev/nvim-dap-vscode-js",
        "leoluz/nvim-dap-go",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup()

        require("dap-python").setup("python")

        require("dap-vscode-js").setup({
            debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
            adapters = { "pwa-node", "node-terminal" },
        })

        -- Go debugging setup
        require("dap-go").setup({
            delve = {
                path = "dlv",
                initialize_timeout_sec = 20,
                port = "${port}",
                args = {},
            },
        })

        for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
            dap.configurations[language] = {
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    cwd = "${workspaceFolder}",
                },
                {
                    type = "pwa-node",
                    request = "attach",
                    name = "Attach",
                    processId = require("dap.utils").pick_process,
                    cwd = "${workspaceFolder}",
                },
                {
                    type = "pwa-chrome",
                    request = "launch",
                    name = "Launch Chrome for Next.js",
                    url = "http://localhost:3000",
                    webRoot = "${workspaceFolder}",
                    userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
                },
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "Debug Next.js (server)",
                    runtimeExecutable = "npm",
                    runtimeArgs = { "run", "dev" },
                    cwd = "${workspaceFolder}",
                    console = "integratedTerminal",
                },
            }
        end

        -- Go debug configurations
        dap.configurations.go = {
            {
                type = "go",
                name = "Debug (Arguments)",
                request = "launch",
                program = "${file}",
                args = function()
                    local args = {}
                    local input = vim.fn.input("Args: ")
                    if input ~= "" then
                        args = vim.split(input, " ")
                    end
                    return args
                end,
                cwd = "${workspaceFolder}",
            },
            {
                type = "go",
                name = "Debug (Arguments) [Test]",
                request = "launch",
                mode = "test",
                program = "${file}",
                args = function()
                    local args = {}
                    local input = vim.fn.input("Args: ")
                    if input ~= "" then
                        args = vim.split(input, " ")
                    end
                    return args
                end,
                cwd = "${workspaceFolder}",
            },
            {
                type = "go",
                name = "Debug (Package)",
                request = "launch",
                mode = "test",
                program = "${workspaceFolder}",
            },
            {
                type = "go",
                name = "Debug",
                request = "launch",
                program = "${workspaceFolder}",
            },
            {
                type = "go",
                name = "Debug [Test]",
                request = "launch",
                mode = "test",
                program = "${workspaceFolder}",
                dlvToolPath = vim.fn.exepath("dlv") or "dlv",
            },
        }

        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end

        vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "[D]ebug [T]oggle Breakpoint" })
        vim.keymap.set("n", "<leader>ds", dap.continue, { desc = "[D]ebug [S]tart" })
        vim.keymap.set("n", "<leader>dc", dapui.close, { desc = "[D]ebug [C]lose" })
    end,
}
