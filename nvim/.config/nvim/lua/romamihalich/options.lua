local options = {
    clipboard = "unnamedplus",
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smartindent = true,
    relativenumber = true,
    nu = true,
    hidden = true,
    errorbells = false,
    wrap = false,
    smartcase = true,
    ignorecase = true,
    hlsearch = true,
    scrolloff = 8,
    sidescrolloff = 8,
    swapfile = false,
    backup = false,
    signcolumn= "yes",
    mouse= "a",
    timeoutlen = 250,
    splitright = true,
    splitbelow = true,
    termguicolors = true,
    undofile = true,
    langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz",
    wildignore = "node_modules/*,bin/*,obj/*,.git/*",
    cursorline = true,
    grepprg = "rg --vimgrep --no-heading",
    grepformat = "%f:%l:%c:%m,%f:%l:%m,%f",
    virtualedit = "block", -- Allow cursor to move where there is no text in visual block mode
    listchars="tab:>·,trail:·,space:·,lead:·",
    list = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.iskeyword:append('-')
vim.opt.diffopt:append('iwhite')
vim.opt.fillchars:append('diff: ')

if vim.loop.os_uname().sysname ~= "Linux" then
    vim.cmd.language("en_GB")
end
