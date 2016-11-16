#!/bin/bash -e

echo -n "Sudoer login (default: test): "
read SUDOER_LOGIN
echo -n "Sudoer password (default: qwer1234): "
read -s SUDOER_PASSWORD
echo
echo -n "WWW Password (default: qwer1234): "
read -s WWW_PASSWORD
echo

if [ -z $SUDOER_LOGIN ]
then
  SUDOER_LOGIN=test
fi

if [ -z $SUDOER_PASSWORD ]
then
  SUDOER_PASSWORD=qwer1234
fi

if [ -z $WWW_PASSWORD ]
then
  WWW_PASSWORD=qwer1234
fi

sudo userdel -rf $SUDOER_LOGIN &> /dev/null || true
sudo useradd -m $SUDOER_LOGIN -s "/bin/bash" -p $(echo "$SUDOER_PASSWORD" | openssl passwd -1 -stdin)

echo "Add new superuser to sudoers..."
SUDOERS_RECORD="$SUDOER_LOGIN    ALL=(ALL:ALL) ALL"
if ! sudo grep -Fxq "$SUDOERS_RECORD" /etc/sudoers
then
  echo -e "\n$SUDOERS_RECORD\n" | sudo tee --append /etc/sudoers > /dev/null
fi

sudo apt update
sudo apt upgrade -y
