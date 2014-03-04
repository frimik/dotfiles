#!/bin/sh
#
# usage: retrieve-cert.sh remote.host.name [port]
#
REMHOST=$1
REMPORT=${2:-443}

echo |\
openssl s_client -showcerts -connect ${REMHOST}:${REMPORT} 2>/dev/null | grep "^[ ]"
