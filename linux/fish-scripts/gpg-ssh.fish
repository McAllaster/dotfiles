# Use GPG's SSH Agent socket for SSH Authentication
# Note: Normally I would put this in ~/.pam_environment, but Linux-PAM has
# deprecated pem_env reading of the user environment:
# https://github.com/linux-pam/linux-pam/releases/tag/v1.5.0
set -x SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh"
