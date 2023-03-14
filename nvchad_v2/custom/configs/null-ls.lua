local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- webdev stuff
  b.formatting.prettier,

  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- python
  -- b.diagnostics.flake8,
  b.diagnostics.flake8.with({
    extra_args = {"--extend-ignore", "E501,E203"},
  }),
  b.formatting.black,

  -- go
  b.formatting.goimports,

  -- rust
  b.formatting.rustfmt,
}

null_ls.setup {
  debug = false,
  sources = sources,
}
