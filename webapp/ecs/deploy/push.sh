#!/bin/sh
set -x

LC=$(git rev-parse --short HEAD)
docker build -f Dockerfile -t pacuna/webapp:${LC} .
docker push pacuna/webapp:${LC}

# replace LAST_COMMIT with latest commit hash output the result to a tmp file
sed "s/webapp:LAST_COMMIT/webapp:$LC/g" ecs/task-definitions/webapp.json > webapp.json.tmp

# register the new task definition and delete the tmp file
aws ecs register-task-definition --cli-input-json file://webapp.json.tmp
rm webapp.json.tmp

# update the service
aws ecs update-service --service webapp-service --task-definition webapp --desired-count 1 --cluster ecs-cluster
