#!/bin/sh
LOCAL=$1
REMOTE=$2
NULL_FILE=/tmp/diffmerge-wrapper-fake-dev-null

if [ ! -f "$NULL_FILE" ]; then
  touch "$NULL_FILE"
fi

if [ "$LOCAL" == '/dev/null' ]; then
  LOCAL=$NULL_FILE
fi
if [ "$REMOTE" == '/dev/null' ]; then
  REMOTE=$NULL_FILE
fi

sgdm "$(cygpath -aw "$LOCAL")" "$(cygpath -aw "$REMOTE")"
