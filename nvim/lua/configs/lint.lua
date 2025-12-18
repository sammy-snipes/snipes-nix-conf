local lint = require("lint")

lint.linters_by_ft = {
	lua = { "luacheck" },
	python = { "mypy", "ruff", "flake8" },
}

lint.linters.luacheck.args = {
	unpack(lint.linters.luacheck.args),
	"--globals",
	"love",
	"vim",
	"reload",
	"--",
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	callback = function()
		lint.try_lint()
	end,
})
