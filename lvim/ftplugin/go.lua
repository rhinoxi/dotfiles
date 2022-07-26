local opts = {
  cmd = { vim.fn.stdpath "data" .. "/lsp_servers/go/gopls"},
}
require("lvim.lsp.manager").setup("gopls", opts)
vim.cmd("setlocal tabstop=4 shiftwidth=4")

require("dap-go").setup()
require("dap.ext.vscode").load_launchjs()

lvim.builtin.which_key.mappings["mdg"] = {"<cmd>:lua require('dap-go').debug_test()<cr>", "go nearest test"}

