#!/bin/bash

STRING=""
while true; do
  read -s -n1
  STRING="${STRING}${REPLY}"
  echo -n $STRING | base64 -w 0
  echo -n " "
  echo -n $STRING | xxd -p
done

