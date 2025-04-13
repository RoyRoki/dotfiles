local M = {}

function M.setup()
	-- Switch to the next buffer
	vim.keymap.set("n", "<Tab>", function()
		local buffers = vim.fn.getbufinfo({ buflisted = 1 })
		if #buffers > 1 then
			vim.cmd("bnext")
		end
	end, { noremap = true, silent = true })

	-- Switch to the previous buffer
	vim.keymap.set("n", "<S-Tab>", function()
		local buffers = vim.fn.getbufinfo({ buflisted = 1 })
		if #buffers > 1 then
			vim.cmd("bprevious")
		end
	end, { noremap = true, silent = true })

	vim.keymap.set("n", "<leader>j", "<cmd>b#<CR>", { noremap = true, silent = true, desc = "Last buffer" })

	-- Close current buffer and switch to previous
	vim.keymap.set("n", "<Leader>bd", function()
		vim.cmd("bp | bd #")
	end, { noremap = true, silent = true })

	-- Save and close buffer
	vim.keymap.set("n", "<Leader>bs", function()
		vim.cmd("w | bp | bd #")
	end, { noremap = true, silent = true })

	-- Reload buffer
	vim.keymap.set("n", "<Leader>br", "<cmd>edit!<CR>", { noremap = true, silent = true })

	-- Close all other buffers
	vim.keymap.set("n", "<Leader>bo", "<cmd>%bd|e#|bd#<CR>", { noremap = true, silent = true })

	-- Close all buffers
	vim.keymap.set("n", "<Leader>ba", "<cmd>%bd<CR>", { noremap = true, silent = true })

	-- List buffers
	vim.keymap.set("n", "<Leader>bl", "<cmd>ls<CR>", { noremap = true, silent = true })
end

return M
