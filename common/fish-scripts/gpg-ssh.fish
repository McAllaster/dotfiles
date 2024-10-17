# Use GPG's SSH Agent socket for SSH Authentication
if status is-interactive
	set -x SSH_AGENT_PID ""
	set -x GPG_TTY (tty)
	set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
	gpgconf --launch gpg-agent
end
