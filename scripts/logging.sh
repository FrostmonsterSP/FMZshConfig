#!/bin/bash

# Logging script

sn=1 # String counter

# Log function
log () {
    if [ -d .log/ ]; then
        NST=""
        MSGTYPE="$2: "
        case "$2" in
            "er") MSGTYPE="ERROR: ";;
            "cr") MSGTYPE="CRITICAL: ";;
            "n") NST="\n"; MSGTYPE="";;
            "") MSGTYPE="";;
        esac
    echo -e "$NST $(date +"%Y:%j:%H:%M:%S") $sn:   $MSGTYPE$1" >> "$logfile"
    sn=$((sn+1))
    fi
}

# Log initialization
loginit () {
    if ! [ -d .log/ ]; then mkdir .log/; fi
    logfile=".log/$(date +"%Y.%j.%H.%M.%S")${0//'./'/_}.log"
    log "Logfile have been initialized"
}

# Script logging start
logstart () {
    loginit
    log "${0//'./'/_} started" "n"
}