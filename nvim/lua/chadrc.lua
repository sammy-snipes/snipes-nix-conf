-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "catppuccin",
	-- opacity = 0.7,
}

M.ui = {
	transparency = true,
	theme = "catppuccin",
	tabufline = {
		-- enabled = false,
	},
}

M.plugins = {
	override = {
		["nvim-telescope/telescope.nvim"] = {
			defaults = {
				change_dir = false,
				cwd_to_path = false,
			},
			pickers = {
				find_files = {
					cwd = vim.fn.getcwd(),
					follow = false,
				},
			},
		},
	},
}
return M
