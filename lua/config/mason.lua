require('mason').setup()

require('mason-lspconfig').setup{
    ensure_installed = {
        "pyright",
        "rust_analyzer",
        "gopls",
        "lua_ls",
        "yamlls",
        "bashls",
        "jsonnet_ls",
    },
    setup_handlers = {
        function(server)
            require('lsp-config')[server].setup()
        end,
        ["lua_ls"] = function()
            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        }
                    }
                }
            }
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
