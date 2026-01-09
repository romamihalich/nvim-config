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
                vim.keymap.set("n",  "<leader>la",  vim.lsp.buf.code_action,                                        { buffer = args.buf, desc = "Actions" })
                vim.keymap.set("n",  "<leader>lf",  vim.lsp.buf.format,                                             { buffer = args.buf, desc = "Formatting" })
                vim.keymap.set("n",  "<leader>lr",  vim.lsp.buf.rename,                                             { buffer = args.buf, desc = "Rename" })
                vim.keymap.set("n",  "<leader>ll",  vim.diagnostic.open_float,                                      { buffer = args.buf, desc = "Line diagnostics" })
                vim.keymap.set("n",  "<leader>lj",  function() vim.diagnostic.jump({count=1, float=true}) end,      { buffer = args.buf, desc = "Next diagnostic" })
                vim.keymap.set("n",  "<leader>lk",  function() vim.diagnostic.jump({count=-1, float=true}) end,     { buffer = args.buf, desc = "Prev diagnostic" })
                vim.keymap.set("v",  "<leader>la",  vim.lsp.buf.code_action,                                        { buffer = args.buf, desc = "Code actions" })
                vim.keymap.set("n",  "gs",          function() vim.lsp.buf.signature_help({border='rounded'}) end,  { buffer = args.buf, desc = "Signature help" })
                vim.keymap.set("i",  "<C-k>",       function () vim.lsp.buf.signature_help({border='rounded'}) end, { buffer = args.buf, desc = "Signature help" })
                vim.keymap.set("n",  "gd",          function() require("telescope.builtin").lsp_definitions() end,  { buffer = args.buf, desc = "Go to definition" })
                vim.keymap.set("n",  "gr",          function() require("telescope.builtin").lsp_references() end,   { buffer = args.buf, desc = "Go to references" })
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
