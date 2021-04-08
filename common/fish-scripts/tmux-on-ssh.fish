if set -q SSH_TTY; and not set -q TMUX
  tmux new-session -A -s ssh
end
