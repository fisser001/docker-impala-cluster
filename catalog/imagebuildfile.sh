#!/bin/bash

export version=1.0.0

cd ~/repos/masterarbeit/docker-impala-cluster/catalog
docker build -t mfisser/impala-catalog:${version} ./
docker push mfisser/impala-catalog:${version}