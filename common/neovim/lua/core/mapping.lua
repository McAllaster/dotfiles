local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- Set <leader> key to <Space>
map("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Shortcut for file explorer
map("n", "<C-h>", [[:NvimTreeToggle<CR>]], opt)

-- LSP
map("n", "<leader>lf", [[<cmd>lua vim.lsp.buf.formatting_seq_sync(nil, 2000)<CR>]], opt)
map("n", "<leader>ll", [[<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>]], opt)
map("n", "<leader>]", [[<cmd>lua vim.lsp.diagnostic.goto_next()<CR>]], opt)
map("n", "<leader>[", [[<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>]], opt)
map("n", "<leader>la", [[<cmd>lua vim.lsp.buf.code_action()<CR>]], opt)
map("n", "<leader>ld", [[<cmd>lua vim.lsp.buf.hover()<CR>]], opt)
map("n", "<leader>lh", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]], opt)
map("n", "<leader>lr", [[<cmd>lua vim.lsp.buf.rename()<CR>]], opt)
map("n", "<leader>lp", [[<cmd>lua vim.lsp.buf.type_definition()<CR>]], opt)

-- Telescope
map("n", "<leader><space>", [[<cmd>lua require('telescope.builtin').buffers()<CR>]], opt)
map("n", "<leader>ff", [[<cmd>lua require('telescope.builtin').find_files()<CR>]], opt)
map("n", "<leader>fb", [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], opt)
map("n", "<leader>fh", [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], opt)
map("n", "<leader>ft", [[<cmd>lua require('telescope.builtin').tags()<CR>]], opt)
map("n", "<leader>fg", [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], opt)
map("n", "<leader>fp", [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], opt)
map("n", "<leader>fc", [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], opt)
map("n", "<leader>?", [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], opt)
