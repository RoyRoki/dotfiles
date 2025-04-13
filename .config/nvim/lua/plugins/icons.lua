return {
	"nvim-tree/nvim-web-devicons",
	lazy = true, -- Load only when needed
	config = function()
		require("nvim-web-devicons").setup()
	end,
}
