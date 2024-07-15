# Use GPG's SSH Agent socket for SSH Authentication
set -x SSH_AGENT_PID ""
set -x SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh"
