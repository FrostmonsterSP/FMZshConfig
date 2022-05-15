#!/bin/bash

####################################################
## Cheking settings updates in GitHub repo script ##
####################################################

# Booleans for started parameters
LOGSTATUS=true
ECHO=true
RUN=true

#Help info
schelp () { printf "FROST MONSTER\'S ZSH SETTINGS UPDATE CHECKING TOOL\n-------------------------------------------------\nThis script checks updates for my own zsh settings from my GitHub repository\n\n\nThis script's syntax: SCRIPT [PARAMETERS], where \"parameters\" mean:\n\n                \"l\": Disables logging to file. Removing \"logging.sh\" also disables logging\n                \"e\": Turns off messages to the console\n                \"r\": Disables independent script execution. Required when calling this script from another\n                \"h\": Shows this message\n"; exit 0; }

# General log function; input is 1) Log Message 2) Message type: Error(er)/Critical(cr)/Line break (n)/Custom
log () {
    if $LOGSTATUS && [ -f ./logging.sh ]; then 
        if ! [ "${LOGSTART//' STARTED'/}" ]; then . ./logging.sh; logstart; LOGSTART="$0 STARTED"; log "Logging status is $LOGSTATUS";fi
        logwrite "$1" "$2"
    fi
}

FETCHING="$(git fetch origin)"; FETCHING=${FETCHING//\n/};if [ "$FETCHING" ];then echo "Не пусто";else echo "Пусто";fi

# Input keys check
for arg in "$@"; do
    if [[ "$arg" == *"l"* ]]; then LOGSTATUS=false; fi
    if [[ "$arg" == *"e"* ]]; then ECHO=false; fi
    if [[ "$arg" == *"r"* ]]; then RUN=false; fi;
    if [[ "$arg" == *"h"* ]]; then schelp; fi;
done

scecho () { if $ECHO; then echo "$1"; fi; } # General echo function, uses in setup script also

updatecheck () {
    true
}

if $RUN; then updatecheck; fi