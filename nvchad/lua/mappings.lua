require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map({ "n", "i", "v" }, "<C-s>", "<Esc><cmd> w <cr>", { desc = "Save file and escape to Normal Mode" })
map("t", "<C-k>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
