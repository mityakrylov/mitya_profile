####################################################################################################
# Settings

export PATH=$HOME/bin:$HOME/.local/bin:$PATH
export TMPDIR=$HOME/tmp

export LANG=en_US.UTF-8
export LC_NUMERIC=C

# Ignore first two ctrl+d, (ctrl+d sends EOF, which exits shell)
export IGNOREEOF=2

export MY_VIM_PATH="$HOME/install/bin/vim"
export GIT_EDITOR="$MY_VIM_PATH"

####################################################################################################
# Color for ls

export LS_COLORS="di=1;34:ln=35:so=36;40:pi=33:ex=1;32:bd=90;46:cd=34;43:su=41:sg=46:tw=42:ow=90;43:"

####################################################################################################
# Functions

function recycle() {
    if [ $# -eq 0 ]; then
        echo "recycle <filename>"
        echo "recycle creates folder with current datetime in ~/.recycle_bin and moves specified files there"
        return
    fi

    recycleDir=~/.recycle_bin/$(date +%Y%m%d_%H%M%S)

    mkdir -p $recycleDir
    for file in "$@"; do
        mv "$file" $recycleDir/
    done
}

function fix_ssh_auth_sock() {
    local socket_path="$(tmux show-environment | sed -n 's/^SSH_AUTH_SOCK=//p')"

    if ! [[ "$socket_path" ]]; then
        echo "no socket path" >&2
        return 1
    else
        export SSH_AUTH_SOCK="$socket_path"
    fi
}

####################################################################################################
# Prompt settings

PROMPT_COLOR_START="\[\e[38;5;220m\]"
PROMPT_COLOR_END="\[\e[m\]"
PROMPT_COLOR_GIT_BRANCH_CLEAN="\[\e[38;5;28m\]"
PROMPT_COLOR_GIT_BRANCH_DIRTY="\[\e[38;5;172m\]"

# based on jimeh/git-aware-prompt
find_git_branch() {
    local branch
    local status
    if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
        if [[ "$branch" == "HEAD" ]]; then
            branch='detached*'
        fi
        local status=$(git status --porcelain 2> /dev/null)
        if [[ "$status" == "" ]]; then
            GIT_BRANCH_CLEAN=" ($branch)"
            GIT_BRANCH_DIRTY=""
        else
            GIT_BRANCH_CLEAN=""
            GIT_BRANCH_DIRTY=" ($branch)"
        fi
    else
        GIT_BRANCH_CLEAN=""
        GIT_BRANCH_DIRTY=""
    fi
}

export PROMPT_COMMAND="find_git_branch"

export PS1="$PROMPT_COLOR_START[\u@\h:\w]$PROMPT_COLOR_GIT_BRANCH_CLEAN\$GIT_BRANCH_CLEAN$PROMPT_COLOR_GIT_END$PROMPT_COLOR_GIT_BRANCH_DIRTY\$GIT_BRANCH_DIRTY$PROMPT_COLOR_END $PROMPT_COLOR_END"

####################################################################################################
# Aliases

alias l="ls -1F --color=auto --group-directories-first"
alias ll="ls -F --color=auto --group-directories-first"
alias mv="mv -i"
alias cp="cp -i"
alias rm="rm -i"
alias rc="recycle"

alias tm="tmux attach || tmux new"
alias tmls="tmux ls"
alias tma="tmux attach -t "

alias gst="git status"
alias gstu="git status --untracked-files=no"
alias gd="git difftool"
alias gds="git difftool --staged"
alias gco="git checkout"
alias gci="git commit"
alias ga="git add"
alias gu="git reset HEAD"
alias gb="git branch"

alias vim="$MY_VIM_PATH"

####################################################################################################
# Miscellanious

# Disable start/stop terminal signals for ctrl+s usage
stty -ixon

####################################################################################################
# Bash history

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# unlimited bash history
export HISTFILESIZE=
export HISTSIZE=

# custom bash history file
export HISTFILE=$HOME/.bash_eternal_history

# append history after each command
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

####################################################################################################
# Custom profile

if [ -f $HOME/.profile_custom ]; then
    . $HOME/.profile_custom
fi

####################################################################################################
# Fzf profile

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


