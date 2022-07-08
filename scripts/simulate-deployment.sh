#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

target_environmenbt=${1:-development}

echo "Simulating a deployment to environemnt: [${target_environmenbt}]"
echo "Deployment started"
echo "Deployment in progress..."
sleep 10
echo "Deployment to environment [${target_environmenbt}] completed successfully"

