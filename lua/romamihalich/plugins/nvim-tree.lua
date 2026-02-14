return {
    "kyazdani42/nvim-tree.lua",
    config = function()
        require("nvim-tree").setup({
            update_focused_file = {
                enable = true,
            },
            git = {
                timeout = 1000,
            },
            actions = {
                open_file = {
                    resize_window = false,
                }
            },
        })

        vim.keymap.set("n", "<leader>E", vim.cmd.NvimTreeToggle, { desc = "Explorer toggle" })
    end,
}
