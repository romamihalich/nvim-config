return {
    'mfussenegger/nvim-dap',
    dependencies = {
        require "romamihalich.plugins.dap.dap-ui"
    },
    config = function()
        if vim.loop.os_uname().sysname ~= "Linux" then
            return
        end

        local dap = require'dap'

        local debuggers_path = os.getenv('HOME') .. '/.local/share/nvim/mason/bin/'

        local debuggers = {
            'netcoredbg', 'python'
        }
        for _, debugger in ipairs(debuggers) do
            local dbg = require('romamihalich.plugins.dap.debuggers.'..debugger).get_conf(debuggers_path)
            dap.adapters[dbg.adapters.key] = dbg.adapters.value
            dap.configurations[dbg.configurations.key] = dbg.configurations.value
        end

        local dapui = require'dapui'

        dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
        dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
        dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

        -- keymaps
        vim.keymap.set("n", "<F5>",  dap.continue)
        vim.keymap.set("n", "<F9>",  dap.toggle_breakpoint)
        vim.keymap.set("n", "<F10>", dap.step_over)
        vim.keymap.set("n", "<F11>", dap.step_into)
        vim.keymap.set("n", "<F12>", dap.step_out)
        -- nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
        -- nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>

        local dap_close = function()
            dap.close()
            dapui.close()
        end

        vim.keymap.set("n", "<leader>dp", dap.pause, { desc = "Pause" })
        vim.keymap.set("n", "<leader>dq", dap_close, { desc = "Close" })
        vim.keymap.set("n", "<leader>dh", require'dap.ui.widgets'.hover, { desc = "Hover" })
        vim.keymap.set("n", "<leader>de", require'dapui'.toggle, { desc = "Toggle sidebar" })

        require("which-key").add(
            {"<leader>d", group = "debug" }
        )
    end
}
