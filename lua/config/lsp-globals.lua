vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(args)
    local bufnr = args.buf
    local opts = { buffer = bufnr, noremap = true, silent = true }

    -- Set omnifunc (the modern Lua way)
    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Modern Keymaps (using Lua functions instead of command strings)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>rr', vim.lsp.buf.rename, opts)
  end,
})

--lua
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})

local servers = { "bashls", "clangd", "gopls", "pyright", "ts_ls", "yamlls", "lua_ls", "jsonnet_ls", "emmet_ls", "tailwindcss", "rust_analyzer", "elixirls"}
for _, lsp in ipairs(servers) do
    vim.lsp.enable(lsp)
end

-- formatting
local fmt_grp = vim.api.nvim_create_augroup('LspFormatting', {})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = fmt_grp,
  pattern = { "*.go", "*.ex", "*.exs", "*.heex" },
  callback = function() vim.lsp.buf.format({ async = true }) end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = fmt_grp,
  pattern = "*.rs",
  command = "RustFmt",
})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = fmt_grp,
  pattern = "*.py",
  callback = function()
    local status, conform = pcall(require, "conform")
    if status then conform.format() end
  end,
})

vim.diagnostic.config({
  virtual_text = {
    prefix = "☥☥☥",
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "✘",
      [vim.diagnostic.severity.WARN]  = "",
      [vim.diagnostic.severity.INFO]  = "",
      [vim.diagnostic.severity.HINT]  = "",
    },
  },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
})

vim.diagnostic.config({virtual_text=true})
