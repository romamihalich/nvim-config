return {
    {
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set("n", "<leader>gq", function() vim.cmd.G("difftool") end, { desc = "Set quickfix list with hunks" })
        end
    },
    {
        'sindrets/diffview.nvim',
        config = function()
            local actions = require("diffview.actions")
            require("diffview").setup({
                keymaps = {
                    file_panel = {
                        { "n", "s",             actions.toggle_stage_entry,   { desc = "Stage / unstage the selected entry." } },
                    },
                },
            })
            vim.keymap.set("n", "<leader>gg", vim.cmd.DiffviewOpen, { desc = "Diffview" })
            vim.keymap.set("v", "<leader>gh", vim.cmd.DiffviewFileHistory, { desc = "File history" })
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup({
                numhl = true,
            })
            vim.keymap.set("n", "<leader>gs", function() vim.cmd.Gitsigns("stage_hunk") end, { desc = "Stage hunk" })
            vim.keymap.set("n", "<leader>gl", function() vim.cmd.Gitsigns("blame_line") end, { desc = "Blame line" })
            vim.keymap.set("n", "<leader>gp", function() vim.cmd.Gitsigns("preview_hunk") end, { desc = "Preview hunk" })
            vim.keymap.set("n", "<leader>gr", function() vim.cmd.Gitsigns("reset_hunk") end, { desc = "Reset hunk" })

            vim.keymap.set("n", "]h", function() vim.cmd.Gitsigns("next_hunk") end, { desc = "Next hunk" })
            vim.keymap.set("n", "[h", function() vim.cmd.Gitsigns("prev_hunk") end, { desc = "Prev hunk" })
        end
    }
}
