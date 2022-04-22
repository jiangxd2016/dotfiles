
export UPDATE_ZSH_DAYS=13
export ZSH="/Users/xd/.oh-my-zsh"
export ZPLUG_HOME=/usr/local/opt/zplug

source $ZSH/oh-my-zsh.sh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="ys"

if [[ -f $ZPLUG_HOME/init.zsh ]] {
  source $ZPLUG_HOME/init.zsh

  zplug "zsh-users/zsh-syntax-highlighting"
  zplug "zsh-users/zsh-autosuggestions"
  zplug "agkozak/zsh-z"
  zplug "supercrabtree/k"
  zplug "MichaelAquilina/zsh-you-should-use"
  zplug "changyuheng/zsh-interactive-cd"
  zplug "SleepyBag/zsh-confer"
  zplug "denysdovhan/spaceship-prompt", as:theme, depth:1
  zplug "plugins/git",                 from:oh-my-zsh
  zplug "plugins/z",                   from:oh-my-zsh
  zplug "plugins/d",                   from:oh-my-zsh
  zplug "plugins/vim-mode",            from:oh-my-zsh

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

  # Then, source plugins and add commands to $PATH
  zplug load
}

# alias
alias ni="pnpm i"
alias nio="pnpm i --prefer-offline"
alias nr="pnpm run"
alias nd="pnpm run dev"
alias nb="pnpm run build"
alias ns="pnpm run serve"
alias nt="pnpm run test"
alias pw="pnpm why"
alias pr="pnpm -r"

alias nw="p n p m watch"
alias np="pnpm run play"
alias nc="pnpm run typecheck"
alias nl="pnpm run lint"
alias nlf="pnpm run lint --fix"
alias ne="pnpm run release"

alias ra="rm -rf node_modules pnpm-lock.yaml yarn.lock package-lock.json"

alias cls="clear"
alias ll="ls -la"
alias gz="tar -zxvf"
alias cp="cp -i"
alias mvim='mvim -v'
alias ip="ifconfig en0 inet | grep inet | awk '{ print \$2 }'"

alias ga="git add"
alias gd="git diff"
alias gf="git fetch"
alias gp="git push"
alias gs="git status"
alias gc="git commit -m"
alias gac="git add . && git commit -m" # + commit message
alias gco="git checkout"
alias gk="git chekout ."
alias hp="hexo clean && hexo g && hexo d"
alias gacp="git add . && git ci -m 'update' && git push"


# nvm config
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# nvm hook
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

