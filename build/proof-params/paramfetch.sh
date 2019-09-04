#!/usr/bin/env bash

IPGET_PARAMS="--node=spawn -p=/ip4/138.201.67.219/tcp/4002/ws/ipfs/QmUd6zHcbkbcs7SMxwLs48qZVX3vpcM8errYS7xEczwRMA -p=/ip4/138.201.67.218/tcp/4002/ws/ipfs/QmbVWZQhCGrS7DhgLqWbgvdmKN7JueKCREVanfnVpgyq8x -p=/ip4/94.130.135.167/tcp/4002/ws/ipfs/QmUEMvxS2e7iDrereVYc5SWPauXPyNwxcy9BXZrC1QTcHE -p=/ip4/138.201.68.74/tcp/4001/ipfs/QmdnXwLrC8p1ueiq2Qya8joNvk3TVVDAut7PrikmZwubtR -p=/ip4/138.201.67.220/tcp/4001/ipfs/QmNSYxZAiJHeLdkBg38roksAR9So7Y5eojks1yjEcUtZ7i"
OUT_DIR="/var/tmp/filecoin-proof-parameters"
PARAMS="build/proof-params/parameters.json"

mkdir -p $OUT_DIR
jq '. | to_entries | map("-o '$OUT_DIR'/\(.key) \(.value.cid)") | .[]' --raw-output $PARAMS | xargs -t -L1 ipget --progress $IPGET_PARAMS