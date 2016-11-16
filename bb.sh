#!/bin/bash -e

SCRIPTS="users.sh software.sh"

for SCRIPT in $SCRIPTS
do
  wget "https://bbsh.github.io/$SCRIPT"
  chmod +x $SCRIPT
  ./$SCRIPT
  rm $SCRIPT
done
