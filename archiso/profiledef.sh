#!/usr/bin/env bash

iso_name="silentium"
iso_label="SILENTIUM_$(date +%Y%m)"
iso_publisher="Silentium Project <https://silentium.local>"
iso_application="Silentium Live/Installer ISO"
iso_version="1.0.0"
install_dir="silentium"
buildmodes=('iso')
bootmodes=("bios.grub.mbr" "bios.grub.eltorito" "uefi-x64.grub.esp" "uefi-x64.grub.eltorito")
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
compression="zstd"

# Файлы ядра для linux-zen.
bootstrap_tarball=""
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/usr/bin/spacman"]="0:0:755"
  ["/usr/bin/priv-setup"]="0:0:755"
  ["/usr/bin/vpn-connect"]="0:0:755"
  ["/usr/bin/silentium-update"]="0:0:755"
  ["/usr/bin/silentium-help"]="0:0:755"
  ["/usr/bin/silentium-audit"]="0:0:755"
  ["/usr/bin/firewall-mode"]="0:0:755"
)
