return {
	"David-Kunz/gen.nvim",
	config = function()
		local gen = require("gen")
		gen.setup({
			model = "codellama:13b-instruct-q5_K_M",
			display_mode = "split",
			show_prompt = true,
			show_model = true,
			no_auto_close = true,
		})

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
