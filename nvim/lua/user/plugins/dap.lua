return {
	{
		"rcarriga/nvim-dap-ui",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
			"leoluz/nvim-dap-go",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-telescope/telescope-dap.nvim",
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			local k = vim.keymap
			k.set("n", "<leader>dt", "<cmd>DapUiToggle<cr>", { noremap = true, desc = "DebugUI Toggle" })
			k.set(
				"n",
				"<leader>db",
				"<cmd>DapToggleBreakpoint<cr>",
				{ noremap = true, desc = "Debug Toggle Breakpoint" }
			)
			k.set("n", "<leader>dc", "<cmd>DapContinue<cr>", { noremap = true, desc = "Debug Continue" })
			k.set("n", "<leader>dr", function()
				require("dapui").open({ reset = true })
			end, { noremap = true, desc = "DebugUI Reset Windows" })
			k.set("n", "<leader>di", "<cmd>DapStepInto<cr>", { noremap = true, desc = "Debug Step Into" })
			k.set("n", "<leader>do", "<cmd>DapStepOut<cr>", { noremap = true, desc = "Debug Step Out" })
			k.set("n", "<leader>dn", "<cmd>DapStepOver<cr>", { noremap = true, desc = "Debug Step Over/Next Line" })
			k.set("n", "<leader>ds", "<cmd>DapStop<cr>", { noremap = true, desc = "Debug Continue" })
		end,
	},
}
