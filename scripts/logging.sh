#!/bin/bash

# Logging script

i=0 # String counter

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
    echo -e "$NST $(date +"%Y:%j:%H:%M:%S") $i:   $MSGTYPE$1" >> "$logfile"
    i=$((i+1))
    fi
}

# Log initialization
loginit () {
    if ! [ "$logfile" ]; then
        logfile=".log/$(date +"%Y.%j.%H.%M.%S")_$1.log"
        log "Logfile have been initialized"
    else
        log "Logfile already initialized"
    fi
    if ! [ -d .log/ ]; then mkdir .log/; log "Log dir not found" "er"; log "Log dir created"; fi
}

# Script logging start
logstart () {
    loginit "$1";
    log "$1 started" "n"
}