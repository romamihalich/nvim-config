return {
    'mg979/vim-visual-multi',
    init = function()
        vim.cmd [[
            let g:VM_maps = {}
            let g:VM_maps['Find Under']         = '<C-d>' " replace C-n
            let g:VM_maps['Find Subword Under'] = '<C-d>' " replace visual C-n
        ]]
    end
}
