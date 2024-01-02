require('mason').setup()

require('mason-lspconfig').setup{
    ensure_installed = {
        "flake8",
        "black",
        "pyright",
        "rust_analyzer",
        "gopls",
        "lua_ls",
        "yamlls",
    },
}

require('mason-tool-installer').setup{
    ensure_installed = {
        "flake8",
        "black",
    },
}
