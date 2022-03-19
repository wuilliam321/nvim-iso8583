# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/wuilliam.lacruz/.oh-my-zsh"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export GOBIN="$GOPATH/bin"
export PATH="$HOME/w/j:$PATH"
export GOPRIVATE="github.com/deliveryhero/*"
export GONOSUMDB="github.com/deliveryhero/*,github.com/pedidosya/*"

export PATH="/usr/local/opt/lua@5.3/bin:$PATH"
export PATH="$HOME/Downloads/jdt-language-server-latest/runtime:$PATH"

export JDTLS_HOME=/Users/wuilliam.lacruz/Downloads/jdt-language-server-latest
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="wezm"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git npm yarn node aws cp docker zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias t="tmux"
alias tunnel="/Users/wuilliam.lacruz/w/product-it-documentation/infrastructure/ssh-tunneling/stg-tunnel.sh"
# alias swag="docker run --rm -it  --user $(id -u):$(id -g) -p 34000:34000 -e GOPATH=$HOME/go:/go -v $HOME:$HOME -w $(pwd) quay.io/goswagger/swagger"
alias ctags="`brew --prefix`/bin/ctags"
alias td="nvim ~/dotfiles/notes.md"
alias dot="cd ~/dotfiles; nvim"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(zoxide init zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/wuilliam.lacruz/.sdkman"
[[ -s "/Users/wuilliam.lacruz/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/wuilliam.lacruz/.sdkman/bin/sdkman-init.sh"
[[ -s "/Users/wuilliam.lacruz/.gvm/scripts/gvm" ]] && source "/Users/wuilliam.lacruz/.gvm/scripts/gvm"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

autoload -U compinit
compinit

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export GITHUB_LOGIN="wlacruzpy"
export GITHUB_TOKEN="$(cat ~/.github_token)"

# AWS Google SSO

# Set your google username
export GOOGLE_USERNAME=wuilliam.lacruz@pedidosya.com
export GOOGLE_IDP_ID=C00pn5t3o
export GOOGLE_SP_ID=112173148568

alias sso_vp-stg="aws-google-auth --role-arn arn:aws:iam::100566118830:role/sso/${SSO_ROLE:-sso-administrator} --duration 28800 --profile vp-stg --keyring"
# alias sso_vp-tr="aws-google-auth --role-arn arn:aws:iam::352837743227:role/sso/${SSO_ROLE:-sso-administrator} --duration 28800 --profile vp-stg --keyring"
# alias sso_vp-prd="aws-google-auth --role-arn arn:aws:iam::592360142934:role/sso/${SSO_ROLE:-sso-administrator} --duration 28800 --profile vp-prd --keyring"
