vim.pack.add({
    { src = "https://github.com/ellisonleao/gruvbox.nvim" },
    { src = "https://github.com/nvim-mini/mini.nvim" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/tpope/vim-fugitive" },
    { src = "https://github.com/tpope/vim-rhubarb" },
})

vim.cmd.colorscheme("gruvbox")

-- mini files ----
local MiniFiles = require("mini.files")
MiniFiles.setup()

vim.keymap.set("n", "-", MiniFiles.open, { desc = "Toggle mini file explorer" })
vim.keymap.set("n", "<leader>o", function()
    MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
    MiniFiles.reveal_cwd()
end, { desc = "Toggle into currently opened file" })

---- mini notify ----
require("mini.notify").setup({
    -- only show messages
    content = {
        format = function(notif)
            return notif.msg
        end,
    },
})

local MiniSnippets = require("mini.snippets")
MiniSnippets.setup({
    snippets = {
        MiniSnippets.gen_loader.from_lang(), -- loads friendly-snippets
    },

    mappings = {
        expand = '<C-j>',
        jump_next = '<TAB>',
        jump_prev = '<S-TAB>',
        stop = '<C-c>',
    },

    expand = {
        prepare = nil,
        match = nil,
        select = nil,
        insert = nil,
    },
})

MiniSnippets.start_lsp_server({ match = false })

require('mini.pairs').setup()
require('mini.splitjoin').setup()
require("mini.surround").setup({
mappings = {
    add = 'as', -- Add surrounding in Normal and Visual modes
    delete = 'ds', -- Delete surrounding
    find = 'fs', -- Find surrounding (to the right)
    find_left = 'Fs', -- Find surrounding (to the left)
    highlight = 'hs', -- Highlight surrounding
    replace = 'cs', -- Replace surrounding

    suffix_last = 'l', -- Suffix to search with "prev" method
    suffix_next = 'n', -- Suffix to search with "next" method
  },
})

--- mini cmdline completion ---
require("mini.cmdline").setup({
    autocorrect = { enable = false }
})
require("mini.icons").setup()
require('mini.statusline').setup()
require('mini.tabline').setup({
  -- Whether to show file icons (requires 'mini.icons')
  show_icons = true,

  -- Function which formats the tab label
  -- By default surrounds with space and possibly prepends with icon
  format = nil,

  -- Where to show tabpage section in case of multiple vim tabpages.
  -- One of 'left', 'right', 'none'.
  tabpage_section = 'right',
})

--- mini picker ---
local MiniPick = require("mini.pick")
local MiniExtra = require("mini.extra")
MiniPick.setup()
MiniExtra.setup()

-- keymaps
vim.keymap.set("n", "<leader>f", "", { desc = "+Files" })
vim.keymap.set("n", "<leader>ff", function() MiniPick.builtin.files() end, { desc = "Mini File Picker" })
vim.keymap.set("n", "<leader>fs", function() MiniPick.builtin.grep_live({ local_opts = { tool = 'rg' } }) end, { desc = "Search in files" })
vim.keymap.set("n", "<leader>fw", function() MiniPick.builtin.grep({ pattern = vim.fn.expand("<cword>") }) end, { desc = "Search word" })

vim.keymap.set("n", "<leader>s", "", { desc = "+Search" })
vim.keymap.set("n", "<leader>sh", function() MiniPick.builtin.help() end, { desc = "Mini Help" })
vim.keymap.set("n", "<leader>sk", function() MiniExtra.pickers.keymaps() end, { desc = 'Search keymaps' })

vim.keymap.set("n", "<leader>xx", function() MiniExtra.pickers.diagnostic() end, { desc = "Mini Picker Diagnostics" })


--- mini completions ---
require("mini.completion").setup({
    lsp_completion = {
        auto_setup = true,
    }
})


--- mini diff and fugitive ---
local MiniDiff = require("mini.diff")
MiniDiff.setup({
    source = MiniDiff.gen_source.git({ index = false }),
})

vim.keymap.set("n", "<leader>g", "", { desc = "+Git" })
vim.keymap.set("n", "<leader>gs", "<cmd>Git | only<cr>", { desc = "Status" })
vim.keymap.set("n", "<leader>gb", "<cmd>Git branch<cr>", { desc = "Branches" })
vim.keymap.set("n", "<leader>gr", "<cmd>Gread<cr>", { desc = "Read" })
vim.keymap.set("n", "<leader>gw", "<cmd>Gwrite<cr>", { desc = "Write" })
vim.keymap.set("n", "<leader>ge", "<cmd>Gedit<cr>", { desc = "Edit" })
vim.keymap.set("n", "<leader>gg", "<cmd>GBrowse<cr>", { desc = "Open in Browser" })
vim.keymap.set("n", "<leader>gp", "<cmd>Git push<cr>", { desc = "Push" })
vim.keymap.set("n", "<leader>gu", "<cmd>Git pull<cr>", { desc = "Pull" })

vim.keymap.set("n", "<leader>gd", "", { desc = "+Diff" })
vim.keymap.set("n", "<leader>gdd", "<cmd>Gvdiffsplit<cr>", { desc = "Verticaly 3 way" })
vim.keymap.set("n", "<leader>gdh", "<cmd>diffget //2<cr>", { desc = "Merge diff left" })
vim.keymap.set("n", "<leader>gdl", "<cmd>diffget //3<cr>", { desc = "Merge diff right" })

vim.keymap.set("n", "<leader>gl", "<cmd>Git log<cr>", { desc = "Log" })
vim.keymap.set("n", "<leader>gll", "<cmd>Git log<cr>", { desc = "Log" })
vim.keymap.set("n", "<leader>glo", "<cmd>Git log --oneline<cr>", { desc = "Log oneline" })
