autoload -Uz compinit && compinit

# Promt
#PS1="%1~ %# "

# ssh bitbucket
ssh-add -K ~/.ssh/mykey &> /dev/null

# Git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
# PROMPT=\$vcs_info_msg_0_'%# '
zstyle ':vcs_info:git:*' formats '%b'

# Autosuggenstions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
