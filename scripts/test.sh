#!/bin/bash

echo 
echo 'Testing'
printf -- '-%.0s' {1..100}; echo
set -o pipefail | xcodebuild -scheme RNAlertController -sdk iphonesimulator -destination name="iPhone Xs" build test | xcpretty -c
