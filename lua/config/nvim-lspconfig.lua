local nvim_lsp = require('lspconfig')
local opts = { noremap=true, silent=true }


local function on_attach(client, bufno)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufno, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufno, ...) end
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<space>rr", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)

    if client == 'rust_analyzer' then require'completion'.on_attach(client) end
end


local servers = { "bashls", "clangd", "gopls", "pyright", "ts_ls", "yamlls", "lua_ls", "jsonnet_ls", "emmet_ls", "tailwindcss"}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup { on_attach = on_attach }
end

vim.api.nvim_command("au BufWritePost *.go lua vim.lsp.buf.format(async)")
vim.api.nvim_command("au BufWritePost *.rs :RustFmt")
vim.api.nvim_command("au BufWritePost *.py lua require('conform').format()")
vim.api.nvim_command("au BufWritePost *.{ex,exs,heex} lua vim.lsp.buf.format(async)")

--rust specific
require('lspconfig').rust_analyzer.setup {
    on_attach = on_attach,
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    --root_dir = root_pattern("Cargo.toml", "rust-project.json"),
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
            inlayHints = { locationLinks = false },
        }
    }
}

require('lspconfig').lua_ls.setup {
    on_attach = on_attach,
    cmd = { "lua-language-server" },
    filetypse = { "lua" },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = {
                    "vim",
                    'require',
                },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        }
    }
}

require('lspconfig').elixirls.setup{
    on_attach = on_attach,
    cmd = { "elixir-ls" },
    filetypes = { "elixir" },
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {
            prefix = "☥☥☥"
        }
    }
)

vim.fn.sign_define('LspDiagnosticsSignError', { text = "✘", texthl = "LspDiagnosticsDefaultError" })
vim.fn.sign_define('LspDiagnosticsSignWarning', { text = "", texthl = "LspDiagnosticsDefaultWarning" })
vim.fn.sign_define('LspDiagnosticsSignInformation', { text = "", texthl = "LspDiagnosticsDefaultInformation" })
vim.fn.sign_define('LspDiagnosticsSignHint', { text = "", texthl = "LspDiagnosticsDefaultHint" })

vim.diagnostic.config({virtual_text=true})
