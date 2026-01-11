return {
    "seblyng/roslyn.nvim",
    ft = "cs",
    config = function()
        require("roslyn").setup({
            silent = true
        })
        disable_lsp_for_git_directory("roslyn")

        -- fidget.nvim integration
        -- copied from https://github.com/seblyng/dotfiles/blob/16d0aea3502cdf7ce6afde3ff8a24edbf58af44f/nvim/plugin/dotnet.lua
        local init_handles = {}
        vim.api.nvim_create_autocmd("User", {
            pattern = "RoslynOnInit",
            callback = function(ev)
                init_handles[ev.data.client_id] = require("fidget.progress").handle.create({
                    title = "Initializing Roslyn",
                    message = ev.data.type == "solution" and string.format("Initializing Roslyn for %s", ev.data.target)
                        or "Initializing Roslyn for project",
                    lsp_client = {
                        name = "roslyn",
                    },
                })
            end,
        })

        vim.api.nvim_create_autocmd("User", {
            pattern = "RoslynInitialized",
            callback = function(ev)
                local handle = init_handles[ev.data.client_id]
                init_handles[ev.data.client_id] = nil

                if handle then
                    handle.message = "Roslyn initialized"
                    handle:finish()
                end
            end,
        })
    end,
    init = function()
        if vim.loop.os_uname().sysname ~= "Linux" then
            vim.lsp.config("roslyn", {
                settings = {
                    ["csharp|background_analysis"] = {
                        dotnet_analyzer_diagnostics_scope = "none",
                    },
                }
            })
        end
    end
}
