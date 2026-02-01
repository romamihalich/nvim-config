return {
    'stevearc/oil.nvim',
    config = function()
        require('oil').setup({
            delete_to_trash = true,
            columns = {
                "icon",
                -- "permissions",
                -- "size",
                -- "mtime",
            },
            view_options = {
                -- Show files and directories that start with "."
                show_hidden = true,
                is_always_hidden = function(name, bufnr)
                    return name == "." or name == ".."
                end,
            },
        })

        local smart_keymap = function()
            if vim.bo.filetype == "NvimTree" then
                vim.cmd.NvimTreeClose()
            else
                vim.cmd.Oil()
            end

        end

        vim.keymap.set("n", "<leader>e", smart_keymap, { desc = "Oil" })
    end
}
