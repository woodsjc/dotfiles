# layout

```
.
├── build
├── lua
│   └── config
│       ├── conform.lua
│       ├── mason.lua
│       ├── nvim-cmp.lua
│       ├── nvim-lspconfig.lua
│       └── treesitter.lua
├── plugins
│   └── bashmarks.plugin.sh
├── rc\_files
│   ├── bashrc
│   ├── nvim\_init.lua
│   ├── tmux.conf
│   ├── vimrc
│   └── zshrc
├── README.md
└── scripts
    └── duck
```

## Notes

These files are added with symbolic linking to wherever this directory is

### [Updating nvim](https://github.com/neovim/neovim/wiki/Building-Neovim)

To compile neovim from source
* `git pull`
* `make distclean`
* `make CMAKE_BUILD_TYPE=RelWithDebInfo`
* `make install`

### Adding LSP
* [Add language server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md) to lsp-config
* [Add with mason-lspconfig](https://github.com/williamboman/mason-lspconfig)

#### go

* [gopls](https://pkg.go.dev/golang.org/x/tools/gopls#section-readme)
  * `go install golang.org/x/tools/gopls@latest`
  * Check `$GOROOT` add `$GOROOT/bin` to path if missing
