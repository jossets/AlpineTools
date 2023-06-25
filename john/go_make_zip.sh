#!/bin/sh 

echo "#########################"
echo "## Make zip"

JOHN_DIR="/opt/john-1.9.0-jumbo-1"

zip -r john-alpine-cpuonly.zip "$JOHN_DIR/src"