return {
    "vimwiki/vimwiki",
    init = function()
        vim.cmd [[
            let g:vimwiki_url_maxsave=0
        ]]

        require("which-key").add(
            {"<leader>w", group = "VimWiki" }
        )
    end
}
