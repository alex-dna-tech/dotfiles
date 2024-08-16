return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("notify").setup({
			minimum_width = 50,
			render = "compact",
			stages = "static",
			timeout = 1500,
		})

		require("noice").setup({
			routes = {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
							{ find = "%d fewer lines" },
							{ find = "%d more lines" },
						},
					},
					opts = { skip = true },
				},
			},
		})

		local k = vim.keymap
		k.set("n", "<leader>nl", function()
			require("noice").cmd("last")
		end, { desc = "Noice Last Message" })

		k.set("n", "<leader>nh", function()
			require("noice").cmd("history")
		end, { desc = "Noice Message History" })

		require("telescope").load_extension("noice")
		k.set("n", "<leader>nt", function()
			require("noice").cmd("telescope")
		end, { desc = "Noice Telescope Message" })
	end,
}
