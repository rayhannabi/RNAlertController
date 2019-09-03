#!/bin/bash

echo 'Building'

set -o pipefail | xcodebuild -project RNAlertController.xcodeproj -scheme RNAlertController -configuration Release -sdk iphonesimulator CONFIGURATION_BUILD_DIR=builds clean build | xcpretty -c

ARTIFACT=builds/RNAlertController.framework

if test -f $ARTIFACT; then
    echo $ARTIFACT
    echo 'Compressing'
    zip -vr RNAlertController.framework.zip RNAlertController.framework/ -x "*.DS_Store"
    ls -al builds
else
    exit()
fi