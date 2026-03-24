#!/usr/bin/env bash
set -euo pipefail

# Locales/timezone for live environment
ln -sf /usr/share/zoneinfo/UTC /etc/localtime
hwclock --systohc || true

echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen
locale-gen

echo 'LANG=en_US.UTF-8' > /etc/locale.conf
echo 'silentium' > /etc/hostname

# Root account policy in live ISO
passwd -d root

# Ensure required services are enabled in the live system
systemctl enable NetworkManager.service
systemctl enable sshd.service
systemctl enable nftables.service
systemctl enable dnscrypt-proxy.service
systemctl enable xray.service
systemctl enable apparmor.service
systemctl enable bluetooth.service

# Prepare clamav database dir (live users run freshclam on demand)
install -d -m 0755 /var/lib/clamav

# Make sure wrapper is used by default in shell aliases for root
if ! grep -q "alias pacman='spacman'" /root/.bashrc 2>/dev/null; then
  echo "alias pacman='spacman'" >> /root/.bashrc
fi

# Create live user with sway defaults
useradd -m -G wheel,audio,video,network -s /bin/bash liveuser || true
echo 'liveuser:live' | chpasswd
install -d -m 0700 -o liveuser -g liveuser /home/liveuser
cp -a /etc/skel/. /home/liveuser/
chown -R liveuser:liveuser /home/liveuser

# Passwordless sudo in live session for installer convenience
cat > /etc/sudoers.d/00-live <<'SUDOEOF'
%wheel ALL=(ALL:ALL) NOPASSWD: ALL
SUDOEOF
chmod 0440 /etc/sudoers.d/00-live
