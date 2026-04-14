return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        build = ':TSUpdate',
        dependencies = {
            'windwp/nvim-ts-autotag',
            opts = {}
        },
        config = function()
            require'nvim-treesitter'.setup { }
        end,
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    pcall(vim.treesitter.start)
                end
            })
        end
    },
    -- {
    --     'nvim-treesitter/nvim-treesitter-context',
    --     config = function()
    --         require'treesitter-context'.setup{
    --             enable = false,
    --         }
    --     end
    -- },
}
