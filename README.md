# dotfiles

Dotfiles added:
* rc\_files
  * .bashrc
  * .zshrc
  * .tmux.conf
  * .vimrc
  * nvim.init
* lua
  * nvim-compe.lua
  * nvim-lspconfig.lua
  * treesitter.lua
* scripts
  * duck

## Notes

These files are added with symbolic linking to wherever this directory is

### [Updating nvim](https://github.com/neovim/neovim/wiki/Building-Neovim)

To compile neovim from source
* `git pull`
* `make distclean`
* `make CMAKE_BUILD_TYPE=RelWithDebInfo`
* `make install`

### [Add language server](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md) to lsp-config

#### [Updating lua lsp](https://github.com/miltonllera/neovim-lua-config)

```sh
cd 3rd/luamake
./compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild
```
