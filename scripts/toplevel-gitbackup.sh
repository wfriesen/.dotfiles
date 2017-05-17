#!/bin/bash
set -eo pipefail


GIT_LOCATION=$1
BACKUP_LOCATION=$2

function usage()
{
  echo "Usage: toplevel-gitbackup.sh GIT_LOCATION BACKUP_LOCATION"
}

if [ -z "$GIT_LOCATION" ] || [ -z "$BACKUP_LOCATION" ]; then
  usage
  exit 1
fi

if [ ! -d $GIT_LOCATION ] || [ ! -d $BACKUP_LOCATION ]; then
  usage
  exit 2
fi

GIT_LOCATION=`realpath "$GIT_LOCATION"`
BACKUP_LOCATION=`realpath "$BACKUP_LOCATION"`
GIT_LOCATION_LENGTH=`echo "$GIT_LOCATION" | wc -c`

for repo in `
  find $GIT_LOCATION -type d -name ".git" \
  | sed -e "s/\.git\$//g"
`; do
  REPO_BACKUP_NAME=`echo "$repo" \
    | cut -c$GIT_LOCATION_LENGTH- \
    | sed -e "s/^\///g" -e "s/\/\$//g" \
    | tr "/" "-"`
  REPO_BACKUP_LOCATION=$BACKUP_LOCATION/$REPO_BACKUP_NAME
  if [ ! -d $REPO_BACKUP_LOCATION ]; then
    mkdir $REPO_BACKUP_LOCATION
  fi
  ~/scripts/gitbackup.sh backup $repo $REPO_BACKUP_LOCATION
done
