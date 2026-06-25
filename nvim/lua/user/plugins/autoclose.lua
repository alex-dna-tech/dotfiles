return {
	"m4xshen/autoclose.nvim",
	lazy = false,
	config = function()
		require("autoclose").setup({
			options = {
				disabled_filetypes = { "text", "markdown" },
			},
		})
	end,
}
