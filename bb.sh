#!/bin/bash -e

SCRIPTS="users.sh software.sh"

for SCRIPT in $SCRIPTS
do
  curl -sSfL "https://bbsh.github.io/$SCRIPT" -o "$SCRIPT"
  chmod +x $SCRIPT
  ./$SCRIPT < /dev/tty
  rm $SCRIPT
done
