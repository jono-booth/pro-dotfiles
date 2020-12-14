# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git rbenv z zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

#HOMEBREW
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# RBENV
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
if [[ $(command -v rbenv) != "" ]]; then
  eval "$(rbenv init -)"
fi

export RUBY_CFLAGS="-Wno-error=implicit-function-declaration"
export optflags="-Wno-error=implicit-function-declaration"

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig"
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"

export LDFLAGS="-L/opt/homebrew/opt/readline/lib"
export CPPFLAGS="-I/opt/homebrew/opt/readline/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/readline/lib/pkgconfig:$PKG_CONFIG_PATH"

export LDFLAGS="-L/opt/homebrew/opt/libffi/lib:$LDFLAGS"
export CPPFLAGS="-I/opt/homebrew/opt/libffi/include:$CPPFLAGS"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig:$PKG_CONFIG_PATH"

export LDFLAGS="-L/usr/local/opt/hdf5@1.8/lib"
export CPPFLAGS="-I/usr/local/opt/hdf5@1.8/include"
export PATH="/usr/local/opt/hdf5@1.8/bin:$PATH"

export ZLIB_PREFIX=$(brew --prefix zlib)
export PKG_CONFIG_PATH="$ZLIB_PREFIX/lib/pkgconfig:$PKG_CONFIG_PATH"
export LDFLAGS="-L$ZLIB_PREFIX/lib $LDFLAGS"
export CPPFLAGS="-I$ZLIB_PREFIX/include $CPPFLAGS"

if command -v colima 1>/dev/null 2>&1; then
  export DOCKER_HOST=unix://$HOME/.colima/default/docker.sock
fi

# JAVA
export JAVA_HOME=$(/usr/libexec/java_home -v 17)
export PATH="$HOME/.jenv/bin:$PATH"

if command -v jenv 1>/dev/null 2>&1; then
  eval "$(jenv init -)"
fi

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

#NVM
export PATH=/usr/local/share/npm/bin:$PATH
export NVM_DIR="$HOME/.nvm"
if command -v nvm 1>/dev/null 2>&1; then
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi

export PATH="$PATH:/opt/yarn-1.19.2/bin"

#POSTGRES
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/ImageMagick-Scripts:$PATH"

#stty -ixon -ixoff

# checkout develop
function gdoc {
  git checkout develop
}

# push origin current_branch
function gpoc {
  echo Pushing $(current_branch)
  git push origin $(current_branch)
}

# force push origin current_branch
function gpocf {
  echo Pushing $(current_branch)
  git push -f origin $(current_branch)
}

# pull origin current_branch
function gloc {
  echo Pulling $(current_branch)
  git pull origin $(current_branch)
}

# fetch origin current_branch
function gfoc {
echo Fetching origin/$(current_branch)
  git fetch origin $(current_branch)
}

# merge origin current_branch
function gmoc {
echo Merging origin/$(current_branch) into $(current_branch)
  git merge origin/$(current_branch)
}

# open github for current repo
function gh {
  repo=`git remote -v | grep -m 1 origin | sed "s/git@github.com://" | cut -c8-999 | sed "s/\.git .*//"`
  echo Opening Github for $repo
  open $repo
}

# list pull requests for repo
function gprl {
  repo=`git remote -v | head -1 | sed "s/git@github.com://" | cut -c8-999 | sed "s/\.git .*//"`
  echo Opening list of pull requests for $repo
  open $repo
}

# create pull request into specified branch (develop if none specified)

function gpr {
  echo Opening pull request for $(current_branch)
  repo=`git remote -v | grep -m 1 origin | sed "s/git@github.com://" | cut -c8-999 | sed "s/\.git .*//"`
  branch=""
  if [ $1 ]; then
    branch="$1...$(current_branch)"
  else
    branch="develop...$(current_branch)"
  fi
  open "$repo/compare/$branch?expand=1"
}

function gprtt {
  echo Opening pull request for $(current_branch)
  repo=`git remote -v | grep -m 1 origin | sed "s/git@github.com://" | cut -c8-999 | sed "s/\.git .*//"`
  branch=""
  if [ $1 ]; then
    branch="$1...$(current_branch)"
  else
    branch="development...$(current_branch)"
  fi
  open "$repo/compare/$branch?expand=1"
}

function gcma()  { git commit -am "$*"; }              # add
function gcmr()  { git commit -am "Remove $*"; }        # remove
function gcmc()  { git commit -am "chore: $*"; }           # chore
function gcmf()  { git commit -am "fix: $*"; }             # fix
function gcmhf() { git commit -am "hotfix: $*"; }            # hotfix
function gcmrl() { git commit -am "release: $*"; }         # release
function gcmrf() { git commit -am "refactor: $*"; }  # refactor
function gcmw()  { git commit -am "WIP: $*"; }          # wip

function rss() { rails server && open http://0.0.0.0:3000 }

# Aliases

alias zrc='vi ~/.zshrc'
alias vrc='vi ~/.vimrc'

alias gs='git commit -am '
alias gs='git status '
alias gp='git push '
alias gpo='git push origin '
alias ga='git add '
alias gb='git branch '
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias gcod="git checkout develop"
alias gcode="git checkout development"
alias gpod="git pull origin develop"
alias gpod="git pull origin development"
alias gpd="git pull . develop"
alias grde="git rebase -i development"

alias be="bundle exec"
alias rs="rails server"
alias rc="rails console"
alias brc="bundle exec rails console"
alias rsp="rake spec"
alias brsp="bundle exec rspec"
alias rdm="bundle exec rake db:migrate"
alias dbm="bundle exec rake db:migrate"
alias bs='bundle exec sidekiq'
alias bfs='bundle exec foreman start'

# Local Commands
alias ports='lsof -i -P -n | grep LISTEN'
alias sg="bundle exec shotgun"
alias pa='ph; source .venv/bin/activate; python ./app.py'

# Navigation

# Servers
alias ngrok="/Applications/ngrok http 3000"
alias lvh="rails server -b 'ssl://lvh.me:3000?key=~/.ssh/server.key&cert=~/.ssh/server.crt'"

# Clean up Paths
typeset -U path

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
