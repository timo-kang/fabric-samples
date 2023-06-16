set -ev

COMPOSE_FILE_BASE=compose/docker/docker-compose-test-net.yaml
COMPOSE_FILE_BASE_RESTORE=compose/docker/docker-compose-test-net-restore.yaml

#bringing network down and clearing volumes

docker-compose -f ${COMPOSE_FILE_BASE} down

docker volume prune

docker network prune

#Bringing network Up with Previous Backup
docker-compose -f ${COMPOSE_FILE_BASE_RESTORE}  up -d

#All done...
exit 1