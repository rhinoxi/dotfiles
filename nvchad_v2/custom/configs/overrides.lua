local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "c",
    "markdown",
    "markdown_inline",
    "go",
    "rust",
    "python",
  },
  indent = {
    enable = true,
    disable = {
      "python"
    },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",

    "clangd",
    "gopls",
    "pyright",
    "rust_analyzer",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
  filters = {
    git_ignored = false,
  },
}

M.telescope = {
  defaults = {
    cache_picker = {
      num_pickers = 5,
    },
    file_ignore_patterns = {"vendor"},
  },
  extensions_list = {"themes", "terms", "fzf"},
}

-- conflict with codeium Tab action
M.cmp = {
  mapping = {
    ["<Tab>"] = vim.NIL
  }
}

return M
