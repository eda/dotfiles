# users generic .zshrc file for zsh(1)

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8

## Default shell configuration
#
# set prompt
#
autoload colors
colors
#case ${UID} in
# 0)
#   PROMPT="%B%{${fg[red]}%}%/#%{${reset_color}%}%b "
#   PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
#   SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
#   [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
#     PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
#   ;;
# *)
#   PROMPT="%{${fg[red]}%}%/%%%{${reset_color}%} "
#   PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
#   SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
#   [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
#     PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
#   ;;
# esac

# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep

## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a goes to head of a line and Ctrl-e goes
# to end of it)
#
bindkey -e

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups # ignore duplication command history list
setopt share_history # share command history data

## Completion configuration
#
autoload -U compinit
compinit

## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases # aliased ls needs if file/dir completions work

alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -G -w"
  ;;
linux*)
  alias ls="ls --color"
  ;;
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

alias su="su -l"

## terminal configuration
#
unset LSCOLORS
case "${TERM}" in
xterm|screen*)
  export TERM=xterm-color
  ;;
kterm)
  export TERM=kterm-color
  # set BackSpace control character
  stty erase
  ;;
cons25)
  unset LANG
  export LSCOLORS=ExFxCxdxBxegedabagacad
  export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors \
    'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
  ;;
esac

# set terminal title including current directory
#
case "${TERM}" in
kterm*|xterm*|screen*)
  precmd() {
    echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
  }
  export LSCOLORS=exfxcxdxbxegedabagacad
  export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors \
    'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
  ;;
esac

# screenのウィンドウ・タイトルに実行したコマンド名を出す（sudoでもよさげに）
# http://teq.g.hatena.ne.jp/aereal/20100709/1278662144
case "${TERM}" in
    screen*)
	emulate -L zsh
	local -a cmd
	cmd=(${(z)2})
	case $cmd[2] in
	    fg)
		if (( $#cmd == 1)); then
		    cmd=(builtin jobs -l %+)
		else
		    cmd=(builtin jobs -l $cmd[2])
		fi
		;;
	    %*)
		cmd=(builtin jobs -l $cmd[1])
		;;
	    cd)
		if (( $#cmd == 2 )); then
		    cmd[1]=$cmd[2]
		fi
		;;
	    ls|clear)
		echo -n "k$ZSH_NAME\\"
		return
		;;
	    sudo) # http://teq.g.hatena.ne.jp/aereal/20100709/1278662144
		echo -n "k$cmd[1] $cmd[2]:t\\"
		return
		;;
	    screen|pwd)
		return
		;;
	    *)
		echo -n "k$cmd[1]:t\\"
		return
		;;
	esac
	local -A jt
	jt=(${(kv)jobtexts})
	$cmd >>(read num rest
            cmd=(${(z)${(e):-\$jt$num}})
            echo -n "k$cmd[1]:t\\") 2>/dev/null
esac

# zsh で Git の作業コピーに変更があるかどうかをプロンプトに表示する方法
# http://d.hatena.ne.jp/mollifier/20100906/p1
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
autoload -Uz is-at-least
if is-at-least 4.3.10; then
  # この check-for-changes が今回の設定するところ
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "+"    # 適当な文字列に変更する
  zstyle ':vcs_info:git:*' unstagedstr "-"  # 適当の文字列に変更する
  zstyle ':vcs_info:git:*' formats '(%s)-[%b] %c%u'
  zstyle ':vcs_info:git:*' actionformats '(%s)-[%b|%a] %c%u'
fi
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
    RPROMPT=$'%{\e[32m%}%~'${vcs_info_msg_0_}$'%{\e[m%}'
}
PROMPT=$'%{\e[31m%}%n@%M %{\e[33m%}%* %# %{\e[m%}'

# ssh したときに新しいウィンドウを開いてそこで ssh して、ウィンドウ名をログイン先のホスト名に自動的に名付けてくれます。
# http://d.hatena.ne.jp/naoya/20051223/1135351050
function ssh_screen(){
 eval server=?${$#}
 screen -t $server ssh "$@"
}
if [ x$TERM = xscreen ]; then
  alias ssh=ssh_screen
fi

# Screen Ctrl-Sでロックされるのを防ぐ
stty -ixon
stty stop undef

## Load user .zshrc configuration file
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm


