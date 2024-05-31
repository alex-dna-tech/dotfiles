local setup = {
  plugins = {
    marks = true,       -- shows a list of your marks on ' and `
    registers = true,   -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false,   -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true,      -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true,      -- default bindings on <c-w>
      nav = true,          -- misc bindings to work with windows
      z = true,            -- bindings for folds, spelling and others prefixed with z
      g = true,            -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>",   -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded",       -- none, single, double, shadow
    position = "bottom",      -- bottom, top
    margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 },                                             -- min and max height of the columns
    width = { min = 20, max = 50 },                                             -- min and max width of the columns
    spacing = 3,                                                                -- spacing between columns
    align = "left",                                                             -- align columns left, center or right
  },
  ignore_missing = true,                                                        -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true,                                                             -- show help message on the command line when the popup is visible
  triggers = "auto",                                                            -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n",     -- NORMAL mode
  prefix = "<leader>",
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true,  -- use `nowait` when creating keymaps
}

local mappings = {
  ["b"] = {
    "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "Buffers",
  },
  ["c"] = { "<cmd>bdelete<CR>", "Close Buffer" },
  ["x"] = { "<cmd>BufOnly<CR>", "Only Current Buffer" },
  ["e"] = { "<cmd>Ex<cr>", "Explorer" },
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["f"] = {
    "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "Find files",
  },
  ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
  ["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },
  g = {
    name = "Git",
    s = { "<cmd>Git<cr>", "Status" },
    b = { "<cmd>Telescope git_branches<cr>", "Branches" },
    c = { "<cmd>Telescope git_commits<cr>", "Commits" },
    r = { "<cmd>Gread<cr>", "Read" },
    w = { "<cmd>Gwrite<cr>", "Write" },
    e = { "<cmd>Gedit<cr>", "Edit" },
    g = { "<cmd>GBrowse<cr>", "Open in Browser" },
    d = { name = "+Diff" },
    ["dd"] = { "<cmd>Gvdiffsplit<cr>", "Verticaly 3 way" },
    ["dh"] = { "<cmd>diffget //2<cr>", "Merge diff left" },
    ["dl"] = { "<cmd>diffget //3<cr>", "Merge diff right" },
    p = { "<cmd>Git push<cr>", "Push" },
    u = { "<cmd>Git pull<cr>", "Pull" },
    l = { name = "+Log" },
    ["ll"] = { "<cmd>Git log<cr>", "Log" },
    ["lo"] = { "<cmd>Git log --oneline<cr>", "Log oneline" },
  },
  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>Mason<cr>", "Installer Info" },
    q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    r = { "<cmd>LspRestart<cr>", "Document Symbols" },
    d = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
  },
  s = {
    name = "Search",
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope registers<cr>", "Registers" },
    R = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    c = { "<cmd>Telescope commands<cr>", "Commands" },
    C = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    s = { name = "+Symbols" },
    ["se"] = { "<cmd>lua require'telescope.builtin'.symbols{ sources = {'emoji'} }<cr>", "Emoji" },
    ["sg"] = { "<cmd>lua require'telescope.builtin'.symbols{ sources = {'gitmoji'} }<cr>", "Gitmoji" },
  },
  o = {
    name = "OpenAI ChatGPT",
    c = { "<cmd>ChatGPT<cr>", "Chat (v3.5-turbo)" },
    a = { "<cmd>ChatGPTActAs<cr>", "Act As" },
    i = { "<cmd>ChatGPTEditWithInstructions<cr>", "Edit With Instructions (code-davinci)" },
    r = { name = "Run Action" },
    ["rg"] = { "<cmd>ChatGPTRun grammar_correction<cr>", "Grammar Correction" },
    ["rl"] = { "<cmd>ChatGPTRun translate<cr>", "Translate" },
    ["rk"] = { "<cmd>ChatGPTRun keywords<cr>", "Keywords" },
    ["rd"] = { "<cmd>ChatGPTRun docstring<cr>", "Documentation String" },
    ["rt"] = { "<cmd>ChatGPTRun add_tests<cr>", "Add Test" },
    ["ro"] = { "<cmd>ChatGPTRun optimize_code<cr>", "Optimize Code" },
    ["rs"] = { "<cmd>ChatGPTRun summarize<cr>", "Summarize" },
    ["rf"] = { "<cmd>ChatGPTRun fix_bugs<cr>", "Fix Bug" },
    ["rx"] = { "<cmd>ChatGPTRun explain_code<cr>", "Explain Code" },
    ["rr"] = { "<cmd>ChatGPTRun roxygen_edit<cr>", "Roxygen Edit" },
    ["rc"] = { "<cmd>ChatGPTRun code_readability_analysis<cr>", "Code Readability Analysis" },
  }
}

local wk = require("which-key")

wk.setup(setup)
wk.register(mappings, opts)
