return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local k = vim.keymap
		local t = require("todo-comments")
		k.set("n", "]t", function()
			t.jump_next()
		end, { desc = "Next Todo" })
		k.set("n", "[t", function()
			t.jump_prev()
		end, { desc = "Previous Todo" })
	end,
}
