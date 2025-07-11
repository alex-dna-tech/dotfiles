return {
	"epwalsh/obsidian.nvim",
	event = { "BufReadPre", "BufNewFile" },
	version = "*",
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("obsidian").setup({
			workspaces = {
				{
					name = "personal",
					path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Trans",
				},
				{
					name = "work",
					path = "~/Nextcloud/Documents/Notes",
				},
			},

			---@diagnostic disable-next-line: missing-fields
			daily_notes = {
				folder = "Calendar/Daily",
			},

			disable_frontmatter = true,
			ui = { enable = false },
		})

		-- Obsidian integration
		--- https://github.com/TheseusGrey/edit-in-neovim
		-- If you want to use "~", you need to prefix the vault path with vim.fn.expand "~"
		local vault_location = vim.fn.expand("~") .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/Trans"
		local vault_pattern = vault_location .. "/**.md"
		local group = vim.api.nvim_create_augroup("obsidian_cmds", { clear = true })
		vim.api.nvim_create_autocmd("BufAdd", {
			command = "ObsidianOpen",
			pattern = { vault_pattern },
			group = group,
			desc = "Opens the current buffer in Obsidian",
		})

		-- navigate to vault
		vim.keymap.set("n", "<leader>ov", ":cd " .. vault_location .. "<cr>")
		vim.keymap.set("n", "<leader>oo", ":ObsidianOpen")
		vim.keymap.set("n", "<leader>od", ":ObsidianOpen")

		-- convert note to template and remove leading white space
		vim.keymap.set("n", "<leader>on", ":ObsidianTemplate note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>")

		-- strip date from note title and replace dashes with spaces
		-- must have cursor on title
		-- vim.keymap.set("n", "<leader>of", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>")

		-- search for files in vault
		vim.keymap.set("n", "<leader>os", ':Telescope find_files search_dirs={"' .. vault_location .. '"}<cr>')
		vim.keymap.set("n", "<leader>oz", ':Telescope live_grep search_dirs={"' .. vault_location .. '"}<cr>')

		-- for review workflow
		-- move file and current buffer to zettelkasten folder
		vim.keymap.set("n", "<leader>ok", ":!mv '%:p' " .. vault_location .. "/SecondBrain/<cr>:bd<cr>")

		-- delete file and current buffer
		vim.keymap.set("n", "<leader>odd", ":!rm '%:p'<cr>:bd<cr>")
	end,
}
