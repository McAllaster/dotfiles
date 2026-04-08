vim.pack.add({
	{
		name = 'fugitive', -- Use git from within vim
		src = 'https://github.com/tpope/vim-fugitive',
	},
	{
		name = 'gitsigns', -- Git information in gutter
		src = 'https://github.com/lewis6991/gitsigns.nvim',
	},
})
require('gitsigns').setup()
