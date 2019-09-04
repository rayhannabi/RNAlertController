#!/bin/bash

echo 
echo 'Testing'
set -o pipefail | xcodebuild -scheme RNAlertController -sdk iphonesimulator -destination name="iPhone Xs" build test | xcpretty -c
