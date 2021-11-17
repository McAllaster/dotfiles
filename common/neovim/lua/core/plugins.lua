-- Ensure that Packer is installed
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({
		"git",
		"clone",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	vim.api.nvim_command("packadd packer.nvim")
end

-- Plugin definitions
require("packer").startup(function(use)
	-- Colorscheme
	use("sainnhe/gruvbox-material")

	-- Package management
	use("wbthomason/packer.nvim")

	-- Statusline
	use({
		"nvim-lualine/lualine.nvim",
		requires = {'kyazdani42/nvim-web-devicons', opt = true},
		config = function()
			require('lualine').setup({
				options = {
					theme = 'gruvbox-material'
				}
			})
		end,
	})

	-- Editor defaults (usually by project)
	use("editorconfig/editorconfig-vim")

	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup({})
		end,
	})

	-- Fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			require("telescope").setup({})
		end,
	})

	-- Git indicators
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup()
		end,
	})

	-- Tree sitting (syntax, indentation, etc.)
	use({
		"nvim-treesitter/nvim-treesitter",
		branch = "0.5-compat", -- Neovim 'nightly' is targeted by the master branch
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
			})
		end,
	})

	-- Language Server (types, linting, project context, etc.)
	use({
		"neovim/nvim-lspconfig",
		config = function()
			local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

			for type, icon in pairs(signs) do
				local hl = "LspDiagnosticsSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end
		end,
	})

	use({
		"williamboman/nvim-lsp-installer",
		requires = { "neovim/nvim-lspconfig" },
		config = function()
			local lsp_install = require("nvim-lsp-installer")
			lsp_install.on_server_ready(function(server)
				server:setup({})
			end)
		end,
	})
end)
