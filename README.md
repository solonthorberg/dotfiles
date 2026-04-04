# Arch Setup

Directory contains dotfiles for my Arch Setup

## Requirements

Ensure you have the following installed on your system

### Packages

```
sudo pacman -S \
  git \
  stow \
  hyprland \
  kitty \
  waybar \
  wofi \
  neovim \
  tmux \
  swww \
  dunst \
  zsh \
  zoxide \
  fzf \
  ttf-jetbrains-mono-nerd
```

### AUR

```
yay -S \
oh-my-posh
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com:solonthorberg/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```

This can cause conflicts if you already have current dotfiles, then either rename them to `*.bak` or remove them.

## Add to the dotfiles repo

```
$ mv ~/.config/waybar ~/dotfiles/.config/waybar
$ cd ~/dotfiles
$ stow .
```
