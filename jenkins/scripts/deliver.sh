#!/usr/bin/env bash

echo "Building Maven Project"
set -x
mvn clean package install -DskipTests
set +x

echo "Extracting Project Name and Version"
set -x
NAME=$(mvn -q -DforceStdout help:evaluate -Dexpression=project.name | sed -r "s/\x1B\[[0-9;]*[mK]//g")
VERSION=$(mvn -q -DforceStdout help:evaluate -Dexpression=project.version | sed -r "s/\x1B\[[0-9;]*[mK]//g")
set +x

echo "Checking Generated JAR File"
JAR_FILE="target/${NAME}-${VERSION}.jar"
if [ -f "$JAR_FILE" ]; then
    echo "Found JAR: $JAR_FILE"
    java -jar "$JAR_FILE"
else
    echo "Error: JAR file not found at $JAR_FILE"
    exit 1
fi
