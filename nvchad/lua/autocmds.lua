require "nvchad.autocmds"

vim.cmd("command! CpRel call setreg('+', expand('%:p:.'))")
vim.keymap.set('n', '<leader>cp', '<cmd>CpRel<CR>', { desc = 'Copy relative path' })
