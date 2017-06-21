#!/bin/bash

Xvfb :99 -ac -screen 0 1280x1024x24 +extension RANDR &
export DISPLAY=:99

#Set output directory and run tests. Environment variables are set
robot -d ${REPORTS_FOLDER} ${TESTS_FOLDER}

kill -9 $(pgrep Xvfb)
