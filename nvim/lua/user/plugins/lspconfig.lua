return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			automatic_enable = {
				"lua_ls",
				"vimls",
				"tailwindcss",
				"ts_ls",
				"css-lsp",
			},
		})

		--
		-- These GLOBAL keymaps are created unconditionally when Nvim starts:
		-- - "grn" is mapped in Normal mode to |vim.lsp.buf.rename()|
		-- - "gra" is mapped in Normal and Visual mode to |vim.lsp.buf.code_action()|
		-- - "grr" is mapped in Normal mode to |vim.lsp.buf.references()|
		-- - "gri" is mapped in Normal mode to |vim.lsp.buf.implementation()|
		-- - "gO" is mapped in Normal mode to |vim.lsp.buf.document_symbol()|
		-- - CTRL-S is mapped in Insert mode to |vim.lsp.buf.signature_help()|

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local k = vim.keymap
				local o = { buffer = ev.buf }

				o.desc = "Show LSP references"
				k.set("n", "gR", "<cmd>Telescope lsp_references<CR>", o)

				o.desc = "Go to declaration"
				k.set("n", "gD", vim.lsp.buf.declaration, o)

				o.desc = "Show LSP definitions"
				k.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", o)

				o.desc = "Show LSP type definitions"
				k.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", o)

				o.desc = "Show LSP implementations"
				k.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", o)

				o.desc = "Smart rename"
				k.set("n", "<leader>rn", vim.lsp.buf.rename, o)

				o.desc = "Show buffer diagnostics"
				k.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", o)

				o.desc = "Show documentation for what is under cursor"
				k.set("n", "K", vim.lsp.buf.hover, o)
			end,
		})

		-- Config files: https://github.com/neovim/nvim-lspconfig/tree/master/lsp
		vim.lsp.config("emmet_ls", {
			filetypes = {
				"html",
				"htmlhugo",
				"templ",
				"typescriptreact",
				"javascriptreact",
				"css",
				"sass",
				"scss",
				"less",
			},
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})

		vim.lsp.config("cssls", {
			settings = {
				css = { validate = true, lint = {
					unknownAtRules = "ignore",
				} },
				scss = { validate = true, lint = {
					unknownAtRules = "ignore",
				} },
				less = { validate = true, lint = {
					unknownAtRules = "ignore",
				} },
			},
		})

		local k = vim.keymap
		k.set("n", "<leader>l", "", { desc = "+LSP" })
		k.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code Action" })
		k.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", { desc = "Format" })
		k.set("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "Info" })
		k.set("n", "<leader>lm", "<cmd>Mason<cr>", { desc = "Installer Info" })
		k.set("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", { desc = "Quickfix" })
		k.set("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Document Symbols" })
		k.set("n", "<leader>lr", "<cmd>LspRestart<cr>", { desc = "LSP Restart" })
		k.set("n", "<leader>ld", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "Workspace Symbols" })
	end,
}
