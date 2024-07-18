-- Just an example, supposed to be placed in /lua/custom/
local M = {}

M.mappings = require "custom.mappings"

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

local highlights = require "custom.highlights"

M.ui = {
  theme = "everforest_light",
  hl_override = highlights.override,
  hl_add = highlights.add,

  statusline = {
    theme = "default",
  },
}

M.plugins = "custom.plugins"

return M
