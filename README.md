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
  swaync \
  zsh \
  zoxide \
  fzf \
  qbittorrent \
  spotify-launcher \
  nautilus \
  discord \
  obsidian \
  dbeaver \
  vlc \
  ttf-jetbrains-mono-nerd \
  noto-fonts \
  noto-fonts-emoji \
  grim \
  slurp \
  hyprshot \
  wl-clipboard \
  cliphist \
  fastfetch \
  pipewire \
  pipewire-pulse \
  wireplumber \
  pavucontrol \
  networkmanager \
  bluez \
  bluez-utils \
  xdg-desktop-portal-hyprland \
  sddm \
  nodejs \
  npm \
  unzip \
  wget \
  man-db \
  man-pages \
  fd \
  tree
```

### AUR

```
yay -S \
  oh-my-posh \
  zen-browser-bin \
  postman-bin \
  nordvpn-bin \
  catppuccin-cursors-mocha \
  catppuccin-cursors-frappe \
  catppuccin-cursors-macchiato \
  catppuccin-cursors-latte \
  catppuccin-gtk-theme-mocha \
  catppuccin-gtk-theme-frappe \
  catppuccin-gtk-theme-macchiato \
  catppuccin-gtk-theme-latte
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

### Zen Browser Setup

After installing Zen, enable custom styles:

1. Open `about:config` in Zen
2. Set `toolkit.legacyUserProfileCustomizations.stylesheets` to `true`
3. Find your Zen profile directory:

```
$ cat ~/.zen/profiles.ini
```

4. Copy the theme files to your profile's chrome folder:

```
$ mkdir -p ~/.zen/<profile-folder>/chrome
$ cp -r ~/.config/themes/catppuccin-mocha/zen/* ~/.zen/<profile-folder>/chrome/
```

5. Restart Zen

### Spicetify Setup

After installing Spicetify and Spotify:

```
$ curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
$ chmod a+wr ~/.local/share/spotify-launcher/install/usr/share/spotify/
$ chmod a+wr -R ~/.local/share/spotify-launcher/install/usr/share/spotify/Apps
$ spicetify config spotify_path ~/.local/share/spotify-launcher/install/usr/share/spotify/
$ spicetify config prefs_path ~/.config/spotify/prefs
$ spicetify config current_theme text
$ spicetify config color_scheme CatppuccinMocha
$ spicetify config inject_css 1 replace_colors 1 overwrite_assets 1
$ spicetify backup apply
```

### GTK Theme Setup

Apply the GTK theme for Nautilus and other GTK apps:

```
$ gsettings set org.gnome.desktop.interface gtk-theme "catppuccin-mocha-mauve-standard+default"
$ gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
```

## Theme Switching

Switch between Catppuccin flavors across all apps:

```
$ theme-switch catppuccin-mocha
$ theme-switch catppuccin-frappe
$ theme-switch catppuccin-macchiato
$ theme-switch catppuccin-latte
```

This updates Kitty, Hyprland, Waybar, Wofi, Neovim, zsh syntax highlighting, qBittorrent, spotify-launcer, tmux, Zen Browser, GTK theme, and cursor theme.

## Add to the dotfiles repo

To add a new config, move it from its current location into the dotfiles directory, mirroring the original path structure, then re-run stow.

```
$ mv ~/.config/waybar ~/dotfiles/.config/waybar
$ cd ~/dotfiles
$ stow .
```
