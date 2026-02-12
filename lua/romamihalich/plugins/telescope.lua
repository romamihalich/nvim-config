return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                    },
                },
                preview = false,
                layout_strategy = "bottom_pane",
                layout_config = {
                    horizontal = { prompt_position = "top" },
                    bottom_pane = {
                        height = 15,
                        prompt_position = "top",
                    },
                },
                sorting_strategy = "ascending",
            },
            extensions = {
                fzf = {
                    fuzzy = true, -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true, -- override the file sorter
                    case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                },
                ["ui-select"] = {
                    require("telescope.themes").get_cursor({}),
                },
            },
        })

        -- keymaps
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Files" })
        vim.keymap.set("n", "<leader>fF", function() builtin.find_files({ search_file = vim.fn.expand("<cword>") }) end, { desc = "Files (Word under cursor)" })
        vim.keymap.set("v", "<leader>ff", function()
            local saved_reg = vim.fn.getreg("v")
            vim.cmd([[noautocmd sil norm "vy]])
            local word = vim.fn.getreg("v")
            vim.fn.setreg("v", saved_reg)
            builtin.find_files({ search_file = word })
        end, { desc = "Files" })

        vim.keymap.set("n", "<leader>fg", function() builtin.git_files({ show_untracked = true }) end, { desc = "Git files" })
        vim.keymap.set("n", "<leader>fl", require("romamihalich.multi-ripgrep"), { desc = "Live grep" })
        vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
        vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Resume" })
        vim.keymap.set("n", "<leader>fs", builtin.grep_string, { desc = "Grep string" })
        vim.keymap.set("n", "<leader>fS", function() builtin.grep_string({ word_match = "-w" }) end, { desc = "Grep string (Word match)" })
        vim.keymap.set("v", "<leader>fs", builtin.grep_string, { desc = "Grep string" })
        vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "Quickfix" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help" })
        vim.keymap.set("n", "<leader>fw", builtin.lsp_dynamic_workspace_symbols, { desc = "Workspace symbols" })

        vim.keymap.set("n", "<leader>gb", function() vim.cmd.Telescope("git_branches") end, { desc = "Git branches" })

        local ok, _ = pcall(telescope.load_extension, "fzf")
        if not ok then
            print("WARN: fzf extension not loaded")
        end
        telescope.load_extension("ui-select")
    end,
}
