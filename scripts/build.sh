#!/bin/bash

# Xcode Build
echo 'Building'
set -o pipefail | xcodebuild -project RNAlertController.xcodeproj -scheme RNAlertController -configuration Release -sdk iphonesimulator CONFIGURATION_BUILD_DIR=builds clean build | xcpretty -c

# Zip The Framework
echo 'Compressing Artifact'
zip -vr builds/RNAlertController.framework.zip builds/RNAlertController.framework/ -x "*.DS_Store"

# Show Build Artifacts
echo 'Artifacts'
ls builds

# Calculate SHA1 Checksum
echo 'Generating checksum'
shasum -a 1 builds/RNAlertController.framework