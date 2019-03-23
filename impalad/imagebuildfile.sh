#!/bin/bash

export version=1.0.0

cd ~/repos/masterarbeit/docker-impala-cluster/impalad
docker build -t mfisser/impala-impalad:${version} ./
docker push mfisser/impala-impalad:${version}