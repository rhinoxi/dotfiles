local config = {
  breakpoint = {
    text = "",
    texthl = "LspDiagnosticsSignError",
    linehl = "",
    numhl = "",
  },
  -- breakpoint_rejected = {
  --   text = "",
  --   texthl = "LspDiagnosticsSignHint",
  --   linehl = "",
  --   numhl = "",
  -- },
  stopped = {
    text = "",
    texthl = "LspDiagnosticsSignInformation",
    linehl = "DiagnosticUnderlineInfo",
    numhl = "LspDiagnosticsSignInformation",
  },
}

local dap = require "dap"

vim.fn.sign_define("DapBreakpoint", config.breakpoint)
-- vim.fn.sign_define("DapBreakpointRejected", config.breakpoint_rejected)
vim.fn.sign_define("DapStopped", config.stopped)

dap.defaults.fallback.terminal_win_cmd = "50vsplit new"
