-- This file can be loaded by calling `lua require('plugins')` from your init.vim}}
-- Found at https://stackoverflow.com/questions/76645160/nvim-not-sourcing-packer
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({ "rose-pine/neovim", as = "rose-pine" })

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})

	use("theprimeagen/harpoon")

	use("mbbill/undotree")

	use("tpope/vim-fugitive")

	use({ "neoclide/coc.nvim", branch = "release" })

	use({ "shortcuts/no-neck-pain.nvim", tag = "*" })

	-- Snippets for Vue3
	use("rafamadriz/friendly-snippets")

	use("brenoprata10/nvim-highlight-colors")

	use("navarasu/onedark.nvim")

	use("arnamak/stay-centered.nvim")

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	use("m4xshen/autoclose.nvim")
end)
