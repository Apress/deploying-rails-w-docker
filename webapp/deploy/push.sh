#!/bin/sh
set -x

LC=$(git rev-parse --short HEAD)
docker build -f Dockerfile -t pacuna/webapp:${LC} .
docker push pacuna/webapp:${LC}
kubectl set image deployment webapp webapp=pacuna/webapp:${LC}
