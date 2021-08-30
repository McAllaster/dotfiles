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
	-- Package management
	use("wbthomason/packer.nvim")

	-- Statusline
	use("vim-airline/vim-airline")

	-- Editor defaults (usually by project)
	use("editorconfig/editorconfig-vim")

	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons" },
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
		"kabouzeid/nvim-lspinstall",
		requires = { "neovim/nvim-lspconfig" },
		config = function()
			local lsp_init = function()
				local lsp_install = require("lspinstall")
				local nvim_lsp = require("lspconfig")

				lsp_install.setup()

				for _, server in pairs(lsp_install.installed_servers()) do
					if server == "elmls" then
						local custom_attach = function(client)
							if client.config.flags then
								client.config.flags.allow_incremental_sync = true
							end
						end

						nvim_lsp[server].setup({
						   on_attach = custom_attach;
						})
					elseif server == "efm" then
						local elmformat = {
							formatCommand = [[./node_modules/.bin/elm-format --stdin]],
							formatStdin = true,
						}

						-- Ensure that eslint_d is in your $PATH!
						-- Tip: If linting isn't working, try `eslint_d restart`
						local eslint = {
							lintCommand = [[eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}]],
							lintIgnoreExitCode = true,
							lintStdin = true,
							lintFormats = {
								[[%f(%l,%c): %tarning %m]],
								[[%f(%l,%c): %rror %m]],
							},
							formatCommand = [[eslint_d -f visualstudio --stdin --stdin-filename ${INPUT} --fix-to-stdout]],
							formatStdin = true,
						}

						local prettier = {
							formatCommand = [[./node_modules/.bin/prettier --stdin-filepath ${INPUT}]],
							formatStdin = true,
						}

						local stylua = {
							formatCommand = "stylua -s -",
							formatStdin = true,
						}

						local languages = {
							css = { prettier },
							elm = { elmformat },
							html = { prettier },
							javascript = { prettier, eslint },
							javascriptreact = { prettier, eslint },
							json = { prettier },
							lua = { stylua },
							markdown = { prettier },
							scss = { prettier },
							typescript = { prettier, eslint },
							typescriptreact = { prettier, eslint },
							yaml = { prettier },
						}

						nvim_lsp[server].setup({
							init_options = { documentFormatting = true },
							filetypes = vim.tbl_keys(languages),
							settings = {
								languages = languages,
								lintDebounce = 500,
								rootMarkers = { "package.json", ".git" },
							},
						})
					else
						nvim_lsp[server].setup({})
					end
				end
			end

			require("lspinstall").post_install_hook = lsp_init

			lsp_init()
		end,
	})
end)
