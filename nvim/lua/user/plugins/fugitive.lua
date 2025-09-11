return {
	"tpope/vim-fugitive",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"tpope/vim-rhubarb",
	},
	cmd = "Git",
	config = function()
		local k = vim.keymap
		k.set("n", "<leader>g", "", { desc = "+Git" })
		k.set("n", "<leader>gs", "<cmd>Git<cr>", { desc = "Status" })
		k.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Branches" })
		k.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Commits" })
		k.set("n", "<leader>gr", "<cmd>Gread<cr>", { desc = "Read" })
		k.set("n", "<leader>gw", "<cmd>Gwrite<cr>", { desc = "Write" })
		k.set("n", "<leader>ge", "<cmd>Gedit<cr>", { desc = "Edit" })
		k.set("n", "<leader>gg", "<cmd>GBrowse<cr>", { desc = "Open in Browser" })
		k.set("n", "<leader>gp", "<cmd>Git push<cr>", { desc = "Push" })
		k.set("n", "<leader>gu", "<cmd>Git pull<cr>", { desc = "Pull" })
		-- Diff
		k.set("n", "<leader>gd", "", { desc = "+Diff" })
		k.set("n", "<leader>gdd", "<cmd>Gvdiffsplit<cr>", { desc = "Verticaly 3 way" })
		k.set("n", "<leader>gdh", "<cmd>diffget //2<cr>", { desc = "Merge diff left" })
		k.set("n", "<leader>gdl", "<cmd>diffget //3<cr>", { desc = "Merge diff right" })
		-- Log
		k.set("n", "<leader>gl", "<cmd>Git log<cr>", { desc = "Log" })
		k.set("n", "<leader>gll", "<cmd>Git log<cr>", { desc = "Log" })
		k.set("n", "<leader>glo", "<cmd>Git log --oneline<cr>", { desc = "Log oneline" })
	end,
}
