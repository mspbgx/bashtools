#!/usr/bin/env bash


function main {
  if [ -z $1 ]
  then
    echo "Keine URL angegeben!"
    echo "Verwendung: curl-timing.sh <URL>"
    echo "Beispiel: curl-timing.sh http://google.de"
  else
    destination=$1
    curl -w "@curl-timing.txt" -o /dev/null -s "$destination"
  fi

}

main $@
