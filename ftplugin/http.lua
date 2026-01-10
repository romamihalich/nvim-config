vim.keymap.set('n', '<CR>', function() require'rest-nvim'.run() end, { silent = true, buffer = true })
