autoload -Uz compinit && compinit

VIM="nvim"

# Enable vi mode
bindkey -v
export KEYTIMEOUT=1

# Promt
PS1="%1~ %# "

# Git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
# PROMPT=\$vcs_info_msg_0_'%# '
zstyle ':vcs_info:git:*' formats '%b'

# Autosuggenstions
# Manually installed with: 
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH="$HOME/.local/bin:$PATH"

bindkey -s ^f "tmux-sessionizer\n"
