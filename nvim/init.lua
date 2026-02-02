require("user.options")
require("user.keymaps")
require("user.lazy")

---@diagnostic disable-next-line: duplicate-set-field
-- vim.deprecate = function() end

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
	pattern = "*",
	command = "silent! wall",
})
