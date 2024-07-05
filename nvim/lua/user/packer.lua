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
  use { "wbthomason/packer.nvim" }

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

  use { "jonarrien/telescope-cmdline.nvim",
    config = function()
      require("telescope").load_extension('cmdline')
      vim.api.nvim_set_keymap('n', '<leader><leader>',
        ':Telescope cmdline<CR>', { noremap = true, desc = "Cmdline" })
    end
  }

  -- Git
  use {
    "tpope/vim-fugitive",
    requires = {
      { "tpope/vim-rhubarb" },
    },
  }

  -- LSP
  use { "neovim/nvim-lspconfig" }
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }

  -- Autocompletion
  use { "hrsh7th/nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "hrsh7th/cmp-buffer" }
  use { "hrsh7th/cmp-nvim-lua" }
  use { "hrsh7th/cmp-path" }
  use { "hrsh7th/cmp-nvim-lsp-signature-help" }
  use { "saadparwaiz1/cmp_luasnip" }

  -- Snippets
  use {
    "L3MON4D3/LuaSnip",
    tag = "v1.*",
    run = "make install_jsregexp",
  }

  use { "rafamadriz/friendly-snippets" }
  use { "mattn/emmet-vim" }

  -- Code Edition
  use { "mbbill/undotree" }
  use { "lukas-reineke/indent-blankline.nvim" }
  use { "windwp/nvim-autopairs" }
  use { "tpope/vim-surround" }
  use { "AndrewRadev/splitjoin.vim" }

  use {
    "numToStr/Comment.nvim",
    config = function()
      require('Comment').setup()
    end
  }
  use { "mg979/vim-visual-multi" }

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

  use { "MunifTanjim/prettier.nvim",
    config = function()
      require("prettier").setup({
        bin = 'prettier',
        filetypes = {
          "css",
          "graphql",
          "html",
          "javascript",
          "javascriptreact",
          "json",
          "less",
          "markdown",
          "scss",
          "typescript",
          "typescriptreact",
          "yaml",
          "xhtml",
        },
      })
    end }

  use {
    "roobert/tailwindcss-colorizer-cmp.nvim",
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

  -- Staff
  use { "David-Kunz/gen.nvim",
    config = function()
      require('gen').setup({
        model = 'codellama:13b-instruct-q5_K_M',
        display_mode = "split",
        show_prompt = false,
        show_model = false,
        no_auto_close = true,
      })
    end
  }

  use {
    "epwalsh/obsidian.nvim",
    requires = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },
  }
end)
