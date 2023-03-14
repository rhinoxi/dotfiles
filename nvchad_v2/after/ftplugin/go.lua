vim.cmd("setlocal tabstop=4 shiftwidth=4")

local wk = require 'which-key'
wk.register({
  m = {
    name = "custom",
    d = {
      name = "debug",
      n = { "<cmd>:lua require('dap-go').debug_test()<cr>", "go nearest test" },
    }
  },
}, { mode = "n", nowait = true, noremap = true, prefix = "<leader>" })

