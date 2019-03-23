#!/bin/bash

export version=1.0.0

cd ~/repos/masterarbeit/docker-impala-cluster/state-store
docker build -t mfisser/impala-state-store:${version} ./
docker push mfisser/impala-state-store:${version}