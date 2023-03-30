local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Plugin Management
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins

	-- Text Syntax
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})
	use("neovim/nvim-lspconfig") -- Configurations for Nvim LSP
	use("nvim-lua/lsp-status.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("smiteshp/nvim-navic")
	use("simrat39/rust-tools.nvim")

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	use("Yazeed1s/minimal.nvim")
	use({ "Everblush/everblush.nvim", as = "everblush" })
	use("olivercederborg/poimandres.nvim")
	use("rebelot/kanagawa.nvim")
	use("kvrohit/mellow.nvim")
	use("Yazeed1s/oh-lucy.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("navarasu/onedark.nvim")
	use("Mofiqul/vscode.nvim")
	use("rmehri01/onenord.nvim")
	use({ "ellisonleao/gruvbox.nvim" })
	use("lourenci/github-colors")
	use({ "rockyzhang24/arctic.nvim", requires = { "rktjmp/lush.nvim" } })

	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim")

	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	use("onsails/lspkind-nvim")
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	use({
		"dsznajder/vscode-es7-javascript-react-snippets",
		run = "yarn install --frozen-lockfile && yarn compile",
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
	})

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use("rcarriga/nvim-notify")

	use("lewis6991/gitsigns.nvim")
	use({ "alvarosevilla95/luatab.nvim", requires = "kyazdani42/nvim-web-devicons" })

	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	})

	use("kdheepak/lazygit.nvim")
	--[[ use("andweeb/presence.nvim") ]]
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
