#!/bin/bash
set -eo pipefail


######################
# Validate arguments #
######################
GIT_LOCATION=$1
BACKUP_ROOT=$2

function usage()
{
  echo "Usage: gitbackup.sh GIT_LOCATION BACKUP_ROOT"
}

if [ -z "$GIT_LOCATION" ] || [ -z "$BACKUP_ROOT" ]; then
  usage
  exit 1
fi

if [ ! -d $GIT_LOCATION ] || [ ! -d $BACKUP_ROOT ]; then
  usage
  exit 2
fi


##################
# Perform backup #
##################

CURRENT_DATE=`date +%Y-%m-%d-%H-%M-%S`
BACKUP_LOCATION="$BACKUP_ROOT/$CURRENT_DATE"

mkdir $BACKUP_LOCATION

pushd $GIT_LOCATION

# Get the HEAD log message, so we know where these changes came from
git log -1 HEAD > "$BACKUP_LOCATION"/HEAD.log

# Write out a diff of any changes
git diff > "$BACKUP_LOCATION"/diff

# Tar up any untracked files, so that they can retain their full path
git ls-files --others --exclude-standard | \
  tar -cvf "$BACKUP_LOCATION"/untracked.tar -T -
