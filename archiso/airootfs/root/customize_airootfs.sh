#!/usr/bin/env bash
set -euo pipefail

echo "[silentium] Applying live-image customization..."

ln -sf /usr/share/zoneinfo/UTC /etc/localtime
hwclock --systohc || true
sed -i 's/^#en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen
locale-gen
printf 'LANG=en_US.UTF-8\n' > /etc/locale.conf
printf 'KEYMAP=us\n' > /etc/vconsole.conf
printf 'silentium\n' > /etc/hostname

# NetworkManager + privacy services
systemctl enable NetworkManager.service
systemctl enable xray.service
systemctl enable dnscrypt-proxy.service
systemctl enable nftables.service
systemctl enable apparmor.service

# ClamAV on-demand setup
freshclam --quiet || true

# Firewall mode defaults to normal.
mkdir -p /etc/silentium
printf 'normal\n' > /etc/silentium/firewall.mode

# dnscrypt dirs
mkdir -p /var/cache/dnscrypt-proxy /var/log/dnscrypt-proxy
chown -R nobody:nobody /var/cache/dnscrypt-proxy /var/log/dnscrypt-proxy || true

# Sway defaults for newly created users.
install -d -m 0755 /etc/sway/config.d

echo "[silentium] Done."
