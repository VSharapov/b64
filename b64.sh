#!/bin/bash

STRING=""
BACKSPACE="$(echo -n "7f" | xxd -r -p)"
BACKSPACE=""
while true; do
  read -s -n1
  if [[ "$REPLY" == "$BACKSPACE" ]]; then
    STRING="${STRING/%?/}"
  else
    STRING="${STRING}${REPLY}"
  fi
  if [ -z "$STRING" ]; then
    true
  else
    echo -n $STRING | base64 -w 0
    echo -n " "
    echo -n $STRING | xxd -p
  fi
done

