# Set up the prompt

autoload -Uz promptinit
promptinit
prompt bart

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# history configuration settings
## share history across terminals an old command from the history file
## if it is a duplicate of the command just entered (only the most recent 
## execution of the command will show in history
setopt histignorealldups sharehistory
