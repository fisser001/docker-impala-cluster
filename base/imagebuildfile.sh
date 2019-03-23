#!/bin/bash

export version=1.0.0

cd ~/repos/masterarbeit/docker-impala-cluster/base
docker build -t mfisser/impala-base:${version} ./
docker push mfisser/impala-base:${version}