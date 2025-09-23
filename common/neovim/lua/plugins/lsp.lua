vim.pack.add({
	{
		name = 'lspconfig', -- Common LSP configurations
		src = 'https://github.com/neovim/nvim-lspconfig',
		version = 'ef73a4f2a1ddf0439eb97b46de2aab265ddba1cd',
	},
	{
		name = 'typescript-tools', -- Typescript LSP
		src = 'https://github.com/pmizio/typescript-tools.nvim',
		version = 'bf11d98ad5736e1cbc1082ca9a03196d45c701f1',
	},
	{
		name = 'lazydev', -- Lua setup by someone smarter than me
		src = 'https://github.com/folke/lazydev.nvim',
		version = '258d2a5ef4a3e3d6d9ba9da72c9725c53e9afcbd',
	},
	{
		name = 'lint', -- Async linter spawner
		src = 'https://github.com/mfussenegger/nvim-lint',
		version = '0864f81c681e15d9bdc1156fe3a17bd07db5a3ed',
	},
})

-- TypeScript
require('typescript-tools').setup({})

-- Lua
require('lazydev').setup({
	library = {
		{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
	},
})
vim.lsp.enable('lua_ls') -- requires `lua-language-server` in $PATH

-- Linters
require('lint').linters_by_ft = {
	typescript = { 'eslint_d' }, -- Run `npm i -g eslint_d` to install globally
}

local lint_modifiable = function()
	-- Only run the linter in buffers that you can modify (i.e. not LSP popups)
	if vim.bo.modifiable then
		require('lint').try_lint()
	end
end

-- Create a group that lints automatically on certain events
local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
	group = lint_augroup,
	callback = lint_modifiable,
})

vim.keymap.set('n', '<leader>ll', lint_modifiable)
vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>]', vim.diagnostic.goto_next) -- TODO: Replace with non-deprecated alternative
vim.keymap.set('n', '<leader>[', vim.diagnostic.goto_prev) -- TODO: Replace with non-deprecated alternative
vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition)
vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation)

