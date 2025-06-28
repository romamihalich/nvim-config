require("mason").setup({
    registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
    },
})

require("mason-lspconfig").setup {
    ensure_installed = { },
}

require("mason-lspconfig").setup_handlers {
    function (server_name)
        local opts = {
            capabilities = require("romamihalich.plugins.lsp.handlers").capabilities,
        }

        if server_name == "rust_analyzer" then
            -- already setup by plugin mrcjkb/rustaceanvim
            return
        end

        if server_name == "lua_ls" then
            opts = vim.tbl_deep_extend("force", {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        }
                    }
                }
            }, opts)
        end

        require("lspconfig")[server_name].setup(opts)
    end,
}
