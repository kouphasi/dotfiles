# ~/.zshrc: executed by zsh(1) for non-login shells.
# see /usr/share/zsh/examples/zshrc
# for examples
autoload -Uz colors
colors

# If not running interactively, don't do anything
[[ -o interactive ]] || return

# don't put duplicate lines or lines starting with space in the history.
# See zshoptions(1) for more options
setopt HIST_IGNORE_SPACE

# append to the history file, don't overwrite it
setopt APPEND_HISTORY

# Save 1000 lines of history within 2000 lines of file
HISTSIZE=1000
SAVEHIST=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
#if [[ -n $ZSH_VERSION ]]; then
#    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
#    chpwd_recent_dirs 20
#    add-zsh-hook chpwd update_recent_dirs
#fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# git-promptの読み込み
source ~/.zsh/git-prompt.sh

# git-completionの読み込み
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit

# プロンプトのオプション表示設定
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

# プロンプトの表示設定(好きなようにカスタマイズ可)
setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
\$ '

# some more ls aliases
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'

# set a fancy prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats '(%b)'
zstyle ':vcs_info:*' actionformats '(%b|%a)'
zstyle ':vcs_info:*' formats '(%b)'
zstyle ':vcs_info:*' actionformats '(%b|%a)'
precmd() { vcs_info }

# Enable tab completion
autoload -Uz compinit
compinit

# enamble emacs keybind
bindkey -e

alias relogin='exec $SHELL -l'

alias g='git'

function gitlines () {
  git log --numstat --pretty="%H" --author=`git config user.name` --no-merges | awk "NF==3 {plus+=\$1; minus+=\$2} END {printf(\"$(git config user.name) commits %d lines (+%d, -%d)\\n\", plus+minus, plus, minus)}"
}

export EDITOR=nvim
export VISUAL=nvim

