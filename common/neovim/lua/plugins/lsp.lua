vim.pack.add({
	{
		name = 'lspconfig', -- Common LSP configurations
		src = 'https://github.com/neovim/nvim-lspconfig',
	},
	{
		name = 'typescript-tools', -- Typescript LSP
		src = 'https://github.com/pmizio/typescript-tools.nvim',
	},
	{
		name = 'lazydev', -- Lua setup by someone smarter than me
		src = 'https://github.com/folke/lazydev.nvim',
	},
	{
		name = 'lint', -- Async linter spawner
		src = 'https://github.com/mfussenegger/nvim-lint',
	},
	{
		name = 'conform', -- Powerful formatter
		src = 'https://github.com/stevearc/conform.nvim',
	},
})

require('typescript-tools').setup({}) -- Requires `npm i -g typescript`
require('lazydev').setup({})
vim.lsp.enable('lua_ls') -- Requires `lua-language-server` in $PATH
vim.lsp.enable('jsonls') -- Requires `npm i -g vscode-langservers-extracted`
vim.lsp.enable('tofu_ls') -- Requires `tofu` in $PATH
vim.lsp.enable('svelte') -- Requires `npm i -g svelte-language-server`

-- Linters
local lint = require('lint')
lint.linters_by_ft = {
	javascript = { 'eslint_d' }, -- Requires`npm i -g eslint_d`
	typescript = { 'eslint_d' }, -- Requires`npm i -g eslint_d`
}

local lint_modifiable = function()
	-- Only run the linter in buffers that you can modify (i.e. not LSP popups)
	if vim.bo.modifiable then
		lint.try_lint()
	end
end

-- Create a group that lints automatically on certain events
local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
	group = lint_augroup,
	callback = lint_modifiable,
})

local conform = require('conform')
local conformConfig = {
	lsp_format = 'fallback',
	formatters_by_ft = {
		lua = { 'stylua' },
		javascript = { 'prettierd' },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = 'fallback',
	},
}
conformConfig.formatters_by_ft.javascriptreact = conformConfig.formatters_by_ft.javascript
conformConfig.formatters_by_ft.typescript = conformConfig.formatters_by_ft.javascript
conformConfig.formatters_by_ft.typescriptreact = conformConfig.formatters_by_ft.javascript

conform.setup(conformConfig)

vim.keymap.set('n', '<leader>ll', lint_modifiable)
vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>lf', conform.format)
vim.keymap.set('n', '<leader>]', vim.diagnostic.goto_next) -- TODO: Replace with non-deprecated alternative
vim.keymap.set('n', '<leader>[', vim.diagnostic.goto_prev) -- TODO: Replace with non-deprecated alternative
vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition)
vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation)
