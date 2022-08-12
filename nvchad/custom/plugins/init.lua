return {
  ['folke/which-key.nvim'] = { disable = false  },
  ["nvim-treesitter/nvim-treesitter"] = {
    config = function()
      require "plugins.configs.treesitter"
      require "custom.plugins.treesitter"
    end,
  },
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
  [ "NvChad/nvterm" ] = {
    disable = true,
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

  [ "nvim-telescope/telescope-project.nvim" ] = {
    after = "telescope.nvim",
    config = function()
      require"telescope".load_extension("project")
    end
  },
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

  [ "ahmedkhalf/project.nvim" ] = {
    config = function()
      require("project_nvim").setup {
        patterns = { ".git" },
      }
    end,
  },

  [ "rcarriga/nvim-notify" ] = {},
}
