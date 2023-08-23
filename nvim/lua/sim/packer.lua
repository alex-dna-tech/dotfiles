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
    }
  }

  -- Code helpers
  use({
    "ray-x/go.nvim",
    requires = {
      "ray-x/guihua.lua",
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    }
  })

  -- use({
  --   "jackMort/ChatGPT.nvim",
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim"
  --   },
  --   config = function()
  --     require("chatgpt").setup()
  --   end
  -- })

  use {
    'Exafunction/codeium.vim',
    config = function()
      vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<C-n>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
      vim.keymap.set('i', '<C-p>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
      vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    end
  }
end)
