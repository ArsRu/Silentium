# Silentium ISO Profile

Профиль `mkarchiso` для сборки live ISO дистрибутива Silentium (Arch Linux + linux-zen).

## Сборка
1. Установите зависимости:
   ```bash
   sudo pacman -S --needed archiso
   ```
2. Запустите сборку:
   ```bash
   ./scripts/build.sh
   ```
3. Готовый ISO появится в `./out/`.

## Тест загрузки
```bash
qemu-system-x86_64 -m 4096 -enable-kvm -cdrom out/<iso-file>.iso
```

## Установка
В live-сессии запустите:
```bash
silentium-installer
```
(минимальный curses-интерфейс с пошаговыми действиями).
