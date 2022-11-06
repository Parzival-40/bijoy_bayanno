#!/usr/bin/env bash

sudo chmod 666 "/var/lib/pacman/local/$(pacamn -Qn m17n-db | tr ' ' '-')/files"
sudo cat ./m17n-db.list >> "/var/lib/pacman/local/$(pacman -Qn m17n-db | tr ' ' '-')/files"
sudo chmod 644 "/var/lib/pacman/local/$(pacamn -Qn m17n-db | tr ' ' '-')/files"
