# Set up the prompt

autoload -Uz promptinit
promptinit
prompt bart

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# history configuration settings
setopt histignorealldups sharehistory
