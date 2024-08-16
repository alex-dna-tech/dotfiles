return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
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
		k.set("n", "<leader>f", "", { desc = "+Files" })
		k.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
		k.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Find Recent Files" })
		k.set("n", "<leader>fs", "<cmd>Telescope live_grep theme=ivy<cr>", { desc = "Find String" })
		-- k.set("n", "<leader>F", "<cmd>Telescope live_grep theme=ivy<cr>", { desc = "Find Text" })
		k.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find String Under Cursor" })
		k.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find Todos" })

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
		k.set("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "Find Help" })
		k.set("n", "<leader>sM", "<cmd>Telescope man_pages<cr>", { desc = "Man Pages" })
		k.set("n", "<leader>sr", "<cmd>Telescope registers<cr>", { desc = "Registers" })
		k.set("n", "<leader>sR", "<cmd>Telescope oldfiles<cr>", { desc = "Open Recent File" })
		k.set("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })
		k.set("n", "<leader>sc", "<cmd>Telescope commands<cr>", { desc = "Commands" })
		k.set("n", "<leader>sC", "<cmd>Telescope colorscheme<cr>", { desc = "Colorscheme" })
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
