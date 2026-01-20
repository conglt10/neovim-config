local map = vim.keymap.set

map('n', '<leader>cp', '<cmd>CpRel<CR>', { desc = 'Copy relative path' })

local function open_copilot_term()
  local width = math.floor(vim.o.columns * 0.33)
  vim.cmd("vsplit")
  vim.cmd("vertical resize " .. width)
  vim.cmd("term copilot")
  vim.cmd("startinsert")
end

local function open_gemini_term()
  local width = math.floor(vim.o.columns * 0.33)
  vim.cmd("vsplit")
  vim.cmd("vertical resize " .. width)
  vim.cmd("term gemini")
  vim.cmd("startinsert")
end

local function open_opencode_term()
  local width = math.floor(vim.o.columns * 0.33)
  vim.cmd("vsplit")
  vim.cmd("vertical resize " .. width)
  vim.cmd("term opencode")
  vim.cmd("startinsert")
end

map('n', '<M-b>', open_opencode_term, { desc = "Open opencode terminal (1/3 width)" })
map('n', '<M-l>', open_copilot_term, { desc = "Open copilot terminal (1/3 width)" })
map('n', '<C-g>', open_gemini_term, { desc = "Open gemini terminal (1/3 width)" })
map('t', '<M-w>', [[<C-\><C-n><cmd>q!<CR>]], { desc = "Exit split view" })


