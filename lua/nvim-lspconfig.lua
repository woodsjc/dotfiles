local nvim_lsp = require('lspconfig')
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
local opts = { noremap=true, silent=true }

local function on_attach()
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<space>rr", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)

end

local servers = { "bashls", "clangd", "gopls", "pyright", "rust_analyzer",
    "sumneko_lua", "tsserver", "yamlls" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup { on_attach = on_attach }
end

vim.api.nvim_command("au BufWritePost *.go lua vim.lsp.buf.formatting()")

--lua specific
local sumneko_root_path = '/Users/jason/programs/lua-language-server'
local sumneko_binary = sumneko_root_path..'/bin/MacOS/lua-language-server'

require'lspconfig'.sumneko_lua.setup {
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

vim.fn.sign_define('LspDiagnosticsSignError', { text = "✘", texthl = "LspDiagnosticsDefaultError" })
vim.fn.sign_define('LspDiagnosticsSignWarning', { text = "", texthl = "LspDiagnosticsDefaultWarning" })
vim.fn.sign_define('LspDiagnosticsSignInformation', { text = "", texthl = "LspDiagnosticsDefaultInformation" })
vim.fn.sign_define('LspDiagnosticsSignHint', { text = "", texthl = "LspDiagnosticsDefaultHint" })

require "lspconfig".efm.setup {
    init_options = {documentFormatting = true},
    filetypes = {'python'},
    settings = {
        rootMarkers = {'.git/'},
        languages = {
            python = {
                {formatCommand = 'black -', formatStdin = true},
                {formatCommand = 'isort --stdout --profile black -', formatStdin = true}
            }
        }
    }
}
