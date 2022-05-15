#!/bin/bash

exiterror () { echo -e "\e[1;31mERROR:\e[0m $1"; exit 1; }

userlinks () { chmod +x -R /usr/share/zsh/core; }

clone () { git clone --recursive https://github.com/FrostmonsterSP/FMZshConfig.git /usr/share/zsh/core; }

upgrade () { cd /usr/share/zsh/core || return; git fetch; git pull --recurse-submodules; }

if [[ $EUID -ne 0 ]]; then exiterror "Требуются права администратора, запусти из-под \"sudo\""; fi

if ! [ -d /usr/share/zsh/core ]
    then clone
    else upgrade
fi

if ! [ -f /home/@/.zshrc ];
    then echo "Файлы есть"
    else echo "Файлов нет"
fi