return {
    'gruvbox-community/gruvbox',
    'LunarVim/onedarker.nvim',
    'EdenEast/nightfox.nvim',
    'rose-pine/neovim',
    'folke/tokyonight.nvim',
    'shaunsingh/nord.nvim',
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                auto_integrations = true,
            })
        end
    },
    {
        'navarasu/onedark.nvim',
        config = function()
            local onedark = require "onedark"
            onedark.setup {
                style = 'darker',
                colors = {
                    search_blue   = "#5e81ac",
                    search_orange = "#613214",
                    -- my_blue = "#61AFEF",
                    my_blue = "#264F78",
                    dark_gray = "#2a2f3e",
                },
                highlights = {
                    Search     = {fg = "#ffffff", bg = "$my_blue", },
                    IncSearch  = {fg = "#ffffff", bg = "$search_blue", },
                    Substitute = {fg = "#ffffff", bg = "$search_orange", },
                    TSPunctBracket = {fg = "#abb2bf"},
                    QuickFixLine = { bg = "$dark_gray", fmt = "bold", fg = "none" },
                }
            }
            onedark.load()

            -- vim.cmd [[
            --     hi DiffAdd      gui=none    guifg=NONE          guibg=#bada9f
            --     hi DiffChange   gui=none    guifg=NONE          guibg=#e5d5ac
            --     hi DiffDelete   gui=bold    guifg=#ff8080       guibg=#ffb0b0
            --     hi DiffText     gui=none    guifg=NONE          guibg=#8cbee2
            -- ]]

            vim.cmd [[
                hi DiffAdd ctermbg=4 guibg=#1a2e0e
                hi DiffDelete ctermfg=12 ctermbg=6 guibg=#2e0e10
                hi DiffChange ctermbg=5 guibg=#06223b
            ]]
        end
    },
}
