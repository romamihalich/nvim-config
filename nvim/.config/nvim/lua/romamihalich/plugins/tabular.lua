return {
    'godlygeek/tabular',
    config = function()
        vim.keymap.set("v", "<leader>=", ":Tabularize /", { desc = "Tabularize (\\zs)" })
    end
}
