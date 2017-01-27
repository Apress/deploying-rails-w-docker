#!/bin/sh
set -x
aws ecs run-task --task-definition webapp --overrides file://ecs/task-definitions/migrate-overrides.json --cluster ecs-cluster
