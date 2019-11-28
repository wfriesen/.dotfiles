#!/bin/bash
set -eo pipefail

mvn "$@" | sed 's#\] /\([A-Z]\):#\] /\1#g'
