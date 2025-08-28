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
				transparent_background = false,
				show_end_of_buffer = true,
				dim_inactive = {
					enabled = true,
					shade = "dark",
					percentage = 0.5,
				},
				styles = {
					comments = { "italic" },
					conditionals = { "italic" },
					variables = { "bold" },
					types = { "italic" },
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

			local auto_dark_mode = require("auto-dark-mode")

			auto_dark_mode.setup({
				fallback = "light",
				update_interval = 1000,
				set_dark_mode = function()
					vim.api.nvim_set_option("background", "dark")
					vim.g.terminal_color_0 = "#45475a"
					vim.g.terminal_color_1 = "#f38ba8"
					vim.g.terminal_color_2 = "#a6e3a1"
					vim.g.terminal_color_3 = "#f9e2af"
					vim.g.terminal_color_4 = "#89b4fa"
					vim.g.terminal_color_5 = "#f5c2e7"
					vim.g.terminal_color_6 = "#94e2d5"
					vim.g.terminal_color_7 = "#bac2de"
					vim.g.terminal_color_8 = "#585b70"
					vim.g.terminal_color_9 = "#f38ba8"
					vim.g.terminal_color_10 = "#a6e3a1"
					vim.g.terminal_color_11 = "#f9e2af"
					vim.g.terminal_color_12 = "#89b4fa"
					vim.g.terminal_color_13 = "#f5c2e7"
					vim.g.terminal_color_14 = "#94e2d5"
					vim.g.terminal_color_15 = "#a6adc8"
				end,
				set_light_mode = function()
					vim.api.nvim_set_option("background", "light")
					vim.g.terminal_color_0 = "#5c5f77"
					vim.g.terminal_color_1 = "#d20f39"
					vim.g.terminal_color_2 = "#40a02b"
					vim.g.terminal_color_3 = "#df8e1d"
					vim.g.terminal_color_4 = "#1e66f5"
					vim.g.terminal_color_5 = "#ea76cb"
					vim.g.terminal_color_6 = "#179299"
					vim.g.terminal_color_7 = "#acb0be"
					vim.g.terminal_color_8 = "#6c6f85"
					vim.g.terminal_color_9 = "#d20f39"
					vim.g.terminal_color_10 = "#40a02b"
					vim.g.terminal_color_11 = "#df8e1d"
					vim.g.terminal_color_12 = "#1e66f5"
					vim.g.terminal_color_13 = "#ea76cb"
					vim.g.terminal_color_14 = "#179299"
					vim.g.terminal_color_15 = "#bcc0cc"
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
			"natecraddock/workspaces.nvim",
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("workspaces").setup()
			require("telescope").setup({
				pickers = {
					find_files = {
						hidden = true
					}
				}
			})
			require("telescope").load_extension("workspaces")
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
					"angular",
					"bash",
					"c",
					"css",
					"csv",
					"dockerfile",
					"fish",
					"git_config",
					"git_rebase",
					"gitcommit",
					"gitignore",
					"go",
					"gpg",
					"html",
					"javascript",
					"jsdoc",
					"latex",
					"lua",
					"make",
					"markdown_inline",
					"python",
					"rust",
					"toml",
					"typescript",
					"vim",
					"vimdoc",
					"xml",
					"yaml",
				},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
				},
			})
		end,
	})

	-- Language Server (types, linting, project context, etc.)
	use {
		"williamboman/mason.nvim",
		requires = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"mhartington/formatter.nvim",
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

			-- Formatter
			require("formatter").setup({
				logging = true,
				log_level = vim.log.levels.WARN,
				filetype = {
					css = {
						require("formatter.filetypes.css").prettier
					},
					graphql = {
						require("formatter.filetypes.graphql").prettier
					},
					html = {
						require("formatter.filetypes.html").prettier
					},
					javascript = {
						require("formatter.filetypes.javascript").prettier
					},
					javascriptreact = {
						require("formatter.filetypes.javascriptreact").prettier
					},
					json = {
						require("formatter.filetypes.json").prettier
					},
					markdown = {
						require("formatter.filetypes.markdown").prettier
					},
					svelte = {
						require("formatter.filetypes.svelte").prettier
					},
					typescript = {
						require("formatter.filetypes.typescript").prettier
					},
					typescriptreact = {
						require("formatter.filetypes.typescriptreact").prettier
					},
					vue = {
						require("formatter.filetypes.vue").prettier
					},
					yaml = {
						require("formatter.filetypes.yaml").prettier
					},
				}
			})

			-- Mason LSPConfig
			require("mason-lspconfig").setup({
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
			})
		end,
	}
end)
