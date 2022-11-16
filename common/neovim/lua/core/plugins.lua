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

	-- Surrounding character interaction
	use("tpope/vim-surround")

	-- Indentation/file property automation
	use("tpope/vim-sleuth")
	use("editorconfig/editorconfig-vim")

	-- Tree
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		config = function()
			require("nvim-tree").setup()
		end,
	}

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

	use {
		"williamboman/mason-lspconfig.nvim",
		requires = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"eslint",
					"graphql",
					"html",
					"jsonls",
					"sumneko_lua",
					"tsserver",
					"yamlls",
				},
				automatic_installation = true,
			})
			require("mason-lspconfig").setup_handlers({
				function(server)
					require("lspconfig")[server].setup({})
				end
			})
		end,
	}

	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("null-ls").setup({
				sources = {
					require("null-ls").builtins.diagnostics.cspell, -- spellcheck
				}
			})
		end,
	})
end)
