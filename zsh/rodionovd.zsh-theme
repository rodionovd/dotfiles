# My custom variation of the Bureau Theme


### Git [*# master]

ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_STAGED="%{$FG[118]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STASHED="%{$FG[011]%}#%{$reset_color%}"

bureau_git_info () {
  local ref
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  echo "${ref#refs/heads/}"
}

bureau_git_status() {
  local result gitstatus
  gitstatus="$(command git status --porcelain -b 2>/dev/null)"

  # check if there are dirty files
  local gitfiles="$(tail -n +2 <<< "$gitstatus")"
  if [[ -n "$gitfiles" ]]; then
      result+="$ZSH_THEME_GIT_PROMPT_STAGED"
  fi

  # check if there are stashed changes
  if command git rev-parse --verify refs/stash &> /dev/null; then
    result+="$ZSH_THEME_GIT_PROMPT_STASHED"
  fi

  echo $result
}

bureau_git_prompt() {
  # check git information
  local gitinfo=$(bureau_git_info)
  if [[ -z "$gitinfo" ]]; then
    return
  fi

  # quote % in git information
  local output="${gitinfo:gs/%/%%}"

  # check git status
  local gitstatus=$(bureau_git_status)
  if [[ -n "$gitstatus" ]]; then
    output="$gitstatus %{$fg_bold[white]%}$output%{$reset_color%}"
  fi

  echo "${ZSH_THEME_GIT_PROMPT_PREFIX}${output}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}


_PATH="%{$FG[186]%}%~%{$reset_color%}"

if [[ $EUID -eq 0 ]]; then
  _USERNAME="%{$fg_bold[red]%}%n"
  _LIBERTY="%{$fg[red]%}#"
else
  _USERNAME="%{$fg_bold[white]%}%n"
  _LIBERTY="%{$fg[green]%}₴"
fi
_USERNAME="$_USERNAME%{$reset_color%}@%m"
_LIBERTY="$_LIBERTY%{$reset_color%}"


get_space () {
  local STR=$1$2
  local zero='%([BSUbfksu]|([FB]|){*})'
  local LENGTH=${#${(S%%)STR//$~zero/}}
  local SPACES=$(( COLUMNS - LENGTH - ${ZLE_RPROMPT_INDENT:-1} ))

  (( SPACES > 0 )) || return
  printf ' %.0s' {1..$SPACES}
}

if [[ $(hostname) =~ ".local" ]]; then
  _1LEFT="$_PATH"
else
  _1LEFT="$_USERNAME $_PATH"
fi
_1RIGHT="%*"

bureau_precmd () {
  _1SPACES=`get_space $_1LEFT $_1RIGHT`
  print -rP "$_1LEFT$_1SPACES$_1RIGHT"
}

setopt prompt_subst
PROMPT='$_LIBERTY '
RPROMPT='$(bureau_git_prompt)'

autoload -U add-zsh-hook
add-zsh-hook precmd bureau_precmd
