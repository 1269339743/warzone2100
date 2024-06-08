#!/bin/sh

# Expects input of $1 base file and $2 .po file

diff -q --ignore-trailing-space --ignore-blank-lines \
     --ignore-matching-lines='^# .*' \
     --ignore-matching-lines='^#$' \
     --ignore-matching-lines='^#, fuzzy$' \
     --ignore-matching-lines='^".*\:.*"' \
     "$1" "$2" &>/dev/null
result=$?

if [ $result -eq 0 ]; then
  printf '%s\0' "$2"
fi
  
exit 0
