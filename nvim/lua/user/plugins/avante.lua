return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false,
	build = "make",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-telescope/telescope.nvim",
		"hrsh7th/nvim-cmp",
		"ibhagwan/fzf-lua",
		"nvim-tree/nvim-web-devicons",
		"MeanderingProgrammer/render-markdown.nvim",
		"ravitemer/mcphub.nvim",
		{
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					use_absolute_path = true,
				},
			},
		},
	},
	config = function()
		require("avante").setup({
			debug = false,
			provider = "gemini",
			providers = {
				gemini = {
					api_key_name = "GEMINI_API_KEY",
					model = "gemini-2.0-flash",
				},
				["gpt4free-gpt-4o"] = {
					__inherited_from = "openai",
					endpoint = "http://localhost:1337/v1/",
					api_key_name = "OPENROUTER_API_KEY",
					model = "gpt-4",
					extra_request_body = {
						provider = "AnyProvider",
					},
				},
				ollama = {
					endpoint = "http://localhost:11434/v1/",
					-- model = "qwq:32b",
					model = "qwen2.5-coder:0.5b-instruct-q8_0",
				},
				groq = {
					__inherited_from = "openai",
					api_key_name = "GROQ_API_KEY",
					endpoint = "https://api.groq.com/openai/v1/",
					model = "llama-3.3-70b-versatile",
					disable_tools = true,
					extra_request_body = {
						temperature = 1,
						max_tokens = 32768, -- remember to increase this value, otherwise it will stop generating halfway
					},
				},
				["openrouter-deepseek-r1:1.5b"] = {
					__inherited_from = "openai",
					endpoint = "https://openrouter.ai/api/v1",
					api_key_name = "OPENROUTER_API_KEY",
					-- Tool supported models: https://openrouter.ai/models?max_price=0&fmt=cards&supported_parameters=tools
					model = "deepseek-r1:1.5b",
					extra_request_body = {
						temperature = 0,
					},
					disable_tools = false,
				},
			},
			web_search_engine = {
				provider = "serpapi", -- tavily, serpapi, searchapi, google, kagi, brave, or searxng
				proxy = nil,
			},
		})

		-- prefil edit window with common scenarios to avoid repeating query and submit immediately
		local prefill_edit_window = function(request)
			require("avante.api").edit()
			local code_bufnr = vim.api.nvim_get_current_buf()
			local code_winid = vim.api.nvim_get_current_win()
			if code_bufnr == nil or code_winid == nil then
				return
			end
			vim.api.nvim_buf_set_lines(code_bufnr, 0, -1, false, { request })
			-- Optionally set the cursor position to the end of the input
			vim.api.nvim_win_set_cursor(code_winid, { 1, #request + 1 })
			-- Simulate Ctrl+S keypress to submit
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-s>", true, true, true), "v", true)
		end

		-- NOTE: most templates are inspired from ChatGPT.nvim -> chatgpt-actions.json
		local avante_grammar_correction =
			"Correct the text to standard English, but keep any code blocks inside intact."
		local avante_keywords = "Extract the main keywords from the following text"
		local avante_code_readability_analysis = [[
	  You must identify any readability issues in the code snippet.
	  Some readability issues to consider:
	  - Unclear naming
	  - Unclear purpose
	  - Redundant or obvious comments
	  - Lack of comments
	  - Long or complex one liners
	  - Too much nesting
	  - Long variable names
	  - Inconsistent naming and code style.
	  - Code repetition
	  You may identify additional problems. The user submits a small section of code from a larger file.
	  Only list lines with readability issues, in the format <line_num>|<issue and proposed solution>
	  If there's no issues with code respond with only: <OK>
	]]
		local avante_optimize_code = "Optimize the following code"
		local avante_summarize = "Summarize the following text"
		local avante_translate = "Translate this into Chinese, but keep any code blocks inside intact"
		local avante_explain_code = "Explain the following code"
		local avante_complete_code = "Complete the following codes written in " .. vim.bo.filetype
		local avante_add_docstring = "Add docstring to the following codes"
		local avante_fix_bugs = "Fix the bugs inside the following codes if any"
		local avante_add_tests = "Implement tests for the following code"

		local map = vim.keymap.set

		-- Normal and Visual mode mappings (ask)
		map({ "n", "v" }, "<leader>ag", function()
			require("avante.api").ask({ question = avante_grammar_correction })
		end, { desc = "Avante: Grammar Correction(ask)", noremap = true, silent = true })

		map({ "n", "v" }, "<leader>ak", function()
			require("avante.api").ask({ question = avante_keywords })
		end, { desc = "Avante: Keywords(ask)", noremap = true, silent = true })

		map({ "n", "v" }, "<leader>al", function()
			require("avante.api").ask({ question = avante_code_readability_analysis })
		end, { desc = "Avante: Code Readability Analysis(ask)", noremap = true, silent = true })

		map({ "n", "v" }, "<leader>ao", function()
			require("avante.api").ask({ question = avante_optimize_code })
		end, { desc = "Avante: Optimize Code(ask)", noremap = true, silent = true })

		map({ "n", "v" }, "<leader>am", function()
			require("avante.api").ask({ question = avante_summarize })
		end, { desc = "Avante: Summarize text(ask)", noremap = true, silent = true })

		map({ "n", "v" }, "<leader>an", function()
			require("avante.api").ask({ question = avante_translate })
		end, { desc = "Avante: Translate text(ask)", noremap = true, silent = true })

		map({ "n", "v" }, "<leader>ax", function()
			require("avante.api").ask({ question = avante_explain_code })
		end, { desc = "Avante: Explain Code(ask)", noremap = true, silent = true })

		map({ "n", "v" }, "<leader>ac", function()
			require("avante.api").ask({ question = avante_complete_code })
		end, { desc = "Avante: Complete Code(ask)", noremap = true, silent = true })

		map({ "n", "v" }, "<leader>ad", function()
			require("avante.api").ask({ question = avante_add_docstring })
		end, { desc = "Avante: Docstring(ask)", noremap = true, silent = true })

		map({ "n", "v" }, "<leader>ab", function()
			require("avante.api").ask({ question = avante_fix_bugs })
		end, { desc = "Avante: Fix Bugs(ask)", noremap = true, silent = true })

		map({ "n", "v" }, "<leader>au", function()
			require("avante.api").ask({ question = avante_add_tests })
		end, { desc = "Avante: Add Tests(ask)", noremap = true, silent = true })

		-- Visual mode mappings (edit)
		map("v", "<leader>aG", function()
			prefill_edit_window(avante_grammar_correction)
		end, { desc = "Avante: Grammar Correction(edit)", noremap = true, silent = true })

		map("v", "<leader>aK", function()
			prefill_edit_window(avante_keywords)
		end, { desc = "Avante: Keywords(edit)", noremap = true, silent = true })

		map("v", "<leader>aO", function()
			prefill_edit_window(avante_optimize_code)
		end, { desc = "Avante: Optimize Code(edit)", noremap = true, silent = true })

		map("v", "<leader>aC", function()
			prefill_edit_window(avante_complete_code)
		end, { desc = "Avante: Complete Code(edit)", noremap = true, silent = true })

		map("v", "<leader>aD", function()
			prefill_edit_window(avante_add_docstring)
		end, { desc = "Avante: Docstring(edit)", noremap = true, silent = true })

		map("v", "<leader>aB", function()
			prefill_edit_window(avante_fix_bugs)
		end, { desc = "Avante: Fix Bugs(edit)", noremap = true, silent = true })

		map("v", "<leader>aU", function()
			prefill_edit_window(avante_add_tests)
		end, { desc = "Avante: Add Tests(edit)", noremap = true, silent = true })
	end,
}
