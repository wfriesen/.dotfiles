#!/usr/bin/zsh

BACKUP_DIRECTORY=$1

if [ -z $BACKUP_DIRECTORY ]; then
  echo "Pass a backup directory as argument"
  exit 1;
fi

awk '$1 != prev {print $3, $1} {prev=$1}' <(for i in $(find $BACKUP_DIRECTORY -mindepth 1 -maxdepth 1 -type d); echo $(md5sum $i/* | awk '{print $1}' | md5sum) $i)
