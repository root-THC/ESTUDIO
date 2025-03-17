#!/bin/bash
docker compose up -d
docker_id = docker id awk '{print $1}'
docker exec -it "docker_id" /bin/bash c "psql --username=richi template1"
psql --username=richi template1