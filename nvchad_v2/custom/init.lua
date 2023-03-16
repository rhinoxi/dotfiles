-- format on save
vim.cmd [[autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync()]]
vim.cmd [[autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync()]]
vim.cmd [[autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync()]]

-- custom commands
local commands = require "custom.commands"
commands.load(commands.defaults)

vim.opt.backup = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.swapfile = false
vim.opt.undofile = true -- enable persistent undo

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevelstart = 99

vim.opt.fileencodings="utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1"
vim.cmd [[set jumpoptions+=stack]]
