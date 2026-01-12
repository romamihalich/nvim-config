local group = vim.api.nvim_create_augroup("romamihalich.autocmds", {})

vim.api.nvim_create_autocmd("TermOpen", {
    group = group,
    command = "startinsert",
})

vim.api.nvim_create_autocmd("VimEnter", {
    group = group,
    command = ':silent exec "!kill -s SIGWINCH $PPID"',
})

vim.api.nvim_create_autocmd("BufWritePost", {
    group = group,
    pattern = { "*Xresources", "*Xdefaults" },
    command = "!xrdb %"
})

vim.api.nvim_create_autocmd("BufWritePost", {
    group = group,
    pattern = "*sxhkdrc",
    command = "!pkill -USR1 -x sxhkd"
})

vim.api.nvim_create_autocmd('TextYankPost', {
    group = group,
    callback = function()
        vim.hl.on_yank()
    end
})

vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = "*",
    command = "set formatoptions-=o",
})
