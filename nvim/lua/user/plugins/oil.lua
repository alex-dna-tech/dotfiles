return {
	"stevearc/oil.nvim",
	lazy = false,
	opts = {
		default_file_explorer = true,
		keymaps = {
			["<C-r>"] = "actions.refresh",
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
