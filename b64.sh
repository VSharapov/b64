#!/bin/bash

STRING=""
BACKSPACE="$(echo -n "7f" | xxd -r -p)"
BACKSPACE=""
CTRLBACKSPACE=""
while true; do
  # Read input
  read -s -n1

  ## Debug
  #echo
  #echo -ne "$REPLY" | xxd -p

  # Handle newline
  if [[ "$REPLY" == "" ]]; then
    echo
  else
    # Blank out last output
    echo -ne "\r"
    echo -ne "${output}"
    echo -ne "\r"
  fi

  # Handle Backspace 0x7f=[DEL] and Ctrl+Backspace 0x08=[BS]
  # anything else gets appended
  if [[ "$REPLY" == "$BACKSPACE" ]]; then
    STRING="${STRING/%?/}"
  elif [[ "$REPLY" == "$CTRLBACKSPACE" ]]; then
    STRING=""
  else
    STRING="${STRING}${REPLY}"
  fi

  if ! [ -z "$STRING" ]; then
    output=""
    output="${output}$(echo -n $STRING | base64 -w 0)"
    output="${output}$(echo -n " ")"
    output="${output}$(echo -n $STRING | xxd -p -c 99999 | tr -d '\n')"
    echo -ne "${output}"
    # Prep spaces for blanking-out
    output="${output//?/ }"
  fi
done

