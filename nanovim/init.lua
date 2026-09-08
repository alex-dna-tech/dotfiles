-- OPTIONS
local options = {
  autocomplete = true,       -- autocompletion
  backup = false,            -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 2,             -- more space in the neovim command line for displaying messages
  conceallevel = 2,          -- so that `` is visible in markdown files
  cursorline = true,         -- highlight the current line
  expandtab = true,          -- convert tabs to spaces
  fileencoding = "utf-8",    -- the encoding written to a file
  guicursor = "",            -- always fat cursor
  hlsearch = true,           -- highlight all matches on previous search pattern
  ignorecase = true,         -- ignore case in search patterns
  mouse = "a",               -- allow the mouse to be used in neovim
  number = true,             -- set numbered lines
  numberwidth = 4,           -- set number column width to 2 {default 4}
  pumheight = 10,            -- pop up menu height
  relativenumber = true,     -- set relative numbered lines
  scrolloff = 8,             -- keep 8 lines above and below the cursor
  shiftwidth = 2,            -- the number of spaces inserted for each indentation
  showmode = false,          -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,           -- always show tabs
  sidescrolloff = 8,         -- leave space on scroll
  signcolumn = "yes",        -- always show the sign column, otherwise it would shift the text each time
  smartcase = true,          -- smart case
  smartindent = true,        -- make indenting smarter again
  splitbelow = true,         -- force all horizontal splits to go below current window
  splitright = true,         -- force all vertical splits to go to the right of current window
  swapfile = false,          -- creates a swapfile
  tabstop = 2,               -- insert 2 spaces for a tab
  termguicolors = true,      -- set term gui colors (most terminals support this)
  timeoutlen = 1000,         -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,           -- enable persistent undo
  updatetime = 50,           -- faster completion (4000ms default)
  wrap = true,               -- wrap long lines
  writebackup = false,       -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd("let g:netrw_liststyle = 3")
vim.opt.shell = "bash --login -c"

-- KEYMAPS
-- Shorten function name
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

--Remap space as leader key
local k = vim.keymap
vim.g.mapleader = " "
k.set("n", "<Space>", "<Nop>", term_opts)

-- Resize with arrows
k.set("n", "<A-Up>", ":resize +2<cr>", opts)
k.set("n", "<A-Down>", ":resize -2<cr>", opts)
k.set("n", "<A-Left>", ":vertical resize +2<cr>", opts)
k.set("n", "<A-Right>", ":vertical resize -2<cr>", opts)

-- Navigate buffers
k.set("n", "<S-l>", ":bnext<cr>", opts)
k.set("n", "<S-h>", ":bprevious<cr>", opts)
k.set("n", "<leader><leader>o", ":%bd|e#<cr>")

-- Move text up and down
k.set("n", "<A-j>", "<Esc>:m .+1<cr>==gi", opts)
k.set("n", "<A-k>", "<Esc>:m .-2<cr>==gi", opts)

-- Copy
k.set("n", "<leader>y", 'gg0"+yG', { noremap = true, silent = true, desc = "Yank All Buffer" })

-- Tmux
k.set("n", "<leader>t", "", { desc = "+Tmux" })
k.set(
  "v",
  "<leader>tc",
  'y<cr>:call system("tmux load-buffer -", @0)<cr>gv',
  { noremap = true, silent = true, desc = "Copy Visual" }
)
k.set(
  "n",
  "<leader>tc",
  ':call system("tmux load-buffer -", @0)',
  { noremap = true, silent = true, desc = "Copy Normal" }
)
k.set(
  "n",
  "<leader>tp",
  ':let @0 = system("tmux save-buffer -")<cr>"0p<cr>g;',
  { noremap = true, silent = true, desc = "Paste" }
)

-- Insert --
-- Press jj,kk fast to enter
k.set("i", "jj", "<ESC>", opts)
k.set("i", "kk", "<ESC>", opts)
k.set("i", "<C-c>", "<ESC>l", opts)

-- Visual --
-- Stay in indent mode
k.set("v", "<", "<gv", opts)
k.set("v", ">", ">gv", opts)

-- Move text up and down
k.set("v", "<A-j>", ":m .+1<cr>==", opts)
k.set("v", "<A-k>", ":m .-2<cr>==", opts)
k.set("v", "d", '"_d', opts)
k.set("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
k.set("x", "J", ":move '>+1<cr>gv-gv", opts)
k.set("x", "K", ":move '<-2<cr>gv-gv", opts)
k.set("x", "<A-j>", ":move '>+1<cr>gv-gv", opts)
k.set("x", "<A-k>", ":move '<-2<cr>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
k.set("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
k.set("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
k.set("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
k.set("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Refresh config
k.set("n", "<leader>so", ":so $MYVIMRC<cr>", { desc = "Refresh Neovim Config" })

k.set("n", "<leader>c", "<cmd>bdelete<CR>", { desc = "Close Buffer" })
k.set("n", "<leader>w", "<cmd>w!<CR>", { desc = "Write" })
k.set("n", "<leader>q", "<cmd>q!<CR>", { desc = "Quit" })
k.set("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "No Highlight" })

k.set("c", "w!!", "w !sudo tee % >/dev/null", term_opts)

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd("com! W w")
vim.cmd("com! Wq wq")


-- PLUGINS
vim.pack.add({
  { src = "https://github.com/ellisonleao/gruvbox.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/nvim-mini/mini.files" },
  { src = "https://github.com/nvim-mini/mini.pick" },
  { src = "https://github.com/tpope/vim-fugitive" },
})

k.set("n", "<leader>g", "", { desc = "+Git" })
k.set("n", "<leader>gs", "<cmd>Git<cr>", { desc = "Status" })
k.set("n", "<leader>gr", "<cmd>Gread<cr>", { desc = "Read" })
k.set("n", "<leader>gw", "<cmd>Gwrite<cr>", { desc = "Write" })
k.set("n", "<leader>ge", "<cmd>Gedit<cr>", { desc = "Edit" })
k.set("n", "<leader>gp", "<cmd>Git push<cr>", { desc = "Push" })
k.set("n", "<leader>gu", "<cmd>Git pull<cr>", { desc = "Pull" })

k.set("n", "<leader>gd", "", { desc = "+Diff" })
k.set("n", "<leader>gdd", "<cmd>Gvdiffsplit<cr>", { desc = "Verticaly 3 way" })
k.set("n", "<leader>gdh", "<cmd>diffget //2<cr>", { desc = "Merge diff left" })
k.set("n", "<leader>gdl", "<cmd>diffget //3<cr>", { desc = "Merge diff right" })

k.set("n", "<leader>gl", "", { desc = "+Log" })
k.set("n", "<leader>gll", "<cmd>Git log<cr>", { desc = "Log" })
k.set("n", "<leader>glo", "<cmd>Git log --oneline<cr>", { desc = "Log oneline" })

require("mini.pick").setup()
local MiniFiles = require("mini.files")
MiniFiles.setup()

k.set("n", "<leader>f", "", { desc = "+Files" })
k.set("n", "<leader>ff", ":Pick files<CR>", { desc = "Files" })
k.set("n", "-", MiniFiles.open, { desc = "Toggle mini file explorer" })
k.set("n", "<leader>o", function()
    MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
    MiniFiles.reveal_cwd()
end, { desc = "Toggle into currently opened file" })

k.set("n", "<leader>s", "", { desc = "+Search" })
k.set("n", "<leader>sh", ":Pick help<CR>", { desc = "Help" })

k.set("n", "<leader>l", "", { desc = "+LSP" })
k.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action" })
k.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format" })
k.set("n", "<leader>lq", vim.diagnostic.setloclist, { desc = "Quickfix" })


-- Alternative visual block mode: Alt+v
vim.keymap.set('n', '<A-v>', '<C-v>', { noremap = true })

-- LSP
vim.lsp.enable({ "lua_ls", "gopls" })

-- Theme
require("gruvbox").setup({ transparent = true })
vim.cmd.colorscheme("gruvbox")
vim.o.background = "dark"
vim.cmd(":hi statusline guibg=NONE")
