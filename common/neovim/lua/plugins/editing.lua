vim.pack.add({
	{
		name = 'guess-indent', -- Better indentation heuristics
		src = 'https://github.com/NMAC427/guess-indent.nvim',
	},
})
require('guess-indent').setup({})
