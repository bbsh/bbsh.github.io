#!/bin/bash -e

SCRIPTS="users.sh apt.sh"

for SCRIPT in $SCRIPTS
do
  if [ -n "$1" ] && [ "$1.sh" != "$SCRIPT" ]
  then
    continue
  fi
  curl -sSfL "https://bbsh.github.io/$SCRIPT" -o "$SCRIPT"
  chmod +x $SCRIPT
  ./$SCRIPT < /dev/tty
  rm $SCRIPT
done
