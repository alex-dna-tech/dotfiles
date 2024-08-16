return {
	"2kabhishek/nerdy.nvim",
	event = "VeryLazy",
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-telescope/telescope.nvim",
	},
	cmd = "Nerdy",
	config = function()
		vim.keymap.set("n", "<leader>ssn", "<cmd>Nerdy<cr>", { desc = "Nerd Icons" })
	end,
}
