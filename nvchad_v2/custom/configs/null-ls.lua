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

  -- python
  -- b.diagnostics.flake8,
  -- b.diagnostics.ruff,
  -- b.diagnostics.flake8.with({
  --   extra_args = {"--extend-ignore", "E501,E203"},
  -- }),
  b.formatting.black,

  -- go
  b.formatting.goimports,

  -- rust
  -- b.formatting.rustfmt,

  -- elixir
  b.diagnostics.credo,
  b.formatting.mix,
}

null_ls.setup {
  debug = false,
  sources = sources,
}
