#!/bin/sh

NAMESPACE=plex
NAME=plex-media-server

exists=$(helm list -n $NAMESPACE | grep $NAME | wc -l)

COMMAND=install
if [ "$exists" == "1" ]; then
  COMMAND=upgrade
fi

helm $COMMAND \
  -n $NAMESPACE \
  $NAME \
  ./chart \
  -f ./chart/values.yml