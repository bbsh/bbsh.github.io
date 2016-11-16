#!/bin/bash -e

echo -n "Sudoer login (default: 'test'):"
read $SUDOER_LOGIN
echo -n "Sudoer password (default: 'test')"
read -s $SUDOER_PASSWORD
echo
echo -n "WWW password (default: 'www')"
read -s $WWW_PASSWORD
echo

if [ -z "$SUDOER_LOGIN" ]
then
  SUDOER_LOGIN=test
fi

if [ -z "$SUDOER_PASSWORD" ]
then
  SUDOER_PASSWORD=test
fi

if [ -z "$WWW_PASSWORD" ]
then
  WWW_PASSWORD=www
fi

echo "Create user '$SUDOER_LOGIN'..."
sudo userdel -rf $SUDOER_LOGIN &> /dev/null || true
sudo useradd -m $SUDOER_LOGIN -s /bin/bash -p $(openssl passwd -1 $SUDOER_PASSWORD)

echo "Add to sudoers..."
SUDOER_RECORD="$SUDOER_LOGIN    ALL=(ALL:ALL) ALL"
if ! sudo grep -Fxq "$SUDOER_RECORD" /etc/sudoers
then
  echo -e "\n$SUDOER_RECORD\n" | sudo tee --append /etc/sudoers
fi
