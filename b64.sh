#!/bin/bash

while true; do
  read -s -n1
  echo -n $REPLY | base64 -w 0
  echo -n " "
  echo -n $REPLY | xxd -p
done

