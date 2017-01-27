#!/bin/sh

echo "Waiting PostgreSQL to start on 5432..."

while ! nc -z postgres 5432; do
  sleep 0.1
done

echo "PostgreSQL started"

bin/rails db:create RAILS_ENV=test
bin/rails db:migrate RAILS_ENV=test
bin/rake RAILS_ENV=test
