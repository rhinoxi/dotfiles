return {
  [ "phaazon/hop.nvim" ] = {
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      vim.api.nvim_set_keymap("n", "f", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "F", ":HopLine<cr>", { silent = true })
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
    after = "nvim-dap",
    config = function()
      require("dap-go").setup()
      require("dap.ext.vscode").load_launchjs()
    end,
  },
  [ "mfussenegger/nvim-dap-python" ] = {
    ft = "python",
    after = "nvim-dap",
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
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
  [ "romgrk/nvim-treesitter-context" ] = {},


  ["nvim-telescope/telescope.nvim"] = {
    config = function()
      require "plugins.configs.telescope"
      require "custom.plugins.telescope"
    end
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
}
