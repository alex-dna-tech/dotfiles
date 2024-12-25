return {
	"David-Kunz/gen.nvim",
	config = function()
		local gen = require("gen")

		-- Ollama config
		gen.setup({
			-- model = "codellama:13b-instruct-q5_K_M",
			model = "qwen2.5-coder:14b-instruct-q6_K",
			display_mode = "split",
			show_prompt = true,
			show_model = true,
			no_auto_close = true,
			debug = true,
		})

		-- G4f config
		-- gen.setup({
		-- 	model = "gpt-4o",
		-- 	host = "10.8.1.118",
		-- 	port = "1337",
		-- 	command = function(options)
		-- 		local body = {
		-- 			model = options.model,
		-- 			-- stream = false,
		-- 			messages = {
		-- 				{ role = "user", content = "${CONTENT}" },
		-- 			},
		-- 		}
		-- 		return "CONTENT=$prompt && curl -sN -H 'Content-Type: application/json' -d '"
		-- 			.. vim.fn.json_encode(body)
		-- 			.. "' http://"
		-- 			.. options.host
		-- 			.. ":"
		-- 			.. options.port
		-- 			.. "/v1/chat/completions"
		-- 	end,
		-- 	list_models = function(options)
		-- 		local response = vim.fn.systemlist(
		-- 			"curl -sN -H 'Content-Type: application/json' http://"
		-- 				.. options.host
		-- 				.. ":"
		-- 				.. options.port
		-- 				.. "/v1/models"
		-- 		)
		-- 		local list = vim.fn.json_decode(response)
		-- 		local models = {}
		-- 		for key, _ in list do
		-- 			table.insert(models, key.id)
		-- 		end
		-- 		table.sort(models)
		-- 		return models
		-- 	end,
		-- 	display_mode = "split",
		-- 	show_prompt = true,
		-- 	show_model = true,
		-- 	no_auto_close = true,
		-- 	debug = true,
		-- })

		gen.prompts.Create_Commit_Message_For_Code = {
			prompt = "I want you to act as a commit message generator. I will provide you with the final $filetype code output, and I want you to create a corresponding commit message using the normal commit format. Do not write any explanations or other words, just reply with a commit message.\n```$filetype\n$text\n```",
		}
		gen.prompts.Create_Commit_Message_For_Diff = {
			prompt = "I want you to act as a commit message generator. I will provide you with the `diff’ patches of the code, and I want you to create a corresponding commit message using the normal commit format. Don't write any explanation or anything else, just send the commit message.\n```diff\n$text\n````",
		}

		local k = vim.keymap
		k.set("n", "<leader>gn", "", { desc = "+Gen" })
		k.set({ "n", "v" }, "<leader>gnl", "<cmd>Gen<cr>", { desc = "Run LLM model" })
		k.set({ "n" }, "<leader>gnm", function()
			gen.select_model()
		end, { desc = "Select LLM model" })
		k.set({ "n", "v" }, "<leader>gnc", function()
			gen.exec(gen.prompts.Chat)
		end, { desc = "Run LLM Chat" })
		k.set({ "n", "v" }, "<leader>gns", function()
			gen.exec(gen.prompts.Summarize)
		end, { desc = "Run LLM Chat" })
		k.set({ "n", "v" }, "<leader>gng", function()
			gen.exec(gen.prompts.Create_Commit_Message_For_Code)
		end, { desc = "Run LLM CreateCommitMessageForCode" })
		k.set({ "n", "v" }, "<leader>gna", function()
			gen.exec(gen.prompts.Ask)
		end, { desc = "Run LLM Ask" })
		k.set({ "n", "v" }, "<leader>gnr", function()
			gen.exec(gen.prompts.Review_Code)
		end, { desc = "Run LLM Review_Code" })
		k.set({ "n", "v" }, "<leader>gne", function()
			gen.exec(gen.prompts.Enhance_Code)
		end, { desc = "Run LLM Enhance_Code" })
	end,
}
