#!/usr/bin/env bash

sudo pacman -Sy ibus-m17n

sudo cp ./bn-bijoyClassic.png /usr/share/m17n/icons
sudo cp ./bn-bijoyUnicode.png /usr/share/m17n/icons
sudo cp ./bn-bijoyClassic.mim /usr/share/m17n
sudo cp ./bn-bijoyUnicode.mim /usr/share/m17n

sudo cp -r ./fonts/* /usr/share/fonts

if [[ ! -d /etc/pacman.d/hooks ]]; then
    sudo mkdir /etc/pacman.d/hooks
fi
if [[ ! -d /etc/pacman.d/hooks.bin ]]; then
    sudo mkdir /etc/pacman.d/hooks.bin
fi
sudo cp ./bijoy_bayanno.hook /etc/pacman.d/hooks
sudo cp ./bijoy_bayanno.sh /etc/pacman.d/hooks.bin
sudo cp ./m17n-db.list /etc/pacman.d/hooks.bin
sudo chmod +x /etc/pacman.d/hooks/bijoy_bayanno.hook
sudo chmod +x /etc/pacman.d/hooks.bin/bijoy_bayanno.sh

sudo chmod 666 "/var/lib/pacman/local/$(pacman -Qn m17n-db | tr ' ' '-')/files"
sudo cat ./m17n-db.list >> "/var/lib/pacman/local/$(pacman -Qn m17n-db | tr ' ' '-')/files"
sudo chmod 644 "/var/lib/pacman/local/$(pacman -Qn m17n-db | tr ' ' '-')/files"
