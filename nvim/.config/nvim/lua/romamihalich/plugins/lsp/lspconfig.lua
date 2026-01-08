return {
    'neovim/nvim-lspconfig',
    dependencies = {
        require "romamihalich.plugins.autocomplete"
    },
    config = function()
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = Signs.error,
                    [vim.diagnostic.severity.WARN] = Signs.warn,
                    [vim.diagnostic.severity.INFO] = Signs.info,
                    [vim.diagnostic.severity.HINT] = Signs.hint,
                },
                numhl = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.HINT] = "",
                    [vim.diagnostic.severity.INFO] = "",
                },
            },
        })

        local config = {
            virtual_text = true,
            update_in_insert = false,
            underline = true,
            severity_sort = true,
            float = {
              focusable = false,
              style = "minimal",
              border = "rounded",
              source = "if_many",
              header = "",
              prefix = "",
            },
        }

        vim.diagnostic.config(config)

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('my.lsp', {}),
            callback = function(args)
                Keymap("n",  "<leader>la",  vim.lsp.buf.code_action,                                        "Actions")
                Keymap("n",  "<leader>lf",  vim.lsp.buf.format,                                             "Formatting")
                Keymap("n",  "<leader>lr",  vim.lsp.buf.rename,                                             "Rename")
                Keymap("n",  "<leader>ll",  vim.diagnostic.open_float,                                      "Line diagnostics")
                Keymap("n",  "<leader>lj",  function() vim.diagnostic.jump({count=1, float=true}) end,      "Next diagnostic")
                Keymap("n",  "<leader>lk",  function() vim.diagnostic.jump({count=-1, float=true}) end,     "Prev diagnostic")
                Keymap("v",  "<leader>la",  vim.lsp.buf.code_action,                                        "Code actions")
                Keymap("n",  "gs",          function() vim.lsp.buf.signature_help({border='rounded'}) end,  "Signature help")
                Keymap("n",  "gd",          function() require("telescope.builtin").lsp_definitions() end,  "Go to definition")
                Keymap("n",  "gr",          function() require("telescope.builtin").lsp_references() end,   "Go to references")
            end,
        })

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        })

        vim.lsp.enable("lua_ls")

        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.lsp.protocol.make_client_capabilities()

        vim.lsp.config("*", {
            capabilities = cmp_nvim_lsp.default_capabilities(capabilities),
        })
    end
}
