-- slow on c injection
-- https://github.com/nvim-treesitter/nvim-treesitter/issues/3263
require("vim.treesitter.query").set_query("go", "injections", "(comment) @comment")

