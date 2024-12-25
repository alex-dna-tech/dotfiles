return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

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

				o.desc = "Show line diagnostics"
				k.set("n", "<leader>d", vim.diagnostic.open_float, o)

				o.desc = "Show documentation for what is under cursor"
				k.set("n", "K", vim.lsp.buf.hover, o)
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			-- TODO: check health vim.deprecated fix required
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,
			["emmet_ls"] = function()
				lspconfig["emmet_ls"].setup({
					capabilities = capabilities,
					filetypes = {
						"html",
						"templ",
						"typescriptreact",
						"javascriptreact",
						"css",
						"sass",
						"scss",
						"less",
					},
				})
			end,
			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
			["cssls"] = function()
				lspconfig["cssls"].setup({
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
			end,
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
