vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "<C-h>", "<c-w>h")
vim.keymap.set("n", "<C-l>", "<c-w>l")
vim.keymap.set("n", "<C-j>", "<c-w>j")
vim.keymap.set("n", "<C-k>", "<c-w>k")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", "p", "\"_dP")

vim.keymap.set("", "<X1Mouse>", "<C-O>")
vim.keymap.set("", "<X2Mouse>", "<C-I>")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>H", "<cmd>cd %:p:h | pwd<CR>", { desc = "Cd here" })

vim.keymap.set("n", "<C-n>", vim.cmd.cnext);
vim.keymap.set("n", "<C-p>", vim.cmd.cprev);

vim.keymap.set("n", "<leader>cl", function()
    local filePath = vim.fn.expand("%")
    local lineNbr = vim.fn.line(".")
    local location = filePath .. ":" .. lineNbr
    vim.fn.setreg("+", location)
end, { desc = "Copy location" })

local term_buf = -1
vim.keymap.set("n", "<leader>tt", function()
    if term_buf == -1 or vim.fn.bufexists(term_buf) == 0 then
        vim.cmd.term()
        term_buf = vim.api.nvim_get_current_buf()
    elseif vim.api.nvim_get_current_buf() == term_buf then
        vim.cmd.bprev()
    else
        vim.cmd.buffer(term_buf)
    end
end)

