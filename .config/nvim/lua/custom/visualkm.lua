local M = {}

function M.setup()
	-- Move block of code up and down
	vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true }) -- Move block down
	vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true }) -- Move block up

	-- Escape insert mode with Alt+i
	vim.keymap.set("i", "<M-i>", "<Esc>", { noremap = true, silent = true })

	-- Select all in normal mode
	vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true })

	-- Select all in insert mode
	vim.keymap.set("i", "<C-a>", "<Esc>ggVG", { noremap = true, silent = true })
end

return M
