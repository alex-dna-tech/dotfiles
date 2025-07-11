return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-symbols.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local k = vim.keymap
		local builtin = require("telescope.builtin")

		k.set("n", "<leader>f", "", { desc = "+Files" })
		k.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
		k.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find Recent Files" })
		k.set("n", "<leader>fs", function()
			local ivy = require("telescope.themes").get_ivy()
			builtin.live_grep(ivy)
		end, { desc = "Find String" })
		k.set("n", "<leader>fc", builtin.grep_string, { desc = "Find String Under Cursor" })
		k.set(
			"n",
			"<leader>b",
			"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			{ desc = "Buffers" }
		)
		k.set("n", "<leader>c", "<cmd>bdelete<CR>", { desc = "Close Buffer" })
		k.set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "Files Explorer" })
		k.set("n", "<leader>w", "<cmd>w!<CR>", { desc = "Write" })
		k.set("n", "<leader>q", "<cmd>q!<CR>", { desc = "Quit" })
		k.set("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "No Highlight" })
		k.set(
			"n",
			"<leader>P",
			"<cmd>lua require('telescope').extensions.projects.projects()<cr>",
			{ desc = "Projects" }
		)

		-- Search
		k.set("n", "<leader>s", "", { desc = "+Search" })
		k.set("n", "<leader>sh", builtin.help_tags, { desc = "Find Help" })
		k.set("n", "<leader>sM", builtin.man_pages, { desc = "Man Pages" })
		k.set("n", "<leader>sr", builtin.registers, { desc = "Registers" })
		k.set("n", "<leader>sk", builtin.keymaps, { desc = "Keymaps" })
		k.set("n", "<leader>sc", builtin.commands, { desc = "Commands" })
		k.set("n", "<leader>sC", builtin.colorscheme, { desc = "Colorscheme" })
		-- +Symbols
		k.set("n", "<leader>ss", "", { desc = "+Symbols" })
		k.set(
			"n",
			"<leader>sse",
			"<cmd>lua require'telescope.builtin'.symbols{ sources = {'emoji'} }<cr>",
			{ desc = "Emoji" }
		)
		k.set(
			"n",
			"<leader>ssg",
			"<cmd>lua require'telescope.builtin'.symbols{ sources = {'gitmoji'} }<cr>",
			{ desc = "Gitmoji" }
		)
	end,
}
