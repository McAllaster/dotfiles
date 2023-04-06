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
	use({
		"f-person/auto-dark-mode.nvim",
		requires = {
			"catppuccin/nvim",
		},
		config = function()
			require("catppuccin").setup({
				flavour = "latte",
				background = {
					light = "latte",
					dark = "mocha",
				},
				transparent_background = true,
				show_end_of_buffer = true,
				dim_inactive = {
					enabled = true,
					shade = "dark",
					percentage = 0.25,
				},
				styles = {
					comments = { "italic" },
					conditionals = { "italic" },
				},
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					telescope = true,
					treesitter = true,
				},
			})

			local auto_dark_mode = require("auto-dark-mode")

			auto_dark_mode.setup({
				update_interval = 1000,
				set_dark_mode = function()
					vim.api.nvim_set_option("background", "dark")
				end,
				set_light_mode = function()
					vim.api.nvim_set_option("background", "light")
				end,
			})

			vim.cmd("colorscheme catppuccin")
			auto_dark_mode.init()
		end,
	})

	-- Package management
	use("wbthomason/packer.nvim")

	-- Surrounding character interaction
	use("tpope/vim-surround")

	-- Indentation/file property automation
	use("tpope/vim-sleuth")
	use("editorconfig/editorconfig-vim")

	-- Tree
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup()
		end,
	})

	-- Comment mappings
	use("tpope/vim-commentary")

	-- Fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						hidden = true
					}
				}
			})
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

	-- Git integration
	use("tpope/vim-fugitive")

	-- Tree sitting (syntax, indentation, etc.)
	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"javascript",
					"typescript",
					"html",
					"css",
					"markdown",
					"fish"
				},
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
	use {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		requires = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
		},
		config = function()
			-- LSPConfig
			local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }

			for type, icon in pairs(signs) do
				local hl = "LspDiagnosticsSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- Mason
			require("mason").setup()

			-- Mason Tool Installer
			require("mason-tool-installer").setup({
				ensure_installed = {
					"eslint-lsp",
					"cspell",
					"graphql-language-service-cli",
					"html-lsp",
					"json-lsp",
					"lua-language-server",
					"typescript-language-server",
					"prettier",
					"yaml-language-server",
				},
				auto_update = true,
				run_on_start = true,
				start_delay = 3000,
				debounce_hours = 5,
			})

			-- Mason LSPConfig
			require("mason-lspconfig").setup()
			require("mason-lspconfig").setup_handlers({
				function(server)
					require("lspconfig")[server].setup({})
				end
			})
		end,
	}
end)
