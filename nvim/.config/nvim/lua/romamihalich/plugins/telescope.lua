return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-telescope/telescope-file-browser.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
        local telescope = require'telescope'
        local actions = require'telescope.actions'

        telescope.setup{
            defaults = {
                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                        ["<tab>"] = actions.move_selection_next,
                        ["<s-tab>"] = actions.move_selection_previous,
                    }
                },
                preview = false,
                layout_strategy = 'bottom_pane',
                layout_config = {
                    horizontal = { prompt_position = 'top' },
                    bottom_pane = {
                        height = 15,
                        prompt_position = "top"
                    },
                },
                sorting_strategy = 'ascending',
            },
            extensions = {
                fzf = {
                    fuzzy = true,                    -- false will only do exact matching
                    override_generic_sorter = true,  -- override the generic sorter
                    override_file_sorter = true,     -- override the file sorter
                    case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                },
                file_browser = {
                    theme = "ivy",
                    mappings = {
                        ["i"] = {
                            [":"] = function (...)
                                local action_state = require "telescope.actions.state"
                                local fb_utils = require "telescope._extensions.file_browser.utils"
                                local picker = action_state.get_current_picker(...)
                                local finder = picker.finder
                                local path = finder.path
                                vim.cmd("cd " .. path)
                                fb_utils.redraw_border_title(picker)
                                picker:refresh(finder, { reset_prompt = true, multi = picker._multi })
                                print "[telescope] Changed nvim's current working directory"
                            end
                        },
                        -- ["i"] = { },
                        -- ["n"] = { },
                    }
                },
                ["ui-select"] = {
                    require("telescope.themes").get_cursor {
                        -- even more opts
                    }

                    -- pseudo code / specification for writing custom displays, like the one
                    -- for "codeactions"
                    -- specific_opts = {
                    --   [kind] = {
                    --     make_indexed = function(items) -> indexed_items, width,
                    --     make_displayer = function(widths) -> displayer
                    --     make_display = function(displayer) -> function(e)
                    --     make_ordinal = function(e) -> string
                    --   },
                    --   -- for example to disable the custom builtin "codeactions" display
                    --      do the following
                    --   codeactions = false,
                    -- }
                }
            }
        }

        -- keymaps
        local builtin = require('telescope.builtin')
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Files" })
        vim.keymap.set("n", "<leader>аа", builtin.find_files, { desc = "Files" })
        vim.keymap.set("n", "<leader>fF", function() builtin.find_files({search_file=vim.fn.expand("<cword>")}) end, { desc = "Files (Word under cursor)" })
        vim.keymap.set("v", "<leader>ff", function()
            local saved_reg = vim.fn.getreg "v"
            vim.cmd [[noautocmd sil norm "vy]]
            local word = vim.fn.getreg "v"
            vim.fn.setreg("v", saved_reg)
            builtin.find_files({search_file=word})
        end, { desc = "Files" })

        vim.keymap.set("n", "<leader>fg", function() builtin.git_files({show_untracked = true }) end, { desc = "Git files" })
        vim.keymap.set("n", "<leader>fl", builtin.live_grep, { desc = "Live grep" })
        vim.keymap.set("n", "<leader>ад", builtin.live_grep, { desc = "Live grep" })
        vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
        vim.keymap.set("n", "<leader>fo", function()
            telescope.extensions.file_browser.file_browser({
                cwd_to_path=true,
                grouped=true,
            })
        end, { desc = "File browser" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
        vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Resume" })
        vim.keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "Grep string" })
        vim.keymap.set("n", "<leader>fS", function() builtin.grep_string({word_match="-w"}) end, { desc = "Grep string (Word match)" })
        vim.keymap.set("v", "<leader>fs", builtin.grep_string, { desc = "Grep string" })
        vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "Quickfix" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help" })

        vim.keymap.set("n", "<leader>gb", function() vim.cmd.Telescope("git_branches") end, { desc = "Git branches" })

        local ok, _ = pcall(telescope.load_extension, 'fzf')
        if not ok then
            print('WARN: fzf extension not loaded')
        end
        telescope.load_extension('file_browser')
        telescope.load_extension("ui-select")
    end,
}
