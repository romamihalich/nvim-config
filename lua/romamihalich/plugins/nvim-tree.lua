return {
    "kyazdani42/nvim-tree.lua",
    config = function()
        require("nvim-tree").setup({
            update_focused_file = {
                enable = true,
            },
        })

        vim.keymap.set("n", "<leader>E", vim.cmd.NvimTreeToggle, { desc = "Explorer toggle" })
    end,
}
