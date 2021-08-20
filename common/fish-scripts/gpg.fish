# Export the current session's TTY as the GPG TTY
# This allows for things like Git commit signing
# with GPG from the CLI, not relying on a GUI.

set -x GPG_TTY (tty)
gpg-connect-agent updatestartuptty /bye 2>&1 >/dev/null
