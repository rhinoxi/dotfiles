-- format on save
vim.cmd [[autocmd BufWritePre *.go lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.py lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.rs lua vim.lsp.buf.format()]]
vim.cmd [[autocmd BufWritePre *.ex lua vim.lsp.buf.format()]]
-- absolute/relative number toggle
vim.cmd [[
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
  augroup END
]]

-- custom commands
local commands = require "custom.commands"
commands.load(commands.defaults)

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/lua_snippets"

