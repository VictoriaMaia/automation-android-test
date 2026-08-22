#!/bin/bash

if [ "$1" = "--tag" ] && [ -n "$2" ]; then
    TAG=$2

    echo "Running tests with tag: $TAG"

    robot --outputdir ./logs/android/results_$(date +%Y%m%d_%H%M%S) -v PLATFORM:android -i "$TAG"  tests/

else
    echo "No tag provided. Running all tests."
    robot --outputdir ./logs/android/results_$(date +%Y%m%d_%H%M%S) -v PLATFORM:android tests/

fi