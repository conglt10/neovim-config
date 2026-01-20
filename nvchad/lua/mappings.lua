require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<Esc><cmd> w <cr>", { desc = "Save file and escape to Normal Mode" })
map("t", "<C-k>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down" })
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
map("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Git diff" })
map("n", "<leader>gc", "<cmd>DiffviewClose<CR>", { desc = "Git diff close" })
map('t', '<M-w>', [[<C-\><C-n><cmd>q!<CR>]], { desc = "Exit split view" })

