# 🛠️ Developer Environment Setup Guide

## ⚡ TL;DR Quick Setup

```bash
git clone git@github.com:jono-booth/pro-dotfiles.git ~/dotfiles
curl -O https://yourdomain.com/setup.sh
chmod +x setup.sh
./setup.sh
```

> One-liner to clone, symlink, and install everything (Zsh, Vim, plugins, Powerlevel10k, etc.)

---

This guide outlines how to set up a powerful, fast, and productive developer environment using Vim and Zsh, with custom configurations and plugin support via `vim-plug` and `oh-my-zsh`.

---

## 📁 1. Clone and Set Up Symlinks

To keep your dotfiles under version control:

```bash
# Clone your dotfiles repository
git clone git@github.com:jono-booth/pro-dotfiles.git ~/dotfiles

# Create symlinks
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
```

> 🔁 Tip: You can also symlink other config files like `.tmux.conf`, `.gitconfig`, etc., into this structure.

---

## ✨ 2. Zsh Setup (`.zshrc`)

### Prerequisites

- Zsh (`brew install zsh`)
- [Oh My Zsh](https://ohmyz.sh/)
- [Powerlevel10k theme](https://github.com/romkatv/powerlevel10k)
- `zsh-autosuggestions` and `zsh-syntax-highlighting` plugins

### Install Instructions

```bash
# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# Syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

### Plugin Overview

- `git`: Git aliases and tab completions
- `rbenv`: Ruby version manager
- `z`: Quick directory jumping
- `zsh-autosuggestions`: CLI autocompletions based on history
- `zsh-syntax-highlighting`: Highlights commands in the terminal

---

## 🧠 3. Vim Setup (`.vimrc`)

### Prerequisites

- [vim-plug](https://github.com/junegunn/vim-plug)
- FZF (`brew install fzf`)
- Node.js, Ruby, or language-specific dependencies for LSP/linting

### Install Plugins

After setting up the `.vimrc`, run:

```vim
:PlugInstall
```

### Plugin Highlights

#### General Productivity

- `vim-sensible`: Sensible defaults
- `vim-surround`: Easily edit surrounding characters
- `vim-commentary` / `nerdcommenter`: Toggle comments
- `vim-endwise`: Auto-close Ruby blocks
- `NERDTree`: File explorer
- `vim-gitgutter`: Git diff markers
- `vim-fugitive`: Git inside Vim

#### Navigation & Search

- `fzf.vim`: Fuzzy search
- `vim-easymotion`: Quick cursor movement
- `ctrlp.vim`: Project file finder

#### UI / Visual

- `Apprentice`, `gruvbox`: Color schemes
- `vim-airline` + `vim-airline-themes`: Statusline
- `vim-indent-guides`: Visual indent levels
- `vim-devicons`: Filetype icons

#### Language Support

- `vim-rails`, `vim-rspec`: Ruby on Rails tools
- `vim-javascript`, `vim-es6`, `vim-vue-plugin`: JavaScript/ES6/Vue support
- `vim-slim`: Slim templating support

#### Linting & Autocompletion

- `ale`: Linting and fixer support
- `auto-pairs`: Automatic bracket/quote closure

---

## 🚧 Common Pitfalls

- **Missing plugin dependencies**: Some plugins (like ALE or airline) require Node, Ruby, or other language runtimes.
- **Terminal fonts**: Use a [Nerd Font](https://www.nerdfonts.com/) for proper icon rendering in airline/devicons.
- **fzf errors**: Ensure fzf is installed and sourced properly (`brew install fzf && $(brew --prefix)/opt/fzf/install`).
- **Powerlevel10k configuration**: Run `p10k configure` after first shell launch.

---

## 💡 Why This Setup Rocks

- **Fast, minimal, and clean**: Vim and Zsh are highly customizable and lightweight.
- **Deep Git integration**: Both in the shell and editor.
- **Productivity-first**: Fast file navigation, visual clarity, and code movement.
- **Built for Ruby & JS**: Ideal for full-stack development.
- **Easy to maintain**: Centralized dotfile management via symlinks.
