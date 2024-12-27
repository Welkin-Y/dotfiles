# source <(kubectl completion zsh)
autoload -U colors && colors
setopt PROMPT_SUBST

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

show_exit_status() {
  exit_status=$?;
  if [ $exit_status = 0 ]; then
    echo '%F{green}\U25CF'
  else
    echo '%F{red}\U25CF'
  fi
}

export PS1='$(show_exit_status) %F{magenta}%n%F{green}@%F{cyan}%m %F{blue}%~%F{yellow}$(parse_git_branch)%f%% '


# some more ls aliases
alias ll='eza -lahg'
alias l='eza -lhg'
alias la='eza -a'
alias tree='eza -T'
alias lg='ll --git --git-ignore'alias grep='grep --color'
export GPG_TTY=$(tty)

