# 🚀 My Dotfiles

A collection of my personal configuration files for a productive Linux desktop environment using i3wm, Neovim, and various other tools. Managed with GNU Stow for easy deployment.

## 📋 Contents

This repository contains configuration files for:

- **bash** - Bash shell configuration
- **zsh** - Z shell configuration
- **i3** - i3 window manager with custom keybindings and settings
- **polybar** - Status bar with custom modules including Cava visualizer
- **kitty** - Modern, GPU-accelerated terminal emulator
- **nvim** - Neovim editor with Lazy.nvim plugin manager
- **dunst** - Lightweight notification daemon

## 🖥️ Screenshots

*I haven't added screenshots yet.*

## ✨ Features

### Neovim Setup
- **Plugin Manager**: Lazy.nvim
- **Plugins Included**:
  - Alpha (dashboard)
  - Catppuccin (colorscheme)
  - LSP configuration
  - Completions
  - Debugging support
  - Lualine (statusline)
  - Neo-tree (file explorer)
  - None-ls (formatting & linting)
  - Telescope (fuzzy finder)
  - Treesitter (syntax highlighting)

### i3 Configuration
- Custom keybindings
- i3status integration
- Transparency toggle script

### Polybar
- Custom status bar
- Cava audio visualizer integration

## 📦 Prerequisites

Before installing these dotfiles, ensure you have the following packages installed:
```bash
# Arch Linux
sudo pacman -S i3-wm polybar kitty neovim dunst zsh bash stow

# Ubuntu/Debian
sudo apt install i3 polybar kitty neovim dunst zsh bash stow

# Fedora
sudo dnf install i3 polybar kitty neovim dunst zsh bash stow
```

Additional dependencies for Neovim plugins:
```bash
# LSP servers, formatters, linters (adjust based on your needs)
# Node.js for many LSP servers
# Python for Python LSP
# Ripgrep for Telescope
# fd for better file finding
```

For Polybar Cava integration:
```bash
# Arch Linux
sudo pacman -S cava

# Ubuntu/Debian
sudo apt install cava

# Fedora
sudo dnf install cava
```

## 🚀 Installation

### Using GNU Stow (Recommended)

**Warning**: This will create symlinks to your configuration files. Make sure to backup your existing configs!
```bash
# Clone the repository
git clone https://github.com/DagarMihir/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Backup existing configs (optional but recommended)
mkdir -p ~/.config_backup
cp -r ~/.config/i3 ~/.config_backup/ 2>/dev/null
cp -r ~/.config/nvim ~/.config_backup/ 2>/dev/null
cp -r ~/.config/kitty ~/.config_backup/ 2>/dev/null
cp -r ~/.config/polybar ~/.config_backup/ 2>/dev/null
cp -r ~/.config/dunst ~/.config_backup/ 2>/dev/null
cp ~/.bashrc ~/.bashrc.backup 2>/dev/null
cp ~/.zshrc ~/.zshrc.backup 2>/dev/null

# Stow all configurations at once
stow */

# Or stow individual packages
stow bash
stow zsh
stow i3
stow kitty
stow nvim
stow polybar
stow dunst

# Make scripts executable
chmod +x ~/.config/i3/toggle-transparency.sh
chmod +x ~/.config/polybar/cava.sh
```

### Unstowing (Removing Symlinks)

To remove symlinks created by stow:
```bash
cd ~/dotfiles

# Remove all configurations
stow -D */

# Or remove individual packages
stow -D bash
stow -D nvim
# etc...
```

### Restowing (Updating)

When you update your dotfiles:
```bash
cd ~/dotfiles

# Pull latest changes
git pull

# Restow to update symlinks
stow -R */

# Or restow individual packages
stow -R nvim
```

## ⚙️ Post-Installation

### Neovim Setup
1. Launch Neovim: `nvim`
2. Lazy.nvim will automatically install all plugins on first launch
3. Wait for all plugins to finish installing
4. Restart Neovim

### i3 Configuration
1. Reload i3: `Mod+Shift+r` (or `$mod+Shift+r` based on your config)
2. Make sure the transparency script is executable
3. Adjust keybindings in `~/.config/i3/config` to your preference

### Polybar
1. Launch polybar: `polybar example &` (adjust bar name based on your config)
2. For Cava integration, ensure Cava is installed and configured
3. Add polybar to i3 config for auto-start

### Dunst
1. Reload dunst: `killall dunst; dunst &`
2. Test notifications: `notify-send "Test" "This is a test notification"`

### Shell Configuration
For **zsh** users:
```bash
chsh -s $(which zsh)
```

For **bash** users (if not default):
```bash
chsh -s $(which bash)
```

Log out and log back in for the shell change to take effect.

## 🎨 Customization

### Changing the Theme
- Neovim: Edit `~/.config/nvim/lua/plugins/catppuccin.lua`
- Kitty: Edit `~/.config/kitty/kitty.conf`
- i3: Edit `~/.config/i3/config`

### Adding More Plugins to Neovim
1. Create a new file in `~/.config/nvim/lua/plugins/`
2. Add your plugin configuration
3. Restart Neovim and run `:Lazy sync`

## 📝 Configuration Structure
```
dotfiles/
├── bash/
│   └── .bashrc                           # Bash configuration
├── zsh/
│   └── .zshrc                            # Zsh configuration
├── i3/
│   └── .config/i3/
│       ├── config                        # i3 main config
│       ├── i3status/config               # i3status config
│       └── toggle-transparency.sh        # Transparency toggle script
├── kitty/
│   └── .config/kitty/
│       └── kitty.conf                    # Kitty terminal config
├── nvim/
│   └── .config/nvim/
│       ├── init.lua                      # Neovim entry point
│       ├── lua/
│       │   ├── plugins/                  # Plugin configurations
│       │   ├── plugins.lua               # Plugin list
│       │   └── vim-options.lua          # Vim options
│       └── lazy-lock.json                # Plugin version lock
├── polybar/
│   └── .config/polybar/
│       ├── config.ini                    # Polybar config
│       ├── cava.sh                       # Cava script
│       └── cava_polybar_config           # Cava config
├── dunst/
│   └── .config/dunst/
│       └── dunstrc                       # Dunst config
└── README.md
```

## 🔧 How Stow Works

GNU Stow creates symlinks from your dotfiles directory to your home directory. For example:
```
~/dotfiles/nvim/.config/nvim/init.lua → ~/.config/nvim/init.lua
~/dotfiles/bash/.bashrc → ~/.bashrc
```

This allows you to:
- Keep all your dotfiles organized in one repository
- Version control your configurations with Git
- Easily deploy configs to new machines
- Selectively enable/disable configurations
- Update all configs with a simple `git pull`

### Stow Tips

1. **Dry run before stowing**: See what will happen without making changes
```bash
   stow -n -v bash  # -n for dry run, -v for verbose
```

2. **Handle conflicts**: If stow finds existing files, move them first
```bash
   mv ~/.bashrc ~/.bashrc.backup
   stow bash
```

3. **Adopt existing files**: Let stow take ownership of existing files
```bash
   stow --adopt bash  # Copies ~/.bashrc into the stow directory
```

## 🐛 Troubleshooting

### Neovim plugins not loading
- Run `:Lazy sync` inside Neovim
- Check `:checkhealth` for missing dependencies
- Verify symlinks: `ls -la ~/.config/nvim`

### Polybar not showing
- Check if polybar is running: `ps aux | grep polybar`
- Review polybar logs: `polybar example 2>&1 | tee /tmp/polybar.log`
- Verify symlinks: `ls -la ~/.config/polybar`

### i3 keybindings not working
- Verify your `$mod` key setting in i3 config
- Reload i3 configuration: `$mod+Shift+c`
- Check if config is symlinked: `ls -la ~/.config/i3/config`

### Dunst notifications not appearing
- Check if dunst is running: `ps aux | grep dunst`
- Restart dunst: `killall dunst; dunst &`
- Verify config: `ls -la ~/.config/dunst/dunstrc`

### Stow conflicts
If stow reports conflicts:
```bash
# Check what's conflicting
stow -n -v nvim

# Backup the conflicting files
mv ~/.config/nvim ~/.config/nvim.backup

# Try stowing again
stow nvim
```

### Broken symlinks
Check for broken symlinks:
```bash
find ~ -maxdepth 3 -xtype l  # Find broken symlinks
```

## 🔄 Managing Dotfiles Workflow

### Making Changes
1. Edit files in `~/dotfiles/` (they're symlinked, so changes apply immediately)
2. Test your changes
3. Commit and push to Git:
```bash
   cd ~/dotfiles
   git add .
   git commit -m "Update nvim config"
   git push
```

### Deploying to a New Machine
```bash
git clone https://github.com/DagarMihir/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow */
```

## 🤝 Contributing

Feel free to fork this repository and customize it for your own use. If you have suggestions or improvements, pull requests are welcome!

## 📄 License

These configuration files are available as-is. Feel free to use, modify, and distribute them as you wish.

## 🙏 Acknowledgments

Thanks to the amazing open-source community and the developers of all the tools configured in this repository.

---
