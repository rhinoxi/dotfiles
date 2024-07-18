local M = {}

M.general = {
  n = {
    ["<F1>"] = { "<cmd> echo <CR>", "" },
    ["<S-h>"] = { "<cmd> bprevious <CR>", "" },
    ["<S-l>"] = { "<cmd> bnext <CR>", "" },
    ["<C-q>"] = { "<cmd> :call QuickFixToggle()<CR>", "" },
  },
  i = {
    ["<F1>"] = { "<cmd> echo <CR>", "" },
    ["<C-q>"] = { "<cmd> :call QuickFixToggle()<CR>", "" },
  }
}

M.telescope = {
  n = {
    -- search
    ["<leader>f"] = { "<cmd> Telescope find_files <CR>", "  find files", opts = { nowait = true, noremap = true } },
    ["<leader>sa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "  find all" },

    ["<leader>sg"] = { "<cmd> Telescope grep_string<CR>", "grep string under cursor" },
    ["<leader>st"] = { "<cmd> Telescope live_grep <CR>", "   live grep" },
    ["<leader>sb"] = { "<cmd> Telescope buffers <CR>", "  find buffers" },
    ["<leader>sh"] = { "<cmd> Telescope help_tags <CR>", "  help page" },
    ["<leader>so"] = { "<cmd> Telescope oldfiles <CR>", "   find oldfiles" },
    ["<leader>sk"] = { "<cmd> Telescope keymaps <CR>", "   show keys" },
    ["<leader>ss"] = { "<cmd> Telescope resume <CR>", "resume" },
    ["<leader>sp"] = { "<cmd> Telescope pickers <CR>", "pickers" },
  }
}

M.dap = {
  n = {
    ["<leader>dt"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "toggle breakpoint" },
    ["<leader>db"] = { "<cmd>lua require'dap'.step_back()<cr>", "step back" },
    ["<leader>dc"] = { "<cmd>lua require'dap'.continue()<cr>", "continue" },
    ["<leader>dC"] = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "run to cursor" },
    ["<leader>dd"] = { "<cmd>lua require'dap'.disconnect()<cr>", "disconnect" },
    ["<leader>dg"] = { "<cmd>lua require'dap'.session()<cr>", "get session" },
    ["<leader>di"] = { "<cmd>lua require'dap'.step_into()<cr>", "step into" },
    ["<leader>do"] = { "<cmd>lua require'dap'.step_over()<cr>", "step over" },
    ["<leader>du"] = { "<cmd>lua require'dap'.step_out()<cr>", "step out" },
    ["<leader>dp"] = { "<cmd>lua require'dap'.pause.toggle()<cr>", "pause" },
    ["<leader>dr"] = { "<cmd>lua require'dap'.repl.toggle()<cr>", "toggle repl" },
    ["<leader>ds"] = { "<cmd>lua require'dap'.continue()<cr>", "start" },
    ["<leader>dq"] = { "<cmd>lua require'dap'.close()<cr>", "quit" },
  }
}

M.gitsigns = {
  n = {
    ["<leader>gj"] = { "<cmd>lua require'gitsigns'.next_hunk()<cr>", "next hunk" },
    ["<leader>gk"] = { "<cmd>lua require'gitsigns'.prev_hunk()<cr>", "prev hunk" },
    ["<leader>gd"] = { "<cmd>lua require'gitsigns'.diffthis(HEAD)<cr>", "git diff" },
    ["<leader>gl"] = { "<cmd>lua require'gitsigns'.blame_line()<cr>", "git blame" },
  }
}

M.hop = {
  n = {
    ["f"] = { "<cmd>HopChar2<cr>", "" },
  }
}

M.trouble = {
  n = {
    ["<leader>tt"] = { "<cmd>Trouble diagnostics toggle<cr>", "trouble" },
    ["<leader>tq"] = { "<cmd>Trouble qflist toggle<cr>", "quickfix" },

    ["gR"] = { "<cmd>TroubleToggle lsp_references<cr>", "references (trouble)" },
    ["gD"] = { "<cmd>TroubleToggle lsp_definitions<cr>", "definitions (trouble)" },
  }
}

M.lsp = {
  n = {
    ["<leader>lm"] = {
      function()
        vim.lsp.buf.formatting()
      end,
      "   lsp formatting",
    },
    ["<leader>lr"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "   lsp rename",
    },
    ["<leader>la"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "   lsp code_action",
    },

    ["<leader>lj"] = { "<cmd> lua vim.diagnostic.goto_next() <CR>", "next diagnostic" },
    ["<leader>lk"] = { "<cmd> lua vim.diagnostic.goto_prev() <CR>", "next diagnostic" },
  }
}

M.harpoon = {
  n = {
    ["<leader>ha"] = {
      function ()
        require("harpoon.mark").add_file()
      end,
      "harpoon: add file",
    },
    ["<leader>hf"] = {
      function ()
        require("harpoon.ui").toggle_quick_menu()
      end,
    },
    ["<leader>hn"] = {
      function ()
        require("harpoon.ui").nav_next()
      end,
      "harpoon: nav next",
    },
    ["<leader>hp"] = {
      function ()
        require("harpoon.ui").nav_prev()
      end,
      "harpoon: nav prev",
    },
    ["<leader>h1"] = {
      function ()
        require("harpoon.ui").nav_file(1)
      end,
      "harpoon: nav file(1)",
    },
    ["<leader>h2"] = {
      function ()
        require("harpoon.ui").nav_file(2)
      end,
      "harpoon: nav file(2)",
    },
    ["<leader>h3"] = {
      function ()
        require("harpoon.ui").nav_file(3)
      end,
      "harpoon: nav file(3)",
    },
  }
}

M.outline = {
  n = {
    ["<leader>a"] = { "<cmd>AerialToggle!<CR>", "toggle code outline" }
  }
}

M.zen = {
  n = {
    ["<leader>zf"] = { "<cmd>TZFocus<CR>", "toggle zen: focus"},
    ["<leader>zm"] = { "<cmd>TZMinimalist<CR>", "toggle zen: minimalist"},
    ["<leader>za"] = { "<cmd>TZAtaraxis<CR>", "toggle zen: ataraxis"},
  }
}

M.disabled = {
  n = {
    ["<leader>fm"] = "",
    ["<leader>fa"] = "",
    ["<leader>fb"] = "",
    ["<leader>ff"] = "",
    ["<leader>fh"] = "",
    ["<leader>fo"] = "",
    ["<leader>fw"] = "",

    ["<leader>ra"] = "",
    ["<leader>ca"] = "",

    ["<leader>h"] = "",
    ["<leader>v"] = "",

    ["<leader>cm"] = "",
    ["<leader>pt"] = "",
    ["<leader>fz"] = "",
    ["<ESC>"] = "",
    ["<TAB>"] = "",
    ["<Tab>"] = "",
    ["<tab>"] = "",
    ["<S-Tab>"] = "",
    ["<S-TAB>"] = "",
    ["<S-tab>"] = "",
  }
}

M.rest = {
  n = {
    ["<leader>rr"] = { "<Plug>RestNvim", "call api" },
    ["<leader>rp"] = { "<Plug>RestNvimPreview", "copy curl" },
  }
}

return M
