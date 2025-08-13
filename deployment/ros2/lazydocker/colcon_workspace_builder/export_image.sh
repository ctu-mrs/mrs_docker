#!/bin/bash

set -e

trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "$0: \"${last_command}\" command failed with exit code $?"' ERR

# get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`

cd ${MY_PATH}

## --------------------------------------------------------------
## |                            setup                           |
## --------------------------------------------------------------

source ./common_vars.sh

## | ------ check for the existance of the output folder ------ |

[ ! -e $EXPORT_PATH ] && mkdir -p $EXPORT_PATH

## --------------------------------------------------------------
## |                           export                           |
## --------------------------------------------------------------

docker save ${OUTPUT_IMAGE} | gzip > ${EXPORT_PATH}/${OUTPUT_IMAGE}.tar.gz

echo ""
echo "$0: image exorted as ${EXPORT_PATH}/${OUTPUT_IMAGE}.tar.gz"
echo ""

