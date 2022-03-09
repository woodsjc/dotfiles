local nvim_lsp = require('lspconfig')
local opts = { noremap=true, silent=true }

local function on_attach(client, buffnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(buffnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(buffnr, ...) end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
    buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<space>rr", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
end

local servers = { "bashls", "clangd", "gopls", "pyright", "tsserver", "yamlls" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup { on_attach = on_attach }
end

vim.api.nvim_command("au BufWritePost *.go lua vim.lsp.buf.formatting()")
vim.api.nvim_command("au BufWritePost *.py :!black --line-length 100 --fast % && flake8 %")

--lua specific
local sumneko_root_path = '/Users/jason/programs/lua-language-server'
local sumneko_binary = sumneko_root_path..'/bin/MacOS/lua-language-server'

require'lspconfig'.sumneko_lua.setup {
    on_attach = on_attach,
    cmd = {sumneko_binary, '-E', sumneko_root_path .. "/main.lua"};
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                globals = {'vim'},
            },
            workspace = {
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                }
            },
            telemetry = {
                enable = false,
            },
        },
    },
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {
            prefix = "☥☥☥"
        }
    }
)

--rust specific
require'lspconfig'.rust_analyzer.setup {
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
        }
    }
}

vim.fn.sign_define('LspDiagnosticsSignError', { text = "✘", texthl = "LspDiagnosticsDefaultError" })
vim.fn.sign_define('LspDiagnosticsSignWarning', { text = "", texthl = "LspDiagnosticsDefaultWarning" })
vim.fn.sign_define('LspDiagnosticsSignInformation', { text = "", texthl = "LspDiagnosticsDefaultInformation" })
vim.fn.sign_define('LspDiagnosticsSignHint', { text = "", texthl = "LspDiagnosticsDefaultHint" })
