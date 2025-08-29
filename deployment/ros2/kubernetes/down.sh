#!/bin/bash

source <(sed 's/: /=/' values.yaml)
helm uninstall $uavName
