# My AstroNvim Configuration

This repository contains my personal AstroNvim configuration files.

##  Prerequisites

Before you begin, ensure you have the following installed:

-   [Neovim v0.10+](https://github.com/neovim/neovim/releases/tag/stable)
-   [Git](https://git-scm.com/)
-   A [Nerd Font](https://www.nerdfonts.com/font-downloads) installed and configured in your terminal.
-   [Tree-sitter CLI](https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md) for the `auto_install` feature.

## 🚀 Installation Guide

Follow these steps to install AstroNvim and apply this custom configuration.

### Step 1: Back Up Your Existing Neovim Configuration

If you have an existing Neovim setup, back it up first:

```sh
# Back up your current Neovim config
mv ~/.config/nvim ~/.config/nvim.bak

# Optional: Back up Neovim's local data
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

### Step 2: Install the AstroNvim Template

Clone the base AstroNvim template into your `~/.config/nvim` directory:

```sh
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
```

### Step 3: Apply Your Custom Configuration

Clone this repository to a temporary location, and then copy the configuration files over the base template.

```sh
# Clone this configuration repository to a temporary folder
git clone https://github.com/your-username/astronvim-config.git ~/astronvim-temp-config

# Copy your custom configuration files over the default AstroNvim template.
# The -f flag ensures that existing files are overwritten.
cp -rf ~/astronvim-temp-config/* ~/.config/nvim/

# Clean up the temporary folder
rm -rf ~/astronvim-temp-config
```

Replace `your-username` with your GitHub username.

### Step 4: Launch Neovim

Open Neovim to initialize AstroNvim and install all the plugins.

```sh
nvim
```

AstroNvim will automatically detect the new configuration and install all the necessary plugins. Once the installation is complete, you can restart Neovim to start using your personalized configuration.
