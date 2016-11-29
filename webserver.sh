#!/bin/bash -e

echo -n "Domain name (default: 'test.www'): "
read $DOMAIN_NAME

if [ -z "$DOMAIN_NAME" ]
then
  DOMAIN_NAME="test.www"
fi
