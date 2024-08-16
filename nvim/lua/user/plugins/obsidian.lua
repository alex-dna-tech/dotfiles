return {
	"epwalsh/obsidian.nvim",
	event = { "BufReadPre", "BufNewFile" },
	version = "*",
	lazy = false,
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

			daily_notes = {
				folder = "Calendar/Daily",
			},

			disable_frontmatter = true,
		})

		-- Obsidian integration
		--- https://github.com/TheseusGrey/edit-in-neovim
		-- If you want to use "~", you need to prefix the vault path with vim.fn.expand "~"
		local vault_location = vim.fn.expand("~") .. "Library/Mobile Documents/iCloud~md~obsidian/Documents/Trans"
		local vault_pattern = vault_location .. "/**.md"
		local group = vim.api.nvim_create_augroup("obsidian_cmds", { clear = true })
		vim.api.nvim_create_autocmd("BufAdd", {
			command = "ObsidianOpen",
			pattern = { vault_pattern },
			group = group,
			desc = "Opens the current buffer in Obsidian",
		})
	end,
}
