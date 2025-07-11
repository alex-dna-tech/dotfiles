return {
	"ravitemer/mcphub.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	cmd = "MCPHub",
	build = "npm install -g mcp-hub@latest",
	config = function()
		require("mcphub").setup({
			auto_approve = false,
			extensions = {
				avante = {
					make_slash_commands = true,
				},
				log = {
					level = vim.log.levels.WARN, -- Adjust verbosity (DEBUG, INFO, WARN, ERROR)
					to_file = true, -- Log to ~/.local/state/nvim/mcphub.log
				},
				on_ready = function()
					vim.notify("MCP Hub backend server is initialized and ready.", vim.log.levels.INFO)
				end,
			},
		})

		vim.keymap.set("n", "<leader>mh", ":MCPHub<CR>", { desc = "MCPHub", noremap = true, silent = true })
	end,
}
