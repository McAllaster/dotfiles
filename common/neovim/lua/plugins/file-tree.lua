vim.pack.add({
	{
		name = 'nvim-web-devicons', -- dependency
		src = 'https://github.com/nvim-tree/nvim-web-devicons',
	},
	{
		name = 'nvim-tree',
		src = 'https://github.com/nvim-tree/nvim-tree.lua',
	},
})

require('nvim-tree').setup()
vim.keymap.set('n', '<C-h>', ':NvimTreeFindFileToggle<CR>')
