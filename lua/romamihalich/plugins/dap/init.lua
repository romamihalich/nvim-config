return {
    "mfussenegger/nvim-dap",
    dependencies = {
        require("romamihalich.plugins.dap.dap-ui"),
    },
    config = function()
        if vim.loop.os_uname().sysname ~= "Linux" then
            return
        end

        local dap = require("dap")

        local debuggers_path = vim.fn.stdpath("data") .. "/mason/bin/"

        require("romamihalich.plugins.dap.python").setup(dap, debuggers_path)
        require("romamihalich.plugins.dap.netcoredbg").setup(dap, debuggers_path)

        local dapui = require("dapui")

        dap.listeners.after.event_initialized["dapui_config"] = dapui.open
        dap.listeners.before.event_terminated["dapui_config"] = dapui.close
        dap.listeners.before.event_exited["dapui_config"] = dapui.close

        -- keymaps
        vim.keymap.set("n", "<F5>", dap.continue)
        vim.keymap.set("n", "<F9>", dap.toggle_breakpoint)
        vim.keymap.set("n", "<F10>", dap.step_over)
        vim.keymap.set("n", "<F11>", dap.step_into)
        vim.keymap.set("n", "<F12>", dap.step_out)

        local dap_close = function()
            dap.close()
            dapui.close()
        end

        vim.keymap.set("n", "<leader>dp", dap.pause, { desc = "Pause" })
        vim.keymap.set("n", "<leader>dq", dap_close, { desc = "Close" })
        vim.keymap.set("n", "<leader>dh", require("dap.ui.widgets").hover, { desc = "Hover" })
        vim.keymap.set("n", "<leader>de", require("dapui").toggle, { desc = "Toggle sidebar" })

        require("which-key").add({ "<leader>d", group = "debug" })
    end,
}
