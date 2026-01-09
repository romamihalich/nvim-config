--Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

vim.keymap.set("n", "K", function() vim.lsp.buf.hover({border='rounded'}) end)

vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "<C-h>", "<c-w>h")
vim.keymap.set("n", "<C-l>", "<c-w>l")
vim.keymap.set("n", "<C-j>", "<c-w>j")
vim.keymap.set("n", "<C-k>", "<c-w>k")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", "p", "\"_dP")
-- keymap("v", "*", 'y/"<CR>')

vim.keymap.set("n", "<X1Mouse>", "<C-O>")
vim.keymap.set("n", "<X2Mouse>", "<C-I>")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><c-w>h")
-- keymap("t", "<C-l>", "<C-\\><C-n><c-w>l")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><c-w>j")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><c-w>k")

vim.keymap.set("n", "<leader>r", (function()
    local last_command = " "
    return function()
        vim.ui.input({ prompt = "command:", default = last_command }, function(inp)
            if inp then
                last_command = inp
                vim.cmd('sp +term\\ ' .. last_command:gsub(" ", "\\ "))
            end
        end)
    end
end)(), { desc = "Run a shell command" })

vim.keymap.set("n", "<leader>q", "<cmd>bd!<CR>", { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>H", "<cmd>cd %:p:h | pwd<CR>", { desc = "Cd here" })

vim.keymap.set("n", "<leader>ot", "<cmd>!$TERMINAL --working-directory \"$PWD\"&<CR><CR>", { desc = "Terminal" })
vim.keymap.set("n", "<leader>oc", "<cmd>term cht.sh<CR>", { desc = "Cheet sheet" })

vim.keymap.set("n", "<C-n>", vim.cmd.cnext);
vim.keymap.set("n", "<C-p>", vim.cmd.cprev);

vim.keymap.set("n", "<leader>cl", function()
    local filePath = vim.fn.expand("%")
    local lineNbr = vim.fn.line(".")
    local location = filePath .. ":" .. lineNbr
    vim.fn.setreg("+", location)
end, { desc = "Copy location" })
