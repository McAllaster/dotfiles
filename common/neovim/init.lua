-------------
-- Options --
-------------

vim.o.updatetime = 250 -- faster update interval
vim.o.autoread = true -- auto update outside changes
vim.o.hidden = true -- don't save when switching buffers
vim.g.editorconfig = true -- use editorconfig https://editorconfig.org/

vim.o.ignorecase = true -- ignore casing for patterns
vim.o.smartcase = true -- re-enable case for patterns when caps are present
vim.o.hlsearch = true -- continually highlight all search results

vim.o.ruler = true -- show cursor position
vim.o.number = true -- precede lines with their number
vim.o.relativenumber = true -- use relative line numbers instead
vim.wo.signcolumn = 'yes'
vim.o.wrap = true
vim.o.linebreak = true -- only wrap at sensible characters
vim.o.breakindent = true -- indent wrapped lines
vim.o.scrolloff = 2 -- keep at least this many lines around cursor
vim.o.list = true -- display unprintable characters
vim.o.listchars = 'tab:→ ,space:·,nbsp:␣,trail:•,eol:↵,precedes:«,extends:»'
vim.o.tabstop = 4 -- render tabs as four spaces
vim.o.laststatus = 3 -- global statusline

--------------
-- Mappings --
--------------
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Spelling
vim.keymap.set('n', '<leader>ss', ':set spell<CR>')
vim.keymap.set('n', '<leader>sx', ':set nospell<CR>')

-------------
-- Plugins --
-------------

-- Dependency for many (shared/common lua functions)
vim.pack.add({
	{
		name = 'plenary',
		src = 'https://github.com/nvim-lua/plenary.nvim',
		version = 'b9fd5226c2f76c951fc8ed5923d85e4de065e509',
	},
	{
		name = 'treesitter',
		src = 'https://github.com/nvim-treesitter/nvim-treesitter',
		version = '42fc28ba918343ebfd5565147a42a26580579482',
	},
})

require('nvim-treesitter.configs').setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
})

require('plugins.editing')
require('plugins.file-tree')
require('plugins.git')
require('plugins.search')
require('plugins.lsp')
require('plugins.visuals')
