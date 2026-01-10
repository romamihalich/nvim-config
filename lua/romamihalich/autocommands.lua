local group = vim.api.nvim_create_augroup("kek", { clear = true })
vim.api.nvim_clear_autocmds({ group = group })
local autocmd = function(event, opts)
    opts.group = group
    vim.api.nvim_create_autocmd(event, opts)
end

autocmd("TermOpen", { command = "startinsert" })

autocmd("VimEnter", { command = ':silent exec "!kill -s SIGWINCH $PPID"'})

autocmd("BufWritePost", {
    pattern = { "*Xresources", "*Xdefaults" },
    command = "!xrdb %"
})

autocmd("BufWritePost", {
    pattern = "*sxhkdrc",
    command = "!pkill -USR1 -x sxhkd"
})

autocmd('TextYankPost', {
    callback = function()
        vim.hl.on_yank()
    end
})

autocmd("FileType", {
    pattern = "*",
    command = "set formatoptions-=o",
})
