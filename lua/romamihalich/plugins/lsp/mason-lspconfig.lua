return {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
        require "romamihalich.plugins.mason",
        require "romamihalich.plugins.lsp.lspconfig",
    },
    config = function()
        require("mason-lspconfig").setup {
            automatic_enable = false
        }
    end
}
