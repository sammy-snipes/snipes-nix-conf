-- Direct configuration without a setup function
require("jupytext").setup({
    style = "light", -- Use "light" for Python code with cell markers
    output_extension = ".py", -- Generate Python files
    force_ft = nil,
    paired = true, -- Enable paired notebook mode
    custom_language_formatting = {
        python = {
            extension = ".py",
            style = "light",
            comments = "#",
        },
    },
})

-- Uncomment these keybindings for convenience
vim.keymap.set("n", "<leader>jp", function()
    require("jupytext").sync_file()
end, { desc = "Sync Jupytext file" })
vim.keymap.set("n", "<leader>jc", function()
    require("jupytext").convert_file()
end, { desc = "Convert to Jupyter notebook" })

-- Uncomment this auto-detection for ipynb files
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "*.ipynb" },
    callback = function()
        vim.bo.filetype = "jupytext"
        local status, err = pcall(function()
            require("jupytext").convert_file()
        end)
        if not status then
            print("Jupytext error: " .. tostring(err))
        end
    end,
})
