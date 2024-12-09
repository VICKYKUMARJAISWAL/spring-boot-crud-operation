#!/usr/bin/env bash

echo "Building and Installing Maven Project"
set -x
mvn clean package install -DskipTests
set +x

echo "Extracting Project Name and Version"
set -x
NAME=$(mvn -q -DforceStdout help:evaluate -Dexpression=project.name | tr -d '\033')
VERSION=$(mvn -q -DforceStdout help:evaluate -Dexpression=project.version | tr -d '\033')
set +x

echo "Checking Generated JAR File"
set -x
JAR_FILE="target/${NAME}-${VERSION}.jar"
if [ -f "$JAR_FILE" ]; then
    echo "Found JAR: $JAR_FILE"
    java -jar "$JAR_FILE"
else
    echo "Error: JAR file not found at $JAR_FILE"
    exit 1
fi
