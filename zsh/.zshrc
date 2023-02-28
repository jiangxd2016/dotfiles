

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"


plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  z
  k
  git-open
)

source $ZSH/oh-my-zsh.sh
ZSH_DISABLE_COMPFIX="true"



# alias
alias v='nvim'

alias ni="pnpm i"
alias nio="pnpm i --prefer-offline"
alias nr="pnpm run"
alias nd="pnpm run dev"
alias nb="pnpm run build"
alias ns="pnpm run serve"

alias ndd="npm run docs:dev"
alias ndb="npm run docs:build"
alias nds="npm run docs:serve"

alias nt="pnpm run test"
alias ntw="pnpm run test:watch"
alias pw="pnpm why"
alias pr="pnpm -r"

alias nw="pnpm watch"
alias np="pnpm run play"
alias nc="pnpm run clean"
alias ntc="pnpm run typecheck"
alias nl="pnpm run lint"
alias nlf="pnpm run lint --fix"
alias ne="pnpm run release"

alias ra="rm -rf node_modules pnpm-lock.yaml yarn.lock package-lock.json yarn-error.json"

alias cls="clear && printf '\e[3J'"
alias ll="ls -la"
alias gz="tar -zxvf"
alias cp="cp -i"
alias mvim='mvim -v'
alias ip="ifconfig en0 inet | grep inet | awk '{ print \$2 }'"

alias cz="pnpm run cz"
alias ga="git add"
alias gd="git diff"
alias gf="git fetch"
alias gp="git push"
alias gs="git status"
alias gc="git commit -m"
alias gac="git add . && git commit -m" # + commit message
alias gco="git checkout"
alias gk="git checkout ."
alias hp="hexo clean && hexo g && hexo d"
alias gacp="git add . && git ci -m 'update' && git push"
alias aga="alias | grep git" # all git command abbreviations

alias python='/usr/bin/python3'
alias pip='/usr/local/bin/pip3'

# customer directory
alias www="/Users/xd/Documents/www"
alias work="/Users/xd/Documents/work"
alias dep="/Users/xd/Documents/depository"
alias ws="open -a webstorm"

# nvm config
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# nvm hook

# autoload -U add-zsh-hook
# load-nvmrc() {
#   local node_version="$(nvm version)"
#   local nvmrc_path="$(nvm_find_nvmrc)"

#   if [ -n "$nvmrc_path" ]; then
#     local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

#     if [ "$nvmrc_node_version" = "N/A" ]; then
#       nvm install
#     elif [ "$nvmrc_node_version" != "$node_version" ]; then
#       nvm use
#     fi
#   elif [ "$node_version" != "$(nvm version default)" ]; then
#     echo "Reverting to nvm default version"
#     nvm use default
#   fi
# }
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc


#创建git tag
tag() {
  echo "请输入tagname:"
  read tagname
  if [ "$tagname" = "" ]; then
    echo "输入的tagname为空"
    exit 1
  fi

  echo "请输入描述:"

  read detail
  if [ -n "detail" ]; then
    detail="say nothing"
  fi
  if [ "$?" = 0 ]; then
    git tag -a $tagname -m $detail
  fi
}


# 自动生成.gitignore
ignore() {
  if [ -f ".gitignore" ]; then
    echo "gitignore已存在"
    return
  fi
  echo "...正在生成.gitignore"
  touch .gitignore                                                                                                                                # 创建文件
  echo "*.DS_Store  \nnode_modules \n*.log \nidea/ \n*.local \n.DS_Store \ndist \n.cache \n.idea \nlogs \n&-debug.log \n*-error.log" >>.gitignore # 添加内容
}

# template
tvue() {
  if [ ! $1 ]; then
    echo "请输入模板名称"
    return 0
  fi
  echo "正在创建$1目录,下载vitesse-lite模板,请稍等..."
  if [ ! $2 ]; then
    pnpx degit jiangxd2016/vite-template $1 && echo "正在打开$1" && code $1 && cd $1 && echo '正在下载依赖' && nio
  else
    pnpx degit jiangxd2016/vite-template $1 && echo "正在打开$1" && code $1 && cd $1 && echo '正在下载依赖' && nio || nio || nio || echo '安装依赖失败，请重新尝试' && echo "正在执行 nr $2" && nr $2 || eval ${2}
  fi
}
tts() {
  if [ ! $1 ]; then
    echo "请输入模板名称"
    return 0
  fi
  echo "正在创建$1目录,下载vitesse-lite模板,请稍等..."
  if [ ! $2 ]; then
    pnpx degit jiangxd2016/starter-ts $1 && echo "正在打开$1" && code $1 && cd $1 && echo '正在下载依赖' && nio
  else
    pnpx degit jiangxd2016/starter-ts $1 && echo "正在打开$1" && code $1 && cd $1 && echo '正在下载依赖' && nio || nio || nio || echo '安装依赖失败，请重新尝试' && echo "正在执行 nr $2" && nr $2 || eval ${2}
  fi
}


# export PATH="/usr/local/opt/node@16/bin:$PATH"
# export PATH="/usr/local/opt/openjdk/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/xd/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end


# bind auto key
# bindkey '^E' autosuggest-accept
# bindkey '^H' autosuggest-clear


export NODEJS_ORG_MIRROR="https://cdn.npmmirror.com/binaries/node"
export NVM_NODEJS_ORG_MIRROR="https://cdn.npmmirror.com/binaries/node"
export PHANTOMJS_CDNURL="https://cdn.npmmirror.com/binaries/phantomjs"
export CHROMEDRIVER_CDNURL="https://cdn.npmmirror.com/binaries/chromedriver"
export OPERADRIVER_CDNURL="https://cdn.npmmirror.com/binaries/operadriver"
export ELECTRON_MIRROR="https://cdn.npmmirror.com/binaries/electron/"
export ELECTRON_BUILDER_BINARIES_MIRROR="https://cdn.npmmirror.com/binaries/electron-builder-binaries/"
export SASS_BINARY_SITE="https://cdn.npmmirror.com/binaries/node-sass"
export SWC_BINARY_SITE="https://cdn.npmmirror.com/binaries/node-swc"
export NWJS_URLBASE="https://cdn.npmmirror.com/binaries/nwjs/v"
export PUPPETEER_DOWNLOAD_HOST="https://cdn.npmmirror.com/binaries"
export SENTRYCLI_CDNURL="https://cdn.npmmirror.com/binaries/sentry-cli"
export SAUCECTL_INSTALL_BINARY_MIRROR="https://cdn.npmmirror.com/binaries/saucectl"
export npm_config_sharp_binary_host="https://cdn.npmmirror.com/binaries/sharp"
export npm_config_sharp_libvips_binary_host="https://cdn.npmmirror.com/binaries/sharp-libvips"
export npm_config_robotjs_binary_host="https://cdn.npmmirror.com/binaries/robotj"

# rust proxy
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"

export PATH="/usr/local/opt/node@18/bin:$PATH"
export PATH="/usr/local/opt/node@14/bin:$PATH"
