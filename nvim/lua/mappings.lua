require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

-- Genral mappings
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- Vimtex mappings for LaTeX
map("n", "<leader>cc", "<cmd>VimtexCompile<CR>", { desc = "Compile LaTeX document" })
map("n", "<leader>cv", "<cmd>VimtexView<CR>", { desc = "View PDF in Zathura" })
map("n", "<leader>cq", "<cmd>VimtexStop<CR>", { desc = "Stop LaTeX compilation" })
map("n", "<leader>ct", "<cmd>VimtexTocToggle<CR>", { desc = "Toggle LaTeX table of contents" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
