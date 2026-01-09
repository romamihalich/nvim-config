return {
    'goolord/alpha-nvim',
    config = function()
        local startify = require "alpha.themes.startify"

        local buttons_section = startify.config.layout[4].val
        table.insert(
            buttons_section,
            startify.button("s", "Load last session", "<cmd>lua require('persistence').load()<CR>")
        )

        require("alpha").setup(startify.config)
    end
}
