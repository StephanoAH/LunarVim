return {
	-- Packer can manage itself as an optional plugin
	{ "wbthomason/packer.nvim" },

	-- TODO: refactor all of this (for now it works, but yes I know it could be wrapped in a simpler function)
	{ "neovim/nvim-lspconfig" },
	{ "tamago324/nlsp-settings.nvim" },
	{ "jose-elias-alvarez/null-ls.nvim" },
	{
		"kabouzeid/nvim-lspinstall",
		event = "VimEnter",
		config = function()
			local lspinstall = require("lspinstall")
			lspinstall.setup()
			if LV.plugin.lspinstall.on_config_done then
				LV.plugin.lspinstall.on_config_done(lspinstall)
			end
		end,
	},

	{ "nvim-lua/popup.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{ "tjdevries/astronauta.nvim" },

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("core.telescope").setup()
			if LV.plugin.telescope.on_config_done then
				LV.plugin.telescope.on_config_done(require("telescope"))
			end
		end,
	},

	-- Autocomplete
	{
		"hrsh7th/nvim-compe",
		-- event = "InsertEnter",
		config = function()
			require("core.compe").setup()
			if LV.plugin.compe.on_config_done then
				LV.plugin.compe.on_config_done(require("compe"))
			end
		end,
	},

	-- Autopairs
	{
		"windwp/nvim-autopairs",
		-- event = "InsertEnter",
		config = function()
			require("core.autopairs")
			if LV.plugin.autopairs.on_config_done then
				LV.plugin.autopairs.on_config_done(require("nvim-autopairs"))
			end
		end,
	},

	-- Snippets

	{ "hrsh7th/vim-vsnip", event = "InsertEnter" },
	{ "rafamadriz/friendly-snippets", event = "InsertEnter" },

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("core.treesitter").setup()
			if LV.plugin.treesitter.on_config_done then
				LV.plugin.treesitter.on_config_done(require("nvim-treesitter.configs"))
			end
		end,
	},

	-- Formatter.nvim
	{
		"mhartington/formatter.nvim",
		config = function()
			require("core.formatter")
			if LV.plugin.formatter.on_config_done then
				LV.plugin.formatter.on_config_done(require("formatter"))
			end
		end,
	},

	-- Linter
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("core.linter").setup()
			if LV.plugin.lint.on_config_done then
				LV.plugin.lint.on_config_done(require("lint"))
			end
		end,
	},

	-- NvimTree
	{
		"kyazdani42/nvim-tree.lua",
		-- event = "BufWinOpen",
		-- cmd = "NvimTreeToggle",
		-- commit = "fd7f60e242205ea9efc9649101c81a07d5f458bb",
		config = function()
			require("core.nvimtree").setup()
			if LV.plugin.nvimtree.on_config_done then
				LV.plugin.nvimtree.on_config_done(require("nvim-tree.config"))
			end
		end,
	},

	{
		"lewis6991/gitsigns.nvim",

		config = function()
			require("core.gitsigns").setup()
			if LV.plugin.gitsigns.on_config_done then
				LV.plugin.gitsigns.on_config_done(require("gitsigns"))
			end
		end,
		event = "BufRead",
	},

	-- Whichkey
	{
		"folke/which-key.nvim",
		config = function()
			require("core.which-key").setup()
			if LV.plugin.which_key.on_config_done then
				LV.plugin.which_key.on_config_done(require("which-key"))
			end
		end,
		event = "BufWinEnter",
	},

	-- Comments
	{
		"terrortylor/nvim-comment",
		event = "BufRead",
		config = function()
			local status_ok, nvim_comment = pcall(require, "nvim_comment")
			if not status_ok then
				return
			end
			nvim_comment.setup()
			if LV.plugin.comment.on_config_done then
				LV.plugin.comment.on_config_done(nvim_comment)
			end
		end,
	},

	-- vim-rooter
	{
		"airblade/vim-rooter",
		config = function()
			vim.g.rooter_silent_chdir = 1
			if LV.plugin.rooter.on_config_done then
				LV.plugin.rooter.on_config_done()
			end
		end,
	},

	-- Icons
	{ "kyazdani42/nvim-web-devicons" },

	-- Status Line and Bufferline
	{
		"glepnir/galaxyline.nvim",
		config = function()
			require("core.galaxyline")
			if LV.plugin.galaxyline.on_config_done then
				LV.plugin.galaxyline.on_config_done(require("galaxyline"))
			end
		end,
		event = "BufWinEnter",
		disable = not LV.plugin.galaxyline.active,
	},

	{
		"romgrk/barbar.nvim",
		config = function()
			require("core.bufferline")
			if LV.plugin.bufferline.on_config_done then
				LV.plugin.bufferline.on_config_done()
			end
		end,
		event = "BufWinEnter",
	},

	-- Debugging
	{
		"mfussenegger/nvim-dap",
		-- event = "BufWinEnter",
		config = function()
			require("core.dap").setup()
			if LV.plugin.dap.on_config_done then
				LV.plugin.dap.on_config_done(require("dap"))
			end
		end,
		disable = not LV.plugin.dap.active,
	},

	-- Debugger management
	{
		"Pocco81/DAPInstall.nvim",
		-- event = "BufWinEnter",
		-- event = "BufRead",
		disable = not LV.plugin.dap.active,
	},

	-- Dashboard
	{
		"ChristianChiarulli/dashboard-nvim",
		event = "BufWinEnter",
		config = function()
			require("core.dashboard").setup()
			if LV.plugin.dashboard.on_config_done then
				LV.plugin.dashboard.on_config_done(require("dashboard"))
			end
		end,
		disable = not LV.plugin.dashboard.active,
	},

	-- Terminal
	{
		"akinsho/nvim-toggleterm.lua",
		event = "BufWinEnter",
		config = function()
			require("core.terminal").setup()
			if LV.plugin.terminal.on_config_done then
				LV.plugin.terminal.on_config_done(require("toggleterm"))
			end
		end,
		disable = not LV.plugin.terminal.active,
	},
}
