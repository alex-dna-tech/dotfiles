local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

return require("packer").startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- Language syntax
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

  -- UI
  use "morhetz/gruvbox"
  use "norcalli/nvim-colorizer.lua"
  use "akinsho/bufferline.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "nvim-lualine/lualine.nvim"

  -- Navigation
  use "nvim-lua/plenary.nvim"
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-symbols.nvim"
  use "folke/which-key.nvim"
  use { "numtostr/BufOnly.nvim", cmd = { "BufOnly" } }
  use "ahmedkhalf/project.nvim"

  -- Edition
  use "tpope/vim-surround"
  use "AndrewRadev/splitjoin.vim"

  use "windwp/nvim-autopairs"
  use "numToStr/Comment.nvim"
  use "mbbill/undotree"
  use "lukas-reineke/indent-blankline.nvim"

  -- Git
  use {
    "tpope/vim-fugitive",
    requires = {
      { "tpope/vim-rhubarb" },
    },
  }

  -- LSP
  use "neovim/nvim-lspconfig"
  use "jose-elias-alvarez/null-ls.nvim"
  use "MunifTanjim/prettier.nvim"

  use {
    "VonHeikemen/lsp-zero.nvim",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },             -- Required
      { "williamboman/mason.nvim" },           -- Optional
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },                    -- Required
      { "hrsh7th/cmp-nvim-lsp" },                -- Required
      { "hrsh7th/cmp-buffer" },                  -- Optional
      { "hrsh7th/cmp-nvim-lua" },                -- Optional
      { "hrsh7th/cmp-path" },                    -- Optional
      { "hrsh7th/cmp-nvim-lsp-signature-help" }, -- Optional
      { "saadparwaiz1/cmp_luasnip" },            -- Optional

      -- Snippets
      {
        "L3MON4D3/LuaSnip",
        tag = "v1.*",
        run = "make install_jsregexp",
      },
      { "rafamadriz/friendly-snippets" }, -- Optional
      { "mattn/emmet-vim" },              -- Optional
    }
  }

  -- Code helpers
  use {
    "mg979/vim-visual-multi"
  }

  use {
    "ray-x/go.nvim",
    requires = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    }
  }

  use {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end
  }

  use {
    'laytan/tailwind-sorter.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
    run = 'cd formatter && npm i && npm run build',
  }

  use {
    "epwalsh/obsidian.nvim",
    requires = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },
  }

  use {
    "Exafunction/codeium.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({
      })
    end
  }

  use { "David-Kunz/gen.nvim",
    config = function()
      require('gen').setup({
        model = 'llama3:8b-instruct-q8_0',
        debug = true,
      })
    end
  }

  -- use {
  --   'Exafunction/codeium.vim',
  --   config = function()
  --     vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true })
  --     vim.keymap.set('i', '<C-n>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
  --     vim.keymap.set('i', '<C-p>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
  --     vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
  --   end
  -- }

  use { "jonarrien/telescope-cmdline.nvim",
    config = function()
      require("telescope").load_extension('cmdline')
      vim.api.nvim_set_keymap('n', '<leader><leader>',
        ':Telescope cmdline<CR>', { noremap = true, desc = "Cmdline" })
    end }
end)
