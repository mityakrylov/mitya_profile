####################################################################################################
# Settings

export PATH=$HOME/bin:$HOME/.local/bin:$PATH
export TMPDIR=$HOME/tmp

export LANG=en_US.UTF-8
export LC_NUMERIC=C

# Ignore first two ctrl+d, (ctrl+d sends EOF, which exits shell)
export IGNOREEOF=2

####################################################################################################
# Aliases

alias l="ls -1F --color=auto --group-directories-first"
alias ll="ls -F --color=auto --group-directories-first"
alias mv="mv -i"
alias cp="cp -i"
alias rm="rm -i"

alias tm="tmux attach || tmux new"
alias tmls="tmux ls"
alias tma="tmux attach -t "

alias gst="git status"
alias gstu="git status --untracked-files=no"
alias gd="git difftool"
alias gds="git difftool --staged"

####################################################################################################
# Color for ls

# LSCOLORS="AxexcxdxCxegedabagacad" # bsd version
export LS_COLORS="di=1;94:ln=35:so=36;40:pi=33:ex=1;32:bd=90;46:cd=34;43:su=41:sg=46:tw=42:ow=90;43:"

####################################################################################################
# Prompt settings

PROMPT_COLOR_START="\[\e[38;5;220m\]"
PROMPT_COLOR_END="\[\e[m\]"
export PS1="$PROMPT_COLOR_START[\u@\h:\w]$ $PROMPT_COLOR_END"

####################################################################################################
# Functions

function recycle() {
    if [ $# -eq 0 ]; then
        echo "recycle <filename>"
        echo "recycle creates folder with current datetime in ~/.recycle_bin and moves specified file there"
        return
    fi

    recycleDir=~/.recycle_bin/$(date +%Y%m%d_%H%M%S)

    mkdir $recycleDir
    mv $1 $recycleDir/
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
# Miscellanious

# Disable start/stop terminal signals for ctrl+s usage
stty -ixon

####################################################################################################
# Custom profile

if [ -f $HOME/.profile_custom ]; then
    . $HOME/.profile_custom
fi

