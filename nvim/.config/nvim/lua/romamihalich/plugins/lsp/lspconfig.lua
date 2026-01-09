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
                vim.keymap.set("n",  "<leader>la",  vim.lsp.buf.code_action,                                        { desc = "Actions" })
                vim.keymap.set("n",  "<leader>lf",  vim.lsp.buf.format,                                             { desc = "Formatting" })
                vim.keymap.set("n",  "<leader>lr",  vim.lsp.buf.rename,                                             { desc = "Rename" })
                vim.keymap.set("n",  "<leader>ll",  vim.diagnostic.open_float,                                      { desc = "Line diagnostics" })
                vim.keymap.set("n",  "<leader>lj",  function() vim.diagnostic.jump({count=1, float=true}) end,      { desc = "Next diagnostic" })
                vim.keymap.set("n",  "<leader>lk",  function() vim.diagnostic.jump({count=-1, float=true}) end,     { desc = "Prev diagnostic" })
                vim.keymap.set("v",  "<leader>la",  vim.lsp.buf.code_action,                                        { desc = "Code actions" })
                vim.keymap.set("n",  "gs",          function() vim.lsp.buf.signature_help({border='rounded'}) end,  { desc = "Signature help" })
                vim.keymap.set("i",  "<C-k>",       function () vim.lsp.buf.signature_help({border='rounded'}) end, { desc = "Signature help" })
                vim.keymap.set("n",  "gd",          function() require("telescope.builtin").lsp_definitions() end,  { desc = "Go to definition" })
                vim.keymap.set("n",  "gr",          function() require("telescope.builtin").lsp_references() end,   { desc = "Go to references" })
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

        vim.lsp.config("*", {
            capabilities = require('blink.cmp').get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities()),
        })
    end
}
