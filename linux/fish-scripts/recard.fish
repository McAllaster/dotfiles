function recard --description "Restart smartcard daemon & gpg agent"
  sudo systemctl restart pcscd.service
  sudo systemctl restart pcscd.socket
  sudo pkill -9 scdaemon
  gpg-connect-agent reloadagent /bye
end
