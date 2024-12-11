#!/usr/bin/env bash

set -euo pipefail

cd /home/roozbeh/proj/connectivity || {
    echo "cannot find connectivity dir"
    exit 1
}

XRAY_LOCATION_ASSET="./routing" xray -c ./routing/router.json
