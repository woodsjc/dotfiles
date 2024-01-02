require('mason').setup()

require('mason-lspconfig').setup{
    ensure_installed = {
        "pyright",
        "rust_analyzer",
        "gopls",
        "lua_ls",
        "yamlls",
    },
}

require('mason-tool-installer').setup{
    ensure_installed = {
        "black",
        "flake8",
        "isort",
    },
}
