#!/bin/bash

echo 'Building'

set -o pipefail | xcodebuild -project RNAlertController.xcodeproj -scheme RNAlertController -configuration Release -sdk iphonesimulator CONFIGURATION_BUILD_DIR=builds clean build | xcpretty -c

ls -al builds