vim.pack.add({
	{
		name = 'nvim-web-devicons', -- dependency
		src = 'https://github.com/nvim-tree/nvim-web-devicons',
		version = '6e51ca170563330e063720449c21f43e27ca0bc1',
	},
	{
		name = 'nvim-tree',
		src = 'https://github.com/nvim-tree/nvim-tree.lua',
		version = 'e179ad2f83b5955ab0af653069a493a1828c2697',
	},
})

require('nvim-tree').setup()
vim.keymap.set('n', '<C-h>', ':NvimTreeFindFileToggle<CR>')
