local overrides = require("custom.configs.overrides")
local plugins = {
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "NvChad/nvterm",
    enabled = false,
  },

  -- custom plugin
  {
    "folke/which-key.nvim",
    enabled = true,
  },
  {
    "nvim-treesitter/playground",
    dependencies = "nvim-treesitter" ,
    cmd = {"TSPlaygroundToggle"},
  },
  {
    "phaazon/hop.nvim",
    lazy = false,
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  },

  -- dap
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("custom.configs.dap")
    end
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "nvim-dap",
    config = function()
      require("dap-go").setup()
      require("dap.ext.vscode").load_launchjs()
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = "nvim-dap",
    config = function()
      require("dap-python").setup()
      require("dap.ext.vscode").load_launchjs()
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap"},
    config = function()
      require "custom.configs.dap-ui"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },
  {
    "romgrk/nvim-treesitter-context",
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf"
  },

  {
    "karb94/neoscroll.nvim",
    lazy = false,
    config = function()
      require('neoscroll').setup()
    end,
  },

  {
    "rcarriga/nvim-notify"
  },

  {
    "ThePrimeagen/harpoon",
  },

  {
    "stevearc/aerial.nvim",
    config = function ()
      require("aerial").setup({
        filter_kind = false,
      })
    end
  },

  {
    "Pocco81/true-zen.nvim",
  },

  {
    "kylechui/nvim-surround",
    lazy = false,
    config = function ()
      require("nvim-surround").setup({})
    end
  },

  {
    "tpope/vim-dadbod",
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = "tpope/vim-dadbod",
    cmd = {"DBUI"},
  },
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {}
    end
  },

  -- [ "rest-nvim/rest.nvim" ] = {
  {
    "rhinoxi/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
      require "custom.configs.rest"
    end
  }

}

return plugins
