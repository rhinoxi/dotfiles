-- format on save
vim.cmd [[autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync()]]

-- custom commands
local commands = require "custom.commands"
commands.load(commands.defaults)

vim.opt.backup = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.swapfile = false
vim.opt.undofile = true -- enable persistent undo

