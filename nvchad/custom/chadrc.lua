-- Just an example, supposed to be placed in /lua/custom/
local M = {}

M.mappings = require "custom.mappings"

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "everforest",
  theme_toggle = { "everforest", "gruvbox_light" }
}

M.plugins = {
  ["williamboman/mason.nvim"] = {
    override_options = {
      ensure_installed = {
        -- lua
        "lua-language-server",

        -- go
        "gopls",

        -- python
        "pyright",

        -- web dev
        "typescript-language-server",
      },
    },
  },
  ["nvim-treesitter/nvim-treesitter"] = {
    config = function()
      require "plugins.configs.treesitter"
      require "custom.plugins.treesitter"
    end,
    override_options = {
      auto_install = true,
    },
  },
  [ "NvChad/nvterm" ] = {
    disable = true,
  },

  -- custom plugin
  ['folke/which-key.nvim'] = { disable = false  },
  ["nvim-treesitter/playground"] = {
    requires = "nvim-treesitter" ,
    opt = true,
    cmd = {"TSPlaygroundToggle"},
  },
  [ "phaazon/hop.nvim" ] = {
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },

  -- dap
  [ "mfussenegger/nvim-dap" ] = {
    config = function()
      require("custom.plugins.dap")
    end
  },
  [ "leoluz/nvim-dap-go" ] = {
    ft = "go",
    requires = "nvim-dap",
    config = function()
      require("dap-go").setup()
      require("dap.ext.vscode").load_launchjs()
    end,
  },
  [ "mfussenegger/nvim-dap-python" ] = {
    ft = "python",
    requires = "nvim-dap",
    config = function()
      require("dap-python").setup()
      require("dap.ext.vscode").load_launchjs()
    end,
  },
  [ "rcarriga/nvim-dap-ui" ] = {
    requires = {"mfussenegger/nvim-dap"},
    config = function()
      require "custom.plugins.dap-ui"
    end,
  },

  [ "neovim/nvim-lspconfig" ] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  [ "jose-elias-alvarez/null-ls.nvim" ] = {
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
  [ "romgrk/nvim-treesitter-context" ] = {},

  [ "nvim-telescope/telescope.nvim" ] = {
    module = "telescope",
    config = function()
      require "plugins.configs.telescope"
      require "custom.plugins.telescope"
    end
  },
  [ "nvim-telescope/telescope-fzf-native.nvim" ] = {
    requires = { "nvim-telescope/telescope.nvim" },
    run = "make",
  },
  [ "kevinhwang91/nvim-bqf" ] = {
    ft = "qf"
  },
  [ "folke/trouble.nvim" ] = {
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end
  },

  [ "karb94/neoscroll.nvim" ] = {
    config = function()
      require('neoscroll').setup()
    end,
  },

  [ "rcarriga/nvim-notify" ] = {},

  [ "ThePrimeagen/harpoon"] = {},

  [ "stevearc/aerial.nvim" ] = {
    config = function ()
      require("aerial").setup({
        filter_kind = false,
      })
    end
  },

  [ "Pocco81/true-zen.nvim" ] = {},

  [ "kylechui/nvim-surround" ] = {
    tag = "*",
    config = function ()
      require("nvim-surround").setup({})
    end
  },
}

return M
