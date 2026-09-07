return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-symbols.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next,     -- move to next result
          },
        },
      },
    })

    telescope.load_extension("fzf")

    -- set keymaps
    local k = vim.keymap
    local builtin = require("telescope.builtin")
    local theme = require("telescope.themes")

    k.set("n", "<leader>f", "", { desc = "+Files" })
    k.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
    k.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find Recent Files" })
    k.set("n", "<leader>fs",
      function()
        builtin.live_grep(theme.get_ivy)
      end, { desc = "Find String" })
    k.set("n", "<leader>fc", builtin.grep_string, { desc = "Find String Under Cursor" })
    -- k.set("n", "<leader>b", builtin.buffers(theme.get_dropdown { previewer = false }), { desc = "Buffers" })
    k.set("n", "<leader>c", "<cmd>bdelete<CR>", { desc = "Close Buffer" })
    k.set("n", "<leader>w", "<cmd>w!<CR>", { desc = "Write" })
    k.set("n", "<leader>q", "<cmd>q!<CR>", { desc = "Quit" })
    k.set("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "No Highlight" })
    k.set("n", "<leader>P", require("telescope").extensions.projects.projects, { desc = "Projects" })

    -- Search
    k.set("n", "<leader>s", "", { desc = "+Search" })
    k.set("n", "<leader>sh", builtin.help_tags, { desc = "Find Help" })
    k.set("n", "<leader>sM", builtin.man_pages, { desc = "Man Pages" })
    k.set("n", "<leader>sr", builtin.registers, { desc = "Registers" })
    k.set("n", "<leader>sk", builtin.keymaps, { desc = "Keymaps" })
    k.set("n", "<leader>sc", builtin.commands, { desc = "Commands" })
    k.set("n", "<leader>sC", builtin.colorscheme, { desc = "Colorscheme" })
    -- +Symbols
    k.set("n", "<leader>ss", "", { desc = "+Symbols" })
    k.set("n", "<leader>sse", builtin.symbols, { desc = "Emoji" })
    k.set("n", "<leader>ssg", function()
      builtin.symbols({ sources = { 'gitmoji' } })
    end, { desc = "Gitmoji" })
  end,
}
