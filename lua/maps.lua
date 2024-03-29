local map = vim.keymap.set
local default_opts = { noremap = true, silent = true }
local cmd = vim.cmd

map("n", "<C-b>", ":NvimTreeToggle<CR>", default_opts) -- open/close
map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", default_opts)
map('n', '<leader>gr', "<cmd>lua require('telescope.builtin').live_grep()<cr>", default_opts)
map('n', '<leader>bf', "<cmd>lua require('telescope.builtin').buffers()<cr>", default_opts)
map("i", "jj", "<Esc>", default_opts)
map("v", "aa", "<Esc>", default_opts)
map("n", "<C-h>", "<C-w>h", default_opts)
map("n", "<C-l>", "<C-w>l", default_opts)
map("n", "<C-j>", "<C-w>j", default_opts)
map("n", "<C-k>", "<C-w>k", default_opts)
map("n", "<A-h>", ":vertical resize -2<CR>", default_opts)
map("n", "<A-l>", ":vertical resize +2<CR>", default_opts)
map("n", "<A-j>", ":resize +2<CR>", default_opts)
map("n", "<A-k>", ":resize -2<CR>", default_opts)
map("v", "J", ":m '>+1<CR>gv=gv", default_opts)
map("v", "K", ":m '<-2<CR>gv=gv", default_opts)
map("x", "<leader>p", "\"_dP", default_opts)
map("n", "<leader>y", "\"+y", default_opts)
map("v", "<leader>y", "\"+y", default_opts)
map("n", "<leader>Y", "\"+Y", default_opts)
