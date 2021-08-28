# Export the current session's TTY as the GPG TTY
set -x GPG_TTY (tty)
gpg-connect-agent updatestartuptty /bye 2>&1 >/dev/null
