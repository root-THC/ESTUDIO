#!/bin/bash
cd '/home/users/inf/hisx1/a241535rm/Downloads/postgres-docker-arreglat'
docker rm -f $(docker ps -aq)
docker compose up -d
docker_id=$(docker ps | grep postgres cut -f1 -d " ")
docker exec -it "${docker_id}"  /bin/bash -c "psql --username=richi template1"
grep postgres cut -f1 -d" ")