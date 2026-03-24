# Start sway automatically on tty1 for non-SSH sessions
if [[ -z "$DISPLAY" && "$(tty)" == /dev/tty1 && -z "$SSH_CONNECTION" ]]; then
  exec sway
fi
