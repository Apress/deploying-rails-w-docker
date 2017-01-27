#!/bin/sh
set -x

# get latest commit hash
LC=$(git rev-parse --short HEAD)

# delete current migrate job
kubectl delete jobs/setup || true

# replace LAST_COMMIT with latest commit hash output the result to a tmp file
sed "s/webapp:LAST_COMMIT/webapp:$LC/g" kube/jobs/setup-job.yaml > setup-job.yaml.tmp

# run the updated tmp job in the cluster and then delete the file
kubectl create -f setup-job.yaml.tmp &&
  rm setup-job.yaml.tmp
