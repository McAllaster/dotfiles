vim.pack.add({
	{
		name = 'fugitive', -- Use git from within vim
		src = 'https://github.com/tpope/vim-fugitive',
		version = '61b51c09b7c9ce04e821f6cf76ea4f6f903e3cf4',
	},
	{
		name = 'gitsigns', -- Git information in gutter
		src = 'https://github.com/lewis6991/gitsigns.nvim',
		version = 'f780609807eca1f783a36a8a31c30a48fbe150c5',
	},
})
require('gitsigns').setup()
