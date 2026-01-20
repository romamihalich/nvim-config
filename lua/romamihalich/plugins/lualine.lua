return {
    "hoob3rt/lualine.nvim",
    dependencies = {
        {
            "SmiteshP/nvim-navic",
            dependencies = { "neovim/nvim-lspconfig" },
            config = function()
                require("nvim-navic").setup({
                    lsp = {
                        auto_attach = true,
                    },
                    highlight = true,
                    click = true,
                })
            end,
        },
        "bwpge/lualine-pretty-path",
    },
    config = function()
        local pretty_path = {
            "pretty_path",
            -- symbols = {
            --     modified = "[+]"
            -- },
            -- highlights = {
            --     modified = { bold = true },
            -- },
            directories = {
                shorten = false,
            },
        }

        local navic = {
            "navic",
            color_correction = "dynamic",
        }

        local diagnostics = {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn", "hint" },
            symbols = {
                error = Signs.error .. " ",
                warn = Signs.warn .. " ",
                hint = Signs.hint .. " ",
            },
            colored = true,
            update_in_insert = false,
            always_visible = false,
        }

        local client_name = {
            icon = " LSP:",
            function()
                local clients = vim.lsp.get_clients({ bufnr = 0 })
                if #clients < 1 then
                    return "No Active Lsp"
                end
                return clients[1].name
            end,
        }

        local encoding = {
            function()
                local enc = vim.opt.fileencoding:get()
                if enc == "utf-8" then
                    return ""
                end
                return enc
            end,
        }

        local fileformat = {
            "fileformat",
            symbols = {
                -- unix = '', -- e712
                unix = "",
                dos = "", -- e70f
                mac = "", -- e711
            },
        }

        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = "auto",
                component_separators = { "", "" },
                section_separators = { "", "" },
                disabled_filetypes = { "NvimTree" },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = {
                    "filename",
                    navic,
                },
                lualine_x = {
                    diagnostics,
                    client_name,
                    encoding,
                    fileformat,
                    "filetype",
                    "location",
                },
                lualine_y = { "progress" },
                lualine_z = {},
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { pretty_path },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            winbar = {
                lualine_c = { pretty_path },
            },
            inactive_winbar = {
                lualine_c = { pretty_path },
            },
            extensions = {},
        })
    end,
}
