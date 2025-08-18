local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- Set <leader> key to <Space>
map("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Shortcut for file explorer
map("n", "<C-h>", [[:NvimTreeFindFileToggle<CR>]], opt)

-- Spelling
map("n", "<leader>ss", [[:set spell<CR>]], opt)
map("n", "<leader>sx", [[:set nospell<CR>]], opt)

-- Tests
map("n", "<leader>tt", [[:TestFile<CR>]], opt)
map("n", "<leader>tn", [[:TestNearest<CR>]], opt)
map("n", "<leader>ts", [[:TestSuite<CR>]], opt)

-- LSP
map("n", "<leader>ll", [[<cmd>lua vim.diagnostic.open_float()<CR>]], opt)
-- map("n", "<leader>lf", [[<cmd>lua vim.lsp.buf.format()<CR> :EslintFixAll<CR>]], opt)
map("n", "<leader>lf", [[<cmd>lua vim.lsp.buf.format()<CR> :Format<CR>]], opt)
map("n", "<leader>]", [[<cmd>lua vim.diagnostic.goto_next()<CR>]], opt)
map("n", "<leader>[", [[<cmd>lua vim.diagnostic.goto_prev()<CR>]], opt)
map("n", "<leader>la", [[<cmd>lua vim.lsp.buf.code_action()<CR>]], opt)
map("n", "<leader>ld", [[<cmd>lua vim.lsp.buf.definition()<CR>]], opt)
map("n", "<leader>lh", [[<cmd>lua vim.lsp.buf.hover()<CR>]], opt)
map("n", "<leader>lr", [[<cmd>lua vim.lsp.buf.rename()<CR>]], opt)
map("n", "<leader>lt", [[<cmd>lua vim.lsp.buf.type_definition()<CR>]], opt)
map("n", "<leader>li", [[<cmd>lua vim.lsp.buf.implementation()<CR>]], opt)

-- Telescope
map("n", "<leader><space>", [[<cmd>lua require('telescope.builtin').buffers()<CR>]], opt)
map("n", "<leader>ff", [[<cmd>lua require('telescope.builtin').find_files({ find_command = { 'rg', '--files', '--hidden', '-g', '!.git' }})<CR>]], opt)
map("n", "<leader>fb", [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], opt)
map("n", "<leader>fh", [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], opt)
map("n", "<leader>ft", [[<cmd>lua require('telescope.builtin').tags()<CR>]], opt)
map("n", "<leader>fg", [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], opt)
map("n", "<leader>fp", [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], opt)
map("n", "<leader>fc", [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], opt)
map("n", "<leader>?", [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], opt)

-- Workspaces
map("n", "<leader>ww", [[:Telescope workspaces<CR>]], opt)

-- Floaterm
map("n", "<F1>", [[:FloatermToggle<CR>]], opt)
map("i", "<F1>", [[:FloatermToggle<CR>]], opt)
