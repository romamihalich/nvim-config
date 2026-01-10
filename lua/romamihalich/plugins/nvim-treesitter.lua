return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'windwp/nvim-ts-autotag',
            opts = {}
        },
        config = function()
            require'nvim-treesitter.configs'.setup {
                -- ensure_installed = "all", -- one of "all"
                sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
                ignore_install = { "" }, -- List of parsers to ignore installing
                autopairs = {
                    enable = true,
                },
                highlight = {
                    enable = true, -- false will disable the whole extension
                    disable = { "" }, -- list of language that will be disabled
                    additional_vim_regex_highlighting = false, -- no bold return, def, etc...
                },
                indent = { enable = false, disable = { "yaml", "python" } },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = '<c-space>',
                        -- node_incremental = '<c-space>',
                        scope_incremental = '<c-space>',
                        node_decremental = '<c-backspace>',
                    },
                },
                context_commentstring = {
                    enable = true,
                    enable_autocmd = false,
                },
            }
        end
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
            require'treesitter-context'.setup{
                enable = false,
            }
        end
    },
}
