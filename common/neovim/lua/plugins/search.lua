vim.pack.add({
	{
		name = 'telescope',
		src = 'https://github.com/nvim-telescope/telescope.nvim',
		version = 'b4da76be54691e854d3e0e02c36b0245f945c2c7',
	},
})

local telescopeBuiltin = require('telescope.builtin')
vim.keymap.set('n', '<leader><space>', telescopeBuiltin.buffers)
vim.keymap.set('n', '<leader>ff', function()
	telescopeBuiltin.find_files({ find_command = { 'rg', '--files', '--hidden', '-g', '!.git' } })
end)
vim.keymap.set('n', '<leader>fb', telescopeBuiltin.current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>fh', telescopeBuiltin.help_tags)
vim.keymap.set('n', '<leader>ft', telescopeBuiltin.tags)
vim.keymap.set('n', '<leader>fg', telescopeBuiltin.grep_string)
vim.keymap.set('n', '<leader>fp', telescopeBuiltin.live_grep)
vim.keymap.set('n', '<leader>fc', function()
	telescopeBuiltin.tags({ only_current_buffer = true })
end)
vim.keymap.set('n', '<leader>?', telescopeBuiltin.oldfiles)
