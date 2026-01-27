vim.pack.add({
	{
		name = 'catppuccin',
		src = 'https://github.com/catppuccin/nvim',
		version = 'f19cab18ec4dc86d415512c7a572863b2adbcc18',
	},
	{
		name = 'auto-dark-mode',
		src = 'https://github.com/FineFindus/auto-dark-mode.nvim',
		version = '0e9a68b91c413b8f96201177da2601fd7e005b7c',
	},
})

require('catppuccin').setup({
	float = {
		transparent = false,
		solid = false,
	},
	flavour = 'latte',
	background = {
		light = 'latte',
		dark = 'mocha',
	},
	transparent_background = false,
	show_end_of_buffer = true,
	dim_inactive = {
		enabled = true,
		shade = 'dark',
		percentage = 0.5,
	},
	styles = {
		comments = { 'italic' },
		conditionals = { 'italic' },
		variables = { 'bold' },
		types = { 'italic' },
	},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		treesitter = true,
		treesitter_context = true,
	},
})

require('auto-dark-mode').setup({
	fallback = 'light',
	update_interval = 1000,
	set_dark_mode = function()
		vim.opt.background = 'dark'
		vim.g.terminal_color_0 = '#45475a'
		vim.g.terminal_color_1 = '#f38ba8'
		vim.g.terminal_color_2 = '#a6e3a1'
		vim.g.terminal_color_3 = '#f9e2af'
		vim.g.terminal_color_4 = '#89b4fa'
		vim.g.terminal_color_5 = '#f5c2e7'
		vim.g.terminal_color_6 = '#94e2d5'
		vim.g.terminal_color_7 = '#bac2de'
		vim.g.terminal_color_8 = '#585b70'
		vim.g.terminal_color_9 = '#f38ba8'
		vim.g.terminal_color_10 = '#a6e3a1'
		vim.g.terminal_color_11 = '#f9e2af'
		vim.g.terminal_color_12 = '#89b4fa'
		vim.g.terminal_color_13 = '#f5c2e7'
		vim.g.terminal_color_14 = '#94e2d5'
		vim.g.terminal_color_15 = '#a6adc8'
	end,
	set_light_mode = function()
		vim.opt.background = 'light'
		vim.g.terminal_color_0 = '#5c5f77'
		vim.g.terminal_color_1 = '#d20f39'
		vim.g.terminal_color_2 = '#40a02b'
		vim.g.terminal_color_3 = '#df8e1d'
		vim.g.terminal_color_4 = '#1e66f5'
		vim.g.terminal_color_5 = '#ea76cb'
		vim.g.terminal_color_6 = '#179299'
		vim.g.terminal_color_7 = '#acb0be'
		vim.g.terminal_color_8 = '#6c6f85'
		vim.g.terminal_color_9 = '#d20f39'
		vim.g.terminal_color_10 = '#40a02b'
		vim.g.terminal_color_11 = '#df8e1d'
		vim.g.terminal_color_12 = '#1e66f5'
		vim.g.terminal_color_13 = '#ea76cb'
		vim.g.terminal_color_14 = '#179299'
		vim.g.terminal_color_15 = '#bcc0cc'
	end,
})

vim.cmd('colorscheme catppuccin')

require('auto-dark-mode').init()
