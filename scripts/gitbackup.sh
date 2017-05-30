#!/bin/bash
set -eo pipefail


OPERATION=$1
GIT_LOCATION=$2
BACKUP_LOCATION=$3

function usage()
{
  echo "Usage: gitbackup.sh backup|restore GIT_LOCATION BACKUP_LOCATION"
}

function backup()
{
  CURRENT_DATE=`date +%Y-%m-%d-%H-%M-%S`
  THIS_BACKUP_LOCATION="$BACKUP_LOCATION/$CURRENT_DATE"

  mkdir $THIS_BACKUP_LOCATION

  pushd $GIT_LOCATION

  # Get the HEAD log message, so we know where these changes came from
  git log -1 HEAD > "$THIS_BACKUP_LOCATION"/HEAD.log

  # Tar up all changed files, retaining their full path
  # Get unique paths, since a file may be listed twice if it has both
  # staged and unstaged changes.
  git status --porcelain=v1 | cut -c4- | sort -u | \
    tar -cvf "$THIS_BACKUP_LOCATION"/changedfiles.tar -T -

  popd
}

function restore()
{
  pushd $GIT_LOCATION
  CHANGED_FILES_TAR="$BACKUP_LOCATION/changedfiles.tar"

  if [ ! -f $CHANGED_FILES_TAR ]; then
    usage
    exit 4
  fi

  tar xvf $CHANGED_FILES_TAR

  popd
}


if [ -z "$GIT_LOCATION" ] || [ -z "$BACKUP_LOCATION" ] || [ -z $OPERATION ]; then
  usage
  exit 1
fi

if [ ! -d $GIT_LOCATION ] || [ ! -d $BACKUP_LOCATION ]; then
  usage
  exit 2
fi

if [ $OPERATION = "backup" ]; then
  backup
elif [ $OPERATION = "restore" ]; then
  restore
else
  usage
  exit 3
fi
