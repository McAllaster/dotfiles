vim.pack.add({
	{
		name = 'guess-indent', -- Better indentation heuristics
		src = 'https://github.com/NMAC427/guess-indent.nvim',
		version = '84a4987ff36798c2fc1169cbaff67960aed9776f',
	},
})
require('guess-indent').setup({})
