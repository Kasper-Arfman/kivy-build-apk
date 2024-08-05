#!/bin/bash
set -e

# Run Buildozer
yes | buildozer -v android debug

# Exit
exit 0