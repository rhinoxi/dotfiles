local wk = require "which-key"

wk.register({
  m = {
    name = "custom",
    d = {
      name = "debug",
      c = { "<cmd>:lua require('dap-python').test_class()<cr>", "test class" },
      m = { "<cmd>:lua require('dap-python').test_method()<cr>", "test method" },
    }
  }
}, { mode = "n", nowait = true, noremap = true, prefix = "<leader>" } )
