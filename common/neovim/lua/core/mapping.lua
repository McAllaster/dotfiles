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
map("n", "<leader>ll", [[<cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>]], opt)
map("n", "<leader>]", [[<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<CR>]], opt)
map("n", "<leader>[", [[<cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<CR>]], opt)
map("n", "<leader>ls", [[<cmd>lua require('lspsaga.provider').lsp_finder()<CR>]], opt)
map("n", "<leader>la", [[<cmd>lua require('lspsaga.codeaction').code_action()<CR>]], opt)
map("v", "<leader>la", [[<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>]], opt)
map("n", "<leader>ld", [[<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>]], opt)
map("n", "<leader>lh", [[<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>]], opt)
map("n", "<leader>lr", [[<cmd>lua require('lspsaga.rename').rename()<CR>]], opt)
map("n", "<leader>lp", [[<cmd>lua require('lspsaga.provider').preview_definition()<CR>]], opt)

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
