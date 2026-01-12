local M = {}

M.setup = function(dap, debuggers_path)
    dap.adapters["netcoredbg"] = {
        type = "executable",
        command = debuggers_path .. "netcoredbg",
        args = { "--interpreter=vscode" },
    }
    dap.configurations["cs"] = {
        {
            type = "netcoredbg",
            name = "launch - netcoredbg",
            request = "launch",
            program = function()
                return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
            end,
        },
        {
            -- If you get an "Operation not permitted" error using this, try disabling YAMA:
            --  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
            name = "Attach to process",
            type = "netcoredbg", -- Adjust this to match your adapter name (`dap.adapters.<name>`)
            request = "attach",
            processId = require("dap.utils").pick_process,
            args = {},
        },
    }
end

return M
