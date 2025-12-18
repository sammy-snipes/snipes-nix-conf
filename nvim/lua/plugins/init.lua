return {
	-- conform
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		opts = require("configs.conform"),
	},
	{
		"zapling/mason-conform.nvim",
		{
			"zapling/mason-conform.nvim",
			event = "VeryLazy",
			dependencies = { "conform.nvim" },
			config = function()
				require("configs.mason-conform")
			end,
		},
		event = "VeryLazy",
		dependencies = { "conform.nvim" },
		config = function()
			require("configs.mason-conform")
		end,
	},
	-- lsp
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lspconfig" },
		config = function()
			require("configs.mason-lspconfig")
		end,
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("configs.treesitter")
		end,
	},

	-- lsp
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},

	-- lint
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("configs.lint")
		end,
	},
	{
		"rshkarin/mason-nvim-lint",
		event = "VeryLazy",
		dependencies = { "nvim-lint" },
		config = function()
			require("configs.mason-lint")
		end,
	},
	-- LATEX
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		config = function()
			require("configs.vimtex").setup()
		end,
	},
	-- {
	-- 	"L3MON4D3/LuaSnip",
	-- 	config = function()
	-- 		require("luasnip.loaders.from_vscode").lazy_load()
	-- 		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/custom/snippets" })
	-- 	end,
	-- },
	-- dap
	-- {
	--     "mfussenegger/nvim-dap",
	--     config = function()
	--         require("configs.dap")
	--     end,
	-- },
	-- {
	--     "nvim-neotest/nvim-nio",
	-- },
	--
	-- {
	--     "rcarriga/nvim-dap-ui",
	--     dependencies = {
	--         "mfussenegger/nvim-dap",
	--         "nvim-neotest/nvim-nio",
	--     },
	--     config = function()
	--         require("configs.dap-ui")
	--     end,
	-- },
	-- {
	--     "mfussenegger/nvim-dap-python",
	--     ft = "python",
	--     dependencies = {
	--         "mfussenegger/nvim-dap",
	--         "rcarriga/nvim-dap-ui",
	--     },
	--     config = function()
	--         require("configs.dap-python")
	--     end,
	-- },
	-- {
	--     "jay-babu/mason-nvim-dap.nvim",
	--     event = "VeryLazy",
	--     config = function()
	--         require("configs.mason-dap")
	--     end,
	-- },
	-- iron
	-- {
	--     "Vigemus/iron.nvim",
	--     event = "VeryLazy",
	--     config = function()
	--         require("configs.iron")
	--     end,
	-- },
	-- -- snippets
	-- {
	--     "L3MON4D3/LuaSnip",
	--     event = "VeryLazy",
	--     config = function()
	--         require("configs.luasnip")
	--     end,
	-- },
	-- notebooks ?
	-- {
	--     "GCBallesteros/jupytext.nvim",
	--
	--     config = function()
	--         require("configs.jupytext")
	--     end,
	--     lazy = false,
	-- },
}
