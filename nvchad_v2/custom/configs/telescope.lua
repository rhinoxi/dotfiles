local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
    cache_picker = {
      num_pickers = 5,
    },
    file_ignore_patterns = {"vendor"},
  },
}

telescope.load_extension('fzf', 'themes')
