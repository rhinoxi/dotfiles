require("dap-python").setup()

lvim.builtin.which_key.mappings["mdc"] = {"<cmd>:lua require('dap-python').test_class()<cr>", "test class"}
lvim.builtin.which_key.mappings["mdm"] = {"<cmd>:lua require('dap-python').test_method()<cr>", "test method"}
