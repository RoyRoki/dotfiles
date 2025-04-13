return {
	"ray-x/lsp_signature.nvim",
	event = "LspAttach",
	opts = {
		hint_enable = true,
		handler_opts = {
			border = "rounded",
		},
	},
	config = function(_, opts)
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local bufnr = args.buf
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client then
					require("lsp_signature").on_attach(opts, bufnr)
				end
			end,
		})
	end,
}
