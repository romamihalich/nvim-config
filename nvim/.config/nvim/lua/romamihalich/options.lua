vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.wrap = false
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.signcolumn= "yes"
vim.opt.mouse= "a"
vim.opt.timeoutlen = 250
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
vim.opt.wildignore = "node_modules/*,bin/*,obj/*,.git/*"
vim.opt.cursorline = true
vim.opt.grepprg = "rg --vimgrep --no-heading"
vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m,%f"
vim.opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
vim.opt.listchars="tab:>·,trail:·,space:·,lead:·"
vim.opt.list = true

vim.opt.iskeyword:append('-')
vim.opt.diffopt:append('iwhite')
vim.opt.fillchars:append('diff: ')

if vim.loop.os_uname().sysname ~= "Linux" then
    vim.cmd.language("en_GB")
end
