return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					javascript = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					json = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
					markdown = { "prettier" },
					yaml = { "prettier" },
					lua = { "stylua" },
				},
				format_on_save = function(bufnr)
					-- Disable for Lua files (optional)
					local ft = vim.bo[bufnr].filetype
					return ft ~= "lua"
				end,
			})
		end,
	},
}
