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
  noctalia \
  noctalia-greeter \
  greetd \
  qt6ct \
  kitty \
  neovim \
  tmux \
  swayimg \
  zsh \
  zoxide \
  fzf \
  qbittorrent \
  spotify-launcher \
  nautilus \
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
  fastfetch \
  pipewire \
  pipewire-pulse \
  wireplumber \
  pavucontrol \
  networkmanager \
  bluez \
  bluez-utils \
  xdg-desktop-portal-hyprland \
  polkit \
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
  vesktop-bin \
  postman-bin \
  nordvpn-bin \
  smem
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

After cloning and stowing, create a per-machine monitor config (it is stow-ignored and gitignored, so each machine keeps its own):

```
$ nvim ~/.config/hypr/monitors.lua
```

`hyprland.lua` loads it with `require("monitors")`. Find your output names with `hyprctl monitors`.

## Shell (Noctalia)

[Noctalia](https://docs.noctalia.dev/noctalia/) provides the bar, launcher, notifications, clipboard history, wallpaper, lock screen, idle handling and power menu. It is started from the autostart block in `hyprland.lua`.

Open its settings with:

```
$ noctalia msg settings-toggle
```

On first setup:

- **Wallpaper**: point it at `~/Pictures/Wallpapers/`
- **Services → Idle**: set lock / screen-off / lock-before-sleep timeouts
- **Bar: default**: set up the bar widgets

Keybinds in `hyprland.lua`:

| Keys          | Action                      |
| ------------- | --------------------------- |
| `SUPER+SPACE` | Launcher                    |
| `SUPER+V`     | Clipboard history           |
| `SUPER+X`     | Control Center (power menu) |
| `SUPER+N`     | Toggle Do Not Disturb       |
| `SUPER+L`     | Lock screen                 |

## Theming

All colors come from Noctalia's palette through its templates (**Settings → Templates**). There is no theme switcher anymore: change the palette or wallpaper in Noctalia and every templated app follows.

Enabled templates:

- **Built-in**: Hyprland, Kitty, Btop, GTK 3, GTK 4, Qt
- **Community**: neovim, oh-my-posh, zen-browser, discord, tmux, fastfetch

Some apps need a one-time setup to pick up the generated colors:

### Qt apps (qBittorrent)

Qt apps read the colors through qt6ct. The environment variable is set in `~/.config/environment.d/qt.conf`:

```
QT_QPA_PLATFORMTHEME=qt6ct
```

`hyprland.lua` also pushes it to systemd at startup (before Noctalia starts), so apps launched from the launcher get it:

```lua
hl.exec_cmd("dbus-update-activation-environment --systemd QT_QPA_PLATFORMTHEME")
```

Then open `qt6ct`, set **Style** to **Fusion** and **Color scheme** to **noctalia**.

In qBittorrent, make sure **Tools → Options → Behavior → Use custom UI Theme** is unticked.

### Neovim

The template writes `lua/matugen.lua`, which needs the `RRethy/base16-nvim` plugin (spec in `lua/plugins/base16.lua`), and `init.lua` loads the colors with:

```lua
local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end
```

### Zen Browser

1. Open `about:config` in Zen
2. Set `toolkit.legacyUserProfileCustomizations.stylesheets` to `true`
3. Enable the **zen-browser** template. It writes the CSS to `~/.cache/noctalia/zen-browser/` and adds the `@import` lines to the profile's `chrome/userChrome.css` and `chrome/userContent.css`
4. Open `about:support` → **Clear startup cache…** (Zen restarts and loads the new CSS)

If a palette change doesn't show up in Zen, clear the startup cache again.

### Discord (Vesktop)

The official Discord client can't load themes, so Discord runs through Vesktop. After enabling the **discord** template, open Vesktop's **Settings → Vencord → Themes** and enable one of the Noctalia themes (Midnight, System24 or Material).

## Login Screen (Noctalia Greeter)

Login goes through greetd with [noctalia-greeter](https://docs.noctalia.dev/greeter/).

Set the greeter in `/etc/greetd/config.toml` (merge into the existing `[default_session]`, don't overwrite the file):

```toml
[default_session]
command = "/usr/bin/noctalia-greeter-session"
user = "greeter"
```

Initialize it, then enable greetd (disable any other display manager first):

```
$ sudo noctalia-greeter-apply-appearance --setup-system
$ sudo systemctl enable greetd
```

To sync the wallpaper and palette to the login screen without a password prompt:

```
$ sudo noctalia-greeter passwordless-sync enable <user>
```

Then in Noctalia, **Settings → Security → Noctalia Greeter**: click **Sync Now** and turn on **Auto-Sync Greeter**.

Extra greeter options (default user, clock, keyboard layout, output) go in `/var/lib/noctalia-greeter/greeter.toml`.

## Generated files

These are per-machine or regenerated by Noctalia on every palette change, so they are gitignored:

```
.config/hypr/monitors.lua
.config/nvim/lua/matugen.lua
.config/tmux/themes/noctalia.conf
.config/fastfetch/themes/noctalia.jsonc
```

`.config/nvim/lua/plugins/base16.lua` is committed: Noctalia only creates it once, and it makes a fresh clone install the plugin.

## Add to the dotfiles repo

To add a new config, move it from its current location into the dotfiles directory, mirroring the original path structure, then re-run stow.

```
$ mv ~/.config/fastfetch ~/.dotfiles/.config/fastfetch
$ cd ~/.dotfiles
$ stow .
```
