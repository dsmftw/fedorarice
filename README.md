# dsmftw dotfiles [Fedora]

* dotfiles for Fedora
* bootstrap script
* tmux statusbar scripts

## Setup details

* OS `Fedora 31`
* Windowing System `X11`
* DE `GNOME`
* WM `GNOME Shell`
* Shell `bash`
* Terminal emulator `gnome-terminal`
* Terminal multiplexer `tmux`
* Text editor `vim`
* Version control `git`
* Difftool `meld`
* Web browser `firefox`

## Installation

Start with cloning plugins of choice.

### get plugins for

#### shell colors

* [base16-shell](https://github.com/chriskempson/base16-shell)

#### tmux plugin manager

* [tpm](https://github.com/tmux-plugins/tpm)

#### vim

* [base16-vim](https://github.com/chriskempson/base16-vim)
* [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)
* [gruvbox](https://github.com/morhetz/gruvbox)
* [vim-airline](https://github.com/vim-airline/vim-airline)
* [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)
* [vim-commentary](https://github.com/tpope/vim-commentary)
* [vim-fugitive](https://github.com/tpope/vim-fugitive)
* [vim-json](https://github.com/elzr/vim-json)
* [vim-surround](https://github.com/tpope/vim-surround)
* [vim-tmux](https://github.com/tmux-plugins/vim-tmux)

### install dotfiles

Clone dotfiles:

```bash
git clone https://github.com/dsmftw/fedorarice.git ~/dotfiles
```

Run script to create symlinks:

```bash
cd ~/dotfiles
./bootstrap.sh
```

The `dotfiles/bootstrap.sh` script will create directories as needed and backup any existing files before overwriting with symlinks (with a `.bak` extension).

## Fonts

* Source Code Pro Regular
    * terminal font

Set terminal font size to **9**.
