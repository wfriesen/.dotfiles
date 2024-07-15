#!/bin/bash
set -euo pipefail

DIR="$1"
ISO="$2"

if ! test -d "$DIR"; then
  echo "$DIR is not a directory"
  exit 1;
fi

if test -e "$ISO"; then
  echo "$ISO already exists"
  exit 2;
fi

genisoimage -allow-limited-size -iso-level 4 -l -udf -o "$ISO" "$DIR"
