local nvim_lsp = require('lspconfig')
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
local opts = { noremap=true, silent=true }

local function on_attach(name) 
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<space>rr", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)

    if (name == 'gopls') then
        vim.api.nvim_command("au BufWritePost *.go lua vim.lsp.buf.formatting()")
    end
end

local servers = { "bashls", "clangd", "gopls", "pyright", "rust_analyzer", 
    "tsserver", "yamlls" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup { on_attach = on_attach(lsp) }
end
