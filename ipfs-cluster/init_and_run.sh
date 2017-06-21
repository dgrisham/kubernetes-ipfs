#!/bin/bash

num_peers="$1"
[[ -z "$num_peers" ]] && num_peers=5

../reset-minikube.sh
./init.sh "$num_peers"
cd ..
go build && ./kubernetes-ipfs --param N="$num_peers" ipfs-cluster/tests/pin_and_unpin-template.yml
