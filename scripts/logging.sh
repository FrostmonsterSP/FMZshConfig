#!/bin/bash

# Logging script

sn=1 # String counter

# Write a Log string function; reads 1) Message to log, 2) Message type: Error(er)/Critical(cr)/Line break (n)/Custom
logwrite () {
    if [ -d .log/ ]; then
        NST=""
        MSGTYPE="$2: "
        case "$2" in
            "er") MSGTYPE="ERROR: ";;
            "cr") MSGTYPE="CRITICAL: ";;
            "n") NST="\n"; MSGTYPE="";;
            "") MSGTYPE=""
        esac
    echo -e "$NST $(date +"%Y:%j:%H:%M:%S") $sn:   $MSGTYPE$1" >> "$logfile"
    sn=$((sn+1))
    fi
}

# Logging initialization
loginit () {
    if ! [ -d .log/ ]; then mkdir .log/; fi
    logfile=".log/$(date +"%Y.%j.%H.%M.%S")${0//'./'/_}.log"
    logwrite "Logfile have been initialized"
}

# Script logging start; read name of script file
logstart () {
    LOGSTART="$0 STARTED"
    if ! [ -f logfile ]; then loginit; fi
    logwrite "${0//'./'/_} started" "n"
}

# General log script; input is 1) Log Message 2) Message type: Error(er)/Critical(cr)/Line break (n)/Custom
log () {
    if $LOGSTATUS; then
        if ! [ "${LOGSTART//' STARTED'/''}" ]; then logstart; fi
        logwrite "$1" "n"
    fi
}