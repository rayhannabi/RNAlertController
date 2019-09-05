#!/bin/bash

# Xcode Build
echo 
echo 'Building'
printf -- '-%.0s' {1..100}; echo
set -o pipefail | xcodebuild -project RNAlertController.xcodeproj -scheme RNAlertController -configuration Release -sdk iphonesimulator CONFIGURATION_BUILD_DIR=builds clean build | xcpretty -c

# Zip The Framework
echo
echo 'Compressing Artifact'
printf -- '-%.0s' {1..100}; echo
zip -vr builds/RNAlertController.framework.zip builds/RNAlertController.framework/ -x "*.DS_Store"

# Calculate SHA1 Checksum
echo
echo 'Generating checksum'
shasum -ba 1 builds/RNAlertController.framework.zip > builds/RNAlertController.framework.zip.sha1

# Show Build Artifacts
echo
echo 'Artifacts'
printf -- '-%.0s' {1..50}; echo
ls -G builds