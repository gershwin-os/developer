#!/bin/sh

# Exit immediately if any command exits with a non-zero status
set -e

# Determine number of CPUs when building
CPUS=$(nproc)
export GNUSTEP_INSTALLATION_DOMAIN=NETWORK
. /Developer/Makefiles/GNUstep.sh

if [ -f "/__w/developer/developer/system_amd64.zip" ]; then
  export SRC="/__w/developer/developer//"
fi

if [ -f "/home/runner/work/developer/developer/system_arm64.zip" ]; then
  export SRC="/home/runner/work/developer/developer/"  
fi

cd ${SRC}/apps-gorm && gmake -j"${CPUS}" || exit 1 && gmake install
cd ${SRC}/apps-projectcenter && gmake -j"${CPUS}" || exit 1 || exit 1 && gmake install