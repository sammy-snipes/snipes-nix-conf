local M = {}

M.setup = function()
	-- Vimtex configuration
	vim.g.tex_flavor = "latex" -- Default to LaTeX
	vim.g.vimtex_view_method = "zathura" -- Use Zathura for PDF viewing
	vim.g.vimtex_quickfix_mode = 0 -- Disable quickfix window
	vim.g.vimtex_mappings_enabled = 1 -- Enable default mappings
	vim.g.vimtex_indent_enabled = 0 -- Disable auto-indent
	vim.g.vimtex_context_pdf_viewer = "zathura" -- Ensure Zathura for context
	vim.g.vimtex_compiler_method = "latexmk" -- Use latexmk for compilation
	vim.g.vimtex_compiler_latexmk = {
		options = {
			"-pdf",
			"-interaction=nonstopmode",
			"-synctex=1", -- Enable Synctex for forward/inverse search
		},
	}
end

return M
