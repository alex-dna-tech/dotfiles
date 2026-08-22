return {
	"ray-x/go.nvim",
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()',
	dependencies = {
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
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
			goimports = "gopls", -- if set to 'gopls' will use golsp format
			gofmt = "gopls", -- if set to gopls will use golsp format
			tag_transform = false,
			test_dir = "",
			comment_placeholder = "   ",
			lsp_cfg = true, -- false: use your own lspconfig
			lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
			lsp_on_attach = true, -- use on_attach from go.nvim
		})
		local gopls_cfg = require("go.lsp").config()
		-- gopls_cfg.filetypes = { 'go', 'gomod'}, -- override settings
		vim.lsp.config.gopls = gopls_cfg
		vim.lsp.enable("gopls")

		local k = vim.keymap
		k.set("n", "<leader><leader>a", "<cmd>GoAlt<cr>", { desc = "Go Alternative File" })
		k.set("n", "<leader><leader>e", "<cmd>GoIfErr<cr>", { desc = "Go If Err" })
		k.set("n", "<leader><leader>f", "<cmd>GoFillStruct<cr>", { desc = "Go Fill Struct" })
		k.set("n", "<leader><leader>l", "<cmd>GoLint<CR>", { desc = "Go Lint" })
		k.set("n", "<leader><leader>i", "<cmd>GoImplements<CR>", { desc = "Go Implements" })
		k.set("n", "<leader><leader>ti", "<cmd>GoToggleInlay<CR>", { desc = "Go Toggle Inlay" })
		k.set("n", "<leader><leader>d", "<cmd>GoDebug<CR>", { desc = "Go Debug" })
		k.set("n", "<leader><leader>b", "<cmd>GoBreakToggle<CR>", { desc = "Go Breack Toggle" })
		k.set("n", "<leader><leader>r", "<cmd>GoGenReturn<CR>", { desc = "Go Gen Return" })
		k.set("n", "<leader><leader>m", "<cmd>GoMockGen<CR>", { desc = "Go Mock Gen" })
		k.set("n", "<leader><leader>c", "<cmd>GoCmt<CR>", { desc = "Go Generate Comment" })
	end,
}
