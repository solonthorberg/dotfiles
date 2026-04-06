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
  awww \
  swaync \
  swayimg \
  smem \
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
  hyprlock \
  hypridle \
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
$ git clone git@github.com:solonthorberg/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```

This can cause conflicts if you already have current dotfiles, then either rename them to `*.bak` or remove them.

### Monitor Configuration

After cloning and stowing, create a per-machine monitor config:

\```
$ nvim ~/.config/hypr/monitors.conf
\```

Example content:
\```
monitor = eDP-1, preferred, 0x0, 1.25
monitor = , preferred, auto, 1
\```

Find your output names with `hyprctl monitors`.

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

For GTK4/libadwaita apps (Nautilus), also symlink the theme's GTK4 CSS:

```
$ mkdir -p ~/.config/gtk-4.0
$ ln -sf /usr/share/themes/catppuccin-mocha-mauve-standard+default/gtk-4.0/gtk.css ~/.config/gtk-4.0/gtk.css
$ ln -sf /usr/share/themes/catppuccin-mocha-mauve-standard+default/gtk-4.0/gtk-dark.css ~/.config/gtk-4.0/gtk-dark.css
$ ln -sf /usr/share/themes/catppuccin-mocha-mauve-standard+default/gtk-4.0/assets ~/.config/gtk-4.0/assets
```

(This is automated by `theme-switch` going forward.)

### Obsidian Setup

After installing Obsidian and opening your vault(s):

1. Install the **Catppuccin** theme: Settings → Appearance → Themes → Manage → search "Catppuccin" → Install and use
2. Install community plugins:
   - **Style Settings** (by mgmeyers)
   - **Advanced URI** (by Vinzent) — required for `theme-switch` to reload Obsidian
3. Disable appearance sync (if using Obsidian Sync):
   Settings → Sync → Vault configuration sync → turn OFF **Appearance settings**

## Theme Switching

Switch between Catppuccin flavors across all apps:

```
$ theme-switch catppuccin-mocha
$ theme-switch catppuccin-frappe
$ theme-switch catppuccin-macchiato
$ theme-switch catppuccin-latte
```

This updates Kitty, Hyprland, Waybar, Wofi, Neovim, zsh syntax highlighting, qBittorrent, spotify-launcher, tmux, Zen Browser, GTK theme (GTK3 + GTK4/libadwaita), cursor theme, swaync notifications, and Obsidian.

## Add to the dotfiles repo

To add a new config, move it from its current location into the dotfiles directory, mirroring the original path structure, then re-run stow.

```
$ mv ~/.config/waybar ~/dotfiles/.config/waybar
$ cd ~/dotfiles
$ stow .
```
