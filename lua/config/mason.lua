require('mason').setup()

require('mason-lspconfig').setup{
    ensure_installed = {
        "bashls",
        "elixirls",
        "emmet_ls",
        "gopls",
        "jsonnet_ls",
        "lua_ls",
        "pyright",
        "rust_analyzer",
        "tailwindcss",
        "yamlls",
    },
    setup_handlers = {
        function(server)
            require('lsp-config')[server].setup()
        end,
    },
}

require('mason-tool-installer').setup{
    ensure_installed = {
        "black",
        "flake8",
        "isort",
    },
}
