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
  qbittorrent \
  ttf-jetbrains-mono-nerd
```

### AUR

```
yay -S \
  oh-my-posh \
  catppuccin-cursors-mocha \
  catppuccin-cursors-frappe \
  catppuccin-cursors-macchiato \
  catppuccin-cursors-latte
```

### Spicetify

```
curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
```

### Zinit

Installed automatically via `.zshrc` on first shell load.

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

## Theme Switching

Switch between Catppuccin flavors across all apps:

```
$ theme-switch catppuccin-mocha
$ theme-switch catppuccin-frappe
$ theme-switch catppuccin-macchiato
$ theme-switch catppuccin-latte
```

This updates Kitty, Hyprland, Waybar, Wofi, Neovim, zsh syntax highlighting, qBittorrent, Spotify, tmux, and cursor theme.

## Add to the dotfiles repo

To add a new config, move it from its current location into the dotfiles directory, mirroring the original path structure, then re-run stow.

```
$ mv ~/.config/waybar ~/dotfiles/.config/waybar
$ cd ~/dotfiles
$ stow .
```
