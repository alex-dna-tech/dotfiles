return {
	"akinsho/bufferline.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup({
			options = {
				mode = "buffers",
				buffer_close_icon = "",
				separator_style = "slant",
			},
		})
	end,
}
