return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        win = {
            no_overlap = false,
            border = "single",
            padding = { 2, 2 }, -- extra window padding [top/bottom, right/left]
            title = true,
            title_pos = "center",
            -- Additional vim.wo and vim.bo options
            bo = {},
            wo = {
                -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
            },
        },
        layout = {
            height = { min = 4, max = 25 }, -- min and max height of the columns
            width = { min = 20, max = 50 }, -- min and max width of the columns
            spacing = 3, -- spacing between columns
            align = "left", -- align columns left, center or right
        },
        icons = {
            mappings = false,
        },
        -- Start hidden and wait for a key to be pressed before showing the popup
        -- Only used by enabled xo mapping modes.
        ---@param ctx { mode: string, operator: string }
        defer = function(ctx)
            return ctx.mode == "v" or ctx.mode == "V" or ctx.mode == "<C-V>"
        end,
        spec = {
            {"<leader>f", group = "find", mode = { "n", "v" } },
            {"<leader>l", group = "LSP", mode = { "n", "v" } },
            {"<leader>o", group = "open" },
            {"<leader>g", group = "git" },
        }
    }
}
