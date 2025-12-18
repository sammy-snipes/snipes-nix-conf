require("nvchad.options")

-- add yours here!
-- vim.cmd([[ autocmd BufEnter * if &buftype != "terminal" | lcd %:p:h | endif ]])
-- vim.cmd([[
--   " Store initial working directory when nvim is launched
--   autocmd VimEnter * let g:nvim_startup_cwd = getcwd()
--
--   " Change to file directory when entering buffers, except for Telescope
--   autocmd BufEnter * if &buftype != "terminal" && expand('%:p') !~ "Telescope" | lcd %:p:h | endif
--
--   " Reset to initial directory when using Telescope
--   autocmd User TelescopePreviewerLoaded,TelescopeFinderEnter execute 'lcd ' . g:nvim_startup_cwd
-- ]])
-- Store initial working directory when nvim is launched

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local path = vim.v.argv[#vim.v.argv]

		-- Skip if it's a file or doesn't exist
		if vim.fn.isdirectory(path) == 1 then
			vim.cmd("cd " .. path)
		end
	end,
	once = true,
})
-- Auto-resize terminal buffers when the window is resized
vim.api.nvim_create_autocmd("VimResized", {
	callback = function()
		vim.cmd("wincmd =")
		vim.cmd("mode") -- Force redraw
	end,
})

-- misc optiosn
local o = vim.o
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
