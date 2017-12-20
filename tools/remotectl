#!/usr/bin/env bash




function remotecommand {
  ssh $destination $command
}

function checkconnection {
  if ssh $1 exit > /dev/null 2>&1; then
    remotecommand
  else
    echo "FAILED: connection test => starting error detection ..."
    echo "-------------------------------------------------------"
    errordetection
  fi
}

function errordetection {
  local packages="ssh scp ping telnet host"
  for pkg in $packages; do
    if command -v $pkg > /dev/null 2>&1; then
      local tmp
    else
      echo "FAILED: $pgk not installed => please install this package!"
      return 1
    fi
  done


  if ping -c2 $host > /dev/null 2>&1; then
    echo "OK: ping"
  else
    echo "FAILED: ping => host unreachable"
    if host $host > /dev/null 2>&1; then
      echo "FAILED: route or firewall => no route or blocked by firewall"
      return 1
    else
      echo "FAILED: host or dns => host not exist or unknown hostname"
      return 1
    fi
  fi
  checkport=$((echo "quit" | telnet $host 22 | grep "Escape character is") > /dev/null 2>&1)
  if [ "$?" -eq 0 ]; then
    echo "OK: telnet"
  else
    echo "FAILED: telnet => port unreachable"
    return 1
  fi
  if ssh $1 exit > /dev/null 2>&1; then
    echo "OK: ssh"
  else
    echo "FAILED: ssh => permission denied"
    return 1
  fi
}



function main {
  destination=$1
  command=${@:2}

  if [[ $destination == *"@"* ]]; then
    user=$(echo "$destination" | sed -e 's/\(.*\)\@\(.*\)/\1/')
    host=$(echo "$destination" | sed -e 's/\(.*\)\@\(.*\)/\2/')
  else
    host=$destination
  fi

  checkconnection $destination
}

main $@
