#!/bin/zsh

# Initializig message
if [[ -z "$TERM_PROGRAM" ]] {
    neofetch
} else {
    printf "\e[32m❯ \e[37;41m \e[0m \e[31m$(lsb_release -sd)\e[0m\n"
}
printf "\n"
if [[ "$USER" == "root" ]] {
   USERMSG="\e[30;41m☠$USER:u TERMINAL SESSION INITIALIZED \e[0m\n"
} else {
    USERMSG="\e[32m❯ Terminal session initialized at \e[1;32m$USER\e[1;33m@\e[1;32m$HOST\e[0m\n"
}
printf "$USERMSG\n"