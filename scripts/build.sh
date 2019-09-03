#!/bin/bash

echo 'Building'

set -o pipefail | xcodebuild -project RNAlertController.xcodeproj -scheme RNAlertController -configuration Release -sdk iphonesimulator CONFIGURATION_BUILD_DIR=builds clean build | xcpretty -c

ARTIFACT=builds/RNAlertController.framework

if test -f $ARTIFACT; then
    echo $ARTIFACT
    echo 'Compressing'
else
    exit(1)
fi