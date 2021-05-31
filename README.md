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
* `make distclean`
* `make`
* `make install`

### [Add language server](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md) to lsp-config
