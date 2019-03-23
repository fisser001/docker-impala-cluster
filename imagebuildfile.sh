#!/bin/bash

export version=1.0.0

cd ~/repos/masterarbeit/docker-impala-cluster/base
docker build -t mfisser/impala-base:${version} ./
docker push mfisser/impala-base:${version}

cd ~/repos/masterarbeit/docker-impala-cluster/catalog
docker build -t mfisser/impala-catalog:${version} ./
docker push mfisser/impala-catalog:${version}

cd ~/repos/masterarbeit/docker-impala-cluster/impalad
docker build -t mfisser/impala-impalad:${version} ./
docker push mfisser/impala-impalad:${version}

cd ~/repos/masterarbeit/docker-impala-cluster/state-store
docker build -t mfisser/impala-state-store:${version} ./
docker push mfisser/impala-state-store:${version}