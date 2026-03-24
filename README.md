# Silentium (Arch Linux ISO profile)

Готовый профиль `mkarchiso` для сборки live ISO дистрибутива **Silentium**.

## Что включено
- База Arch Linux + ядро `linux-zen`.
- Live-окружение Sway (минимальный набор приложений).
- VPN через Xray (`xray.service`, конфиги в `/etc/xray/configs/`).
- DNS через `dnscrypt-proxy` с подготовкой под OISD.
- Nftables с режимами `normal` и `strict` (`firewall-mode`).
- Обёртка `spacman` с red/yellow политиками пакетов.
- TUI-установщик `/usr/bin/silentium-installer` (python+curses).

## Требования
На системе сборки должен быть установлен пакет `archiso`.

```bash
sudo pacman -S archiso
```

## Сборка ISO
```bash
cd ~/silentium
chmod +x scripts/build.sh
./scripts/build.sh
```

После успешной сборки ISO появится в папке `out/`.

## Запуск live-сессии
- Логин: `liveuser`
- Пароль: `live`
- Root без пароля в live-режиме.

## Использование ключевых утилит

### `spacman`
```bash
spacman -S vim
spacman -S telegram-desktop           # будет заблокирован
spacman -S telegram-desktop --force-dangerous
```

### `vpn-connect`
```bash
sudo vpn-connect
```
Выбирает JSON-конфиг из `/etc/xray/configs/*.json` и перезапускает `xray.service`.

### `firewall-mode`
```bash
sudo firewall-mode status
sudo firewall-mode normal
sudo firewall-mode strict
```

### Установщик
```bash
sudo silentium-installer
```

> Внимание: установщик удаляет данные на выбранном диске.
