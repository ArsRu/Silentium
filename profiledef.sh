#!/usr/bin/env bash

# shellcheck disable=SC2034
iso_name="silentium"
# shellcheck disable=SC2034
iso_label="SILENTIUM_$(date +%Y%m)"
# shellcheck disable=SC2034
iso_publisher="Silentium Project <https://silentium.local>"
# shellcheck disable=SC2034
iso_application="Silentium Live/Rescue ISO"
# shellcheck disable=SC2034
iso_version="1.0.0"
# shellcheck disable=SC2034
install_dir="arch"
# shellcheck disable=SC2034
buildmodes=('iso')
# shellcheck disable=SC2034
bootmodes=(
  'bios.syslinux.mbr'
  'bios.syslinux.eltorito'
  'uefi-ia32.grub.esp'
  'uefi-x64.grub.esp'
  'uefi-x64.grub.eltorito'
)
# shellcheck disable=SC2034
arch="x86_64"
# shellcheck disable=SC2034
pacman_conf="pacman.conf"
# shellcheck disable=SC2034
airootfs_image_type="squashfs"
# shellcheck disable=SC2034
airootfs_image_tool_options=('-comp' 'zstd' '-Xcompression-level' '19')
# shellcheck disable=SC2034
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"
  ["/root/customize_airootfs.sh"]="0:0:755"
  ["/usr/bin/spacman"]="0:0:755"
  ["/usr/bin/vpn-connect"]="0:0:755"
  ["/usr/bin/firewall-mode"]="0:0:755"
  ["/usr/bin/silentium-installer"]="0:0:755"
)
