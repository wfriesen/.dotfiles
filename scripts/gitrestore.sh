#!/bin/bash
set -eo pipefail


######################
# Validate arguments #
######################
GIT_LOCATION=$1
BACKUP_LOCATION=$2

function usage()
{
  echo "Usage: gitrestore.sh GIT_LOCATION BACKUP_LOCATION"
}

if [ -z "$GIT_LOCATION" ] || [ -z "$BACKUP_LOCATION" ]; then
  usage
  exit 1
fi

if [ ! -d $GIT_LOCATION ] || [ ! -d $BACKUP_LOCATION ]; then
  usage
  exit 2
fi


########################
# Restore backup files #
########################
pushd $GIT_LOCATION

git apply "$BACKUP_LOCATION/diff"
tar xvf "$BACKUP_LOCATION/untracked.tar"

popd
