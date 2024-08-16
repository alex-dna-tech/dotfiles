return {
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		ft = "css scss html javascript tsx",
		config = function()
			vim.opt.termguicolors = true
			require("colorizer").setup()
		end,
	},
	{
		"laytan/tailwind-sorter.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		build = "cd formatter && npm i && npm run build",
		config = function()
			require("tailwind-sorter").setup({
				on_save_enabled = true,
				on_save_pattern = {
					"*.hbs",
					"*.html",
					"*.js",
					"*.jsx",
					"*.php",
					"*.templ",
					"*.tsx",
					"*.twig",
				},
				node_path = "node",
			})
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
