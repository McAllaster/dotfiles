if set -q SSH_TTY
  tmux new-session -A -s ssh
end
