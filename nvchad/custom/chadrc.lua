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
  override = {
    ["williamboman/mason.nvim"] = {
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
    ["nvim-treesitter/nvim-treesitter"] = {
      auto_install = true,
    },
  },
  user = require "custom.plugins",
}

return M
