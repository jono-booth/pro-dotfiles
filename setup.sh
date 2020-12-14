#!/bin/bash

set -e

echo "🔧 Setting up your dev environment..."

# Clone dotfiles (replace with your actual repo URL)
if [ ! -d "$HOME/dotfiles" ]; then
  git clone git@github.com:yourusername/dotfiles.git ~/dotfiles
fi

# Symlink .vimrc and .zshrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc

# Install Oh My Zsh if not already present
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "📦 Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install powerlevel10k
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  echo "🎨 Installing Powerlevel10k..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Install zsh plugins
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions \
    $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi

# Install vim-plug if missing
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
  echo "🔌 Installing vim-plug..."
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Install FZF (optional)
if ! command -v fzf &> /dev/null; then
  echo "🔍 Installing fzf..."
  brew install fzf && $(brew --prefix)/opt/fzf/install
fi

echo "✅ Setup complete. Launch Vim and run :PlugInstall to install plugins."
echo "💡 Tip: Restart your terminal and run 'p10k configure' to configure Powerlevel10k."
