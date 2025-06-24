return {
    'vimwiki/vimwiki',
    init = function()
        vim.cmd [[
            let g:vimwiki_url_maxsave=0
        ]]
    end
}
