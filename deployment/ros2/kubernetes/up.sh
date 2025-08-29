#!/bin/bash

source <(sed 's/: /=/' values.yaml)

helm template $uavName . --set initPhase=true | kubectl apply -f -
kubectl wait --for=condition=Ready pod/init --timeout=1h

kubectl cp ./shared_data init:/etc/docker/
kubectl delete pod init --wait=false

helm upgrade --install $uavName . --atomic
