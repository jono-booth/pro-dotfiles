# Changelog

All notable updates to the Vim configuration are documented in this file.

# Changelog: Shell Environment Update – 2025-07-16

**Overview:**
Enhanced `.zshrc` configuration with a modern theme, new productivity plugins, error fixes, and performance considerations.

---

## Theme & UI Enhancements
- Switched from `robbyrussell` to the [Powerlevel10k](https://github.com/romkatv/powerlevel10k) theme:
  - Updated `ZSH_THEME="powerlevel10k/powerlevel10k"`.
  - Added Powerlevel10k instant prompt block for faster shell startup.
  - Installed recommended font: `MesloLGS NF`.

---

## 🔌 Plugin Additions
- Added the following plugins for improved developer experience:
  - `zsh-autosuggestions`
  - `zsh-syntax-highlighting`
  - `z` (for directory jumping)

- Ensured plugin list is now:
  ```zsh
  plugins=(git rbenv z zsh-autosuggestions zsh-syntax-highlighting)
  ```

- Manually sourced the syntax highlighting and autosuggestions after `oh-my-zsh.sh`:
  ```zsh
  source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  ```

---

## Fixes & Improvements
- Fixed `_z:22: no such file or directory: ~/.z` by initializing the `.z` tracking file:
  ```sh
  touch ~/.z
  ```

---

## Notes for Future Optimization
- Discussed using `brew --prefix <formula>` for dynamic and portable environment paths.
- Retained modular `PATH` statements for clarity.
- Left Android SDK block commented out for potential future reactivation.

---

## Other Enhancements
- Added `alias ports` for quick port inspection.
- Added `typeset -U path` to deduplicate `$PATH` entries.

## Result
- Faster shell startup time.
- Cleaner, more informative prompt.
- Smarter navigation and command-line assistance.
- Better Ruby and Homebrew compatibility across macOS setups.

---

# Changelog: Vim modern overhaul – 2025-07-16

**Overview:**
Enhanced `.vimrc` configuration with a modern theme, new productivity plugins, error fixes, and performance considerations.

### Migration to vim-plug

**Switched from Vundle to [vim-plug](https://github.com/junegunn/vim-plug)** for faster plugin loading, better plugin management, and easier setup.
Steps taken:
- Installed vim-plug via curl into `~/.vim/autoload/plug.vim`
- Updated `.vimrc` to use `call plug#begin()` and `call plug#end()` block
- Migrated all plugins from `Plugin`/`Bundle` syntax to `Plug 'author/plugin'`

### Plugin Updates and Organization

#### New Plugins Added
- **General**
  - `tpope/vim-sensible`: Sensible defaults to reduce boilerplate config
  - `tpope/vim-commentary`: Easy commenting with `gc`
  - `tpope/vim-surround`: Change or add surrounding quotes/brackets
  - `tpope/vim-endwise`: Auto-add `end` in Ruby files

- **UI / Navigation**
  - `vim-airline/vim-airline` and `vim-airline-themes`: Status bar enhancements
  - `nathanaelkane/vim-indent-guides`: Visual indent guides
  - `ryanoasis/vim-devicons`: Adds icons to plugins like NERDTree
  - `morhetz/gruvbox`: Popular color theme with good contrast
  - `junegunn/fzf.vim`: Fast fuzzy file finder
  - `easymotion/vim-easymotion`: Quick cursor jumping
  - `ctrlpvim/ctrlp.vim`: File finder with fuzzy search

- **Git Integration**
  - `tpope/vim-fugitive`: Full git support from within Vim
  - `airblade/vim-gitgutter`: Show git diff in the gutter
  - `preservim/nerdcommenter`: Comment toggling for multiple filetypes

- **Syntax & Language Plugins**
  - `leafOfTree/vim-vue-plugin`: Vue file support
  - `pangloss/vim-javascript`, `isRuslan/vim-es6`: Enhanced JavaScript syntax
  - `slim-template/vim-slim`: Slim templating for Rails
  - `tpope/vim-rails`: Rails development tools
  - `thoughtbot/vim-rspec`: RSpec commands and mappings

- **Linting / Completion**
  - `dense-analysis/ale`: Async linting for many languages
  - `jiangmiao/auto-pairs`: Automatically close brackets, quotes, etc.

---

### Cleanup and Deprecated Plugin Removal

- Removed unused or outdated plugins:
  - `youcompleteme`, `vimcompletesme`: Deprecated in favor of ALE or coc.nvim
  - `neocomplete` settings were removed as it was not in use
  - Duplicates like `set nocompatible` cleaned up
- Removed config that was commented out or not supported anymore

---

### Color Scheme Fix

**Issue:** `colorscheme apprentice` was used without the actual plugin being installed
**Solution:**
- Option 1: Installed `romainl/Apprentice` via vim-plug
- Option 2: Switched to a color scheme included in `vim-colorschemes` like `gruvbox`

Added fallback to `set background=dark` and ensured syntax was enabled.

---

### Enhanced Editor Settings

Improved usability and ergonomics:
- `set mouse=a`: Enable mouse support in terminal
- Search enhancements:
  ```vim
  set incsearch
  set hlsearch
  set ignorecase
  set smartcase
  ```
---

### Persistent Undo

Enabled persistent undo so changes are remembered between sessions:

```vim
set undofile
set undodir=~/.vim/undodir
```

Then created the directory:
```sh
mkdir -p ~/.vim/undodir
```

---

### Multi-Machine Setup

- Successfully installed and synchronized updated Vim config across **2 machines** (Work and Hobby).
- Used Finder shortcuts (`Cmd+Shift+.`) to show dotfiles and manage `.vimrc`
- Synced using common `.vimrc` and `PlugInstall` to fetch plugins

---

## Summary

This version focuses on modernization, speed, and clarity. It removes legacy cruft, improves visual ergonomics, and sets up a highly productive Vim environment.

