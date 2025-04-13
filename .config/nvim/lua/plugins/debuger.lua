return {
	"mfussenegger/nvim-dap", -- Core Debug Adapter Protocol plugin
	config = function()
		local dap = require("dap")
		local widgets = require("dap.ui.widgets")

		-- Keymaps for debugging
		vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })

		vim.keymap.set("n", "<leader>dus", function()
			local sidebar = widgets.sidebar(widgets.scopes)
			sidebar.open()
		end, { desc = "Open debugging sidebar" })
	end,

	{
		"leoluz/nvim-dap-go", -- Go Debug Adapter
		ft = "go",
		dependencies = "mfussenegger/nvim-dap",
		config = function(_, opts)
			require("dap-go").setup(opts)
		end,
	},
}
