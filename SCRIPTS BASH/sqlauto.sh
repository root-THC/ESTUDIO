#!/bin/bash
docker compose up -d
docker_id = docker id awk '{print $1}'
docker exec -it $docker_id /bin/bash
psql --username=richi template1