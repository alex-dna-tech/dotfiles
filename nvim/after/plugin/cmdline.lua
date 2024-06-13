require("telescope").load_extension('cmdline')

vim.api.nvim_set_keymap('n', ':', ':Telescope cmdline<CR>', { noremap = true, desc = "Cmdline" })
vim.api.nvim_set_keymap('n', '<leader><leader>', ':Telescope cmdline<CR>', { noremap = true, desc = "Cmdline" })
