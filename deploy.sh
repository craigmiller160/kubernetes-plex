#!/bin/sh

NAMESPACE=plex
NAME=plex-media-server

exists=$(helm list -n $NAMESPACE | grep $NAME | wc -l)

COMMAND=install
if [ "$exists" -eq "1" ]; then
  COMMAND=upgrade
fi

kubectl create ns plex 2>/dev/null
if [ $? -ne 0 ]; then
  echo "namespace/plex already exists"
fi

helm $COMMAND \
  -n $NAMESPACE \
  $NAME \
  ./chart \
  -f ./chart/values.yml