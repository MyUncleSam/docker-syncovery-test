#!/bin/bash

# initialize trap to forceful stop the bot
trap terminator SIGHUP SIGINT SIGQUIT SIGTERM
function terminator() {
  echo
  echo "Stopping Syncovery $child..."
  kill -TERM "$child" 2>/dev/null
  stop
  echo "Exiting."
}

function stop() {
  /syncovery/SyncoveryRS stop
  /syncovery/SyncoveryGuardian stop
  /syncovery/SyncoveryCL stop
}

function start() {
  echo "OS Date: $(date)"
  mkdir -p ${SYNCOVERY_HOME}/.Syncovery
  touch ${SYNCOVERY_HOME}/.Syncovery/WebGUI.log
  
  echo "Starting Syncovery"
  /syncovery/SyncoveryCL start

  # do not start guardian as it seems to be started from SyncoveryCL
  #echo "Starting Guardian"
  #/syncovery/SyncoveryGuardian start

  echo "Starting RemoteService"
  /syncovery/SyncoveryRS start
}

echo "Starting gosbot server"
start
tail -f ${SYNCOVERY_HOME}/.Syncovery/WebGUI.log &

child=$!
wait "$child"