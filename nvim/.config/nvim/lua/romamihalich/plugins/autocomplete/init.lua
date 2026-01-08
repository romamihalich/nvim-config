return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'onsails/lspkind-nvim',
        -- Snippets
        require "romamihalich.plugins.autocomplete.luasnip",
        'saadparwaiz1/cmp_luasnip',
        'rafamadriz/friendly-snippets',
    },
    config = function()
        local lspkind = require'lspkind'
        local cmp = require'cmp'
        local luasnip = require'luasnip'
        require("luasnip/loaders/from_vscode").lazy_load()

        cmp.setup({
          --completion = {
          --    completeopt = 'menu,menuone,noinsert'
          --},
          snippet = {
              expand = function(args)
                luasnip.lsp_expand(args.body) -- For `luasnip` users.
              end,
            },
          mapping = {
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
            ["<C-k>"] = cmp.mapping(function(fallback)
              if luasnip.expandable() then
                luasnip.expand()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
              end
            end, {
              "i",
              "s",
            }),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
          },
          formatting = {
            format = lspkind.cmp_format({
              mode = 'symbol_text', -- show only symbol annotations
              maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

              -- The function below will be called before any actual modifications from lspkind
              -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
              before = function (entry, vim_item)
                -- fancy icons and a name of kind
                vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind

                -- set a name for each source
                vim_item.menu = ({
                  buffer = "[Buffer]",
                  nvim_lsp = "[LSP]",
                  luasnip = "[LuaSnip]",
                  nvim_lua = "[Lua]",
                  latex_symbols = "[Latex]",
                })[entry.source.name]
                return vim_item
              end
            })
          },
          sources = {
            { name = 'nvim_lsp', --[[ keyword_length = 3  ]]},
            { name = 'luasnip', keyword_length = 3 },
            --{ name = 'buffer' },
            { name = 'path'}
          },
        })

        cmp.setup.cmdline(':', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = 'path' }
          }, {
            {
              name = 'cmdline',
              keyword_length = 3,
              option = {
                ignore_cmds = { 'Man', '!', 'vimgrep', 'grep' }
              }
            }
          })
        })

        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
              { name = 'path' }
            }
          })
    end
}
