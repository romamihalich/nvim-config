return {
    'ThePrimeagen/harpoon',
    config = function()
        vim.keymap.set("n", "<leader>ha", "<cmd> lua require'harpoon.mark'.add_file()<CR>", { desc = "Add file" })
        vim.keymap.set("n", "<leader>ht", "<cmd> lua require'harpoon.ui'.toggle_quick_menu()<CR>", { desc = "Toggle menu" })
        vim.keymap.set("n", "<leader>hh", "<cmd> lua require'harpoon.ui'.nav_file(1)<CR>", { desc = "Nav file 1" })
        vim.keymap.set("n", "<leader>hj", "<cmd> lua require'harpoon.ui'.nav_file(2)<CR>", { desc = "Nav file 2" })
        vim.keymap.set("n", "<leader>hk", "<cmd> lua require'harpoon.ui'.nav_file(3)<CR>", { desc = "Nav file 3" })

        require("which-key").add(
            {"<leader>h", group = "harpoon" }
        )
    end
}
