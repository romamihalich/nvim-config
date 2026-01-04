require("mason").setup({
    registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
    },
})

require("mason-lspconfig").setup {
    ensure_installed = { },
}

-- disable, because already setup by plugin mrcjkb/rustaceanvim
vim.lsp.enable("rust_analyzer", false)

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
})

vim.lsp.config("*", {
    capabilities = require("romamihalich.plugins.lsp.handlers").capabilities,
})
