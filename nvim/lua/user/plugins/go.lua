return {
	"ray-x/go.nvim",
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()',
	dependencies = {
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-telescope/telescope-dap.nvim",
	},
	config = function()
		local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.go",
			callback = function()
				require("go.format").goimport()
			end,
			group = format_sync_grp,
		})

		require("go").setup({
			luasnip = true,
			lsp_inlay_hints = {
				enable = true,
			},
			lsp_cfg = true,
			only_current_line = true,
			lsp_keymaps = false,
		})

		local k = vim.keymap
		k.set("n", "<leader>goa", "<cmd>GoAlt<cr>", { desc = "Go Alternative File" })
		k.set("n", "<leader>goe", "<cmd>GoIfErr<cr>", { desc = "Go If Err" })
		k.set("n", "<leader>gofs", "<cmd>GoFillStruct<cr>", { desc = "Go Fill Struct" })
		k.set("n", "<leader>gol", "<cmd>GoLint<CR>", { desc = "Go Lint" })
		k.set("n", "<leader>goi", "<cmd>GoImplements<CR>", { desc = "Go Implements" })
		k.set("n", "<leader>goti", "<cmd>GoToggleInlay<CR>", { desc = "Go Toggle Inlay" })
		k.set("n", "<leader>god", "<cmd>GoDebug<CR>", { desc = "Go Debug" })
		k.set("n", "<leader>gob", "<cmd>GoBreakToggle<CR>", { desc = "Go Breack Toggle" })
		k.set("n", "<leader>gor", "<cmd>GoGenReturn<CR>", { desc = "Go Gen Return" })
		k.set("n", "<leader>gom", "<cmd>GoMockGen<CR>", { desc = "Go Mock Gen" })
		k.set("n", "<leader>goc", function()
			require("go.comment").gen()
		end, { desc = "Go Generate Comment" })
		k.set("n", "<leader>godt", function()
			require("dap-go").debug_test()
		end, { desc = "Go Debug Test" })
		k.set("n", "<leader>godlt", function()
			require("dap-go").debug_last_test()
		end, { desc = "Go Debug Last Test" })
	end,
}
