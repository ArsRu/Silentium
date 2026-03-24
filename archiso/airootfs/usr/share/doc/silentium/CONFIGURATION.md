# Конфигурация Silentium

## VPN
Конфиги Xray хранятся в `/etc/xray/configs/*.json`.

## DNS
Основной конфиг: `/etc/dnscrypt-proxy.toml`.
Блоклист: `/etc/dnscrypt-proxy-oidd.txt`.

## Firewall
- `normal` — интернет доступен всегда
- `strict` — только через VPN-интерфейс `tun0`

```bash
firewall-mode normal
firewall-mode strict
```
