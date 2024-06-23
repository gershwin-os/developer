#!/bin/sh

# Exit immediately if any command exits with a non-zero status
set -e

# Ensure that submodules have been checked out
git submodule update --init --recursive

# Determine number of CPUs when building
CPUS=$(nproc)
export GNUSTEP_INSTALLATION_DOMAIN=NETWORK
. /Developer/Makefiles/GNUstep.sh

# Initialize WORKDIR to empty (if not already set)
export WORKDIR=""

# Detect whether or not GitHub actions is being used
if [ -d "/__w/developer/developer/" ]; then
  echo "GH actions AMD64 runner detected"
  export WORKDIR="/__w/developer/developer/"
fi

if [ -d "/home/runner/work/developer/developer/" ]; then
  echo "GH actions ARM64 runner detected"
  export WORKDIR="/home/runner/work/developer/developer/"
fi

if [ -z "$WORKDIR" ]; then
  echo "WORKDIR is empty, setting it to current working directory"
  WORKDIR="$PWD"
fi

echo "WORKDIR is set to: $WORKDIR"

cd ${WORKDIR}/apps-gorm && gmake -j"${CPUS}" || exit 1 && gmake install
cd ${WORKDIR}/apps-projectcenter && gmake -j"${CPUS}" || exit 1 || exit 1 && gmake install