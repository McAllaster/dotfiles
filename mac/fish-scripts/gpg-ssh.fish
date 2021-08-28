# Start/re-use agent
gpgconf --launch gpg-agent

# Use GPG's SSH agent socket for SSH auth
set -e SSH_AUTH_SOCK
set -x SSH_AUTH_SOCK "$HOME/.gnupg/S.gpg-agent.ssh"
