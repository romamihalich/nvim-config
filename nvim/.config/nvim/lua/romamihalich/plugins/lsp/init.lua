return {
    {
        'neovim/nvim-lspconfig',
        config = function() require'romamihalich.plugins.lsp.handlers'.setup() end,
        dependencies = {
            {
                'williamboman/mason.nvim',
                config = function() require'romamihalich.plugins.lsp.mason' end,
                dependencies = { 'williamboman/mason-lspconfig.nvim' }
            },
        }
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^6', -- Recommended
        lazy = false, -- This plugin is already lazy
    },
}
