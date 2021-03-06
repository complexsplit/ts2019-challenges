#!/bin/bash
set -e

IMAGES="nginx:latest
oleksiimy/server:0.4
oleksiimy/client:0.1
ayushsobti/kube-monkey:v0.3.0
saykumar/ts2019:s1
saykumar/ts2019:s4
saykumar/ts2019:l2s1
saykumar/ts2019:l2s2
tchaudhry/hash-svc:ts2019blue
tchaudhry/hash-svc:ts2019red
tchaudhry/simple-http-load:master
tchaudhry/pypi:master
tchaudhry/http-access-logs:master
tchaudhry/alpine-curl-gzip
prom/prometheus
python:3
python:3-slim
python:3-alpine
ubuntu:bionic
ubuntu:xenial
agrawaltarun/devopschallenges:cicd
oleksiimy/vault_client:0.1
oleksiimy/vault_server:0.1
oleksiimy/vault_challenge1:0.1
oleksiimy/vault_challenge2:0.1
oleksiimy/vault_challenge3:0.1
oleksiimy/vault_server_challenge3:0.1
bbinet/salt-master
bbinet/salt-minion
"

kubectl rollout status deployment/registry --namespace=container-registry
for image in $IMAGES; do
    docker pull $image
    docker tag $image localhost:32000/$image
    docker push localhost:32000/$image
    docker image rm $image
    docker image rm localhost:32000/$image
done
