return {
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		ft = "css scss html javascript tsx",
		config = function()
			vim.opt.termguicolors = true
			require("colorizer").setup({})
		end,
	},
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		event = "VeryLazy",
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 2,
			})

			require("cmp").config.formatting = {
				format = require("tailwindcss-colorizer-cmp").formatter,
			}
		end,
	},
}
