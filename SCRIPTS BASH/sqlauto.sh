#!/bin/bash
docker rm -f $(docker ps -aq)
docker compose up -d
docker_id = $(docker ps | awk '{print $1}')
docker exec -it "${docker_id}"  /bin/bash -c "psql --username=richi template1"
