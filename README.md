# Arch Setup

Directory contains dotfiles for my Arch Setup

## Requirements

Ensure you have the following installed on your system

### Git

```
sudo pacman -S git
```

### Stow

```
sudo pacman -S stow
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
