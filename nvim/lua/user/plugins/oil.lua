return {
	"stevearc/oil.nvim",
	lazy = false,
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			keymaps = {
				["<C-r>"] = "actions.refresh",
			},
		})
		local k = vim.keymap
		k.set("n", "<leader>o", "<cmd>Oil<cr>", { desc = "Files Explorer", nowait = true })
	end,
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
