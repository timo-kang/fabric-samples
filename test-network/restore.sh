set -ev
cp -r backup/organizations .
cp -r backup/channel-artifacts .
cp -r backup/system-genesis-block .

COMPOSE_FILE_BASE=compose/compose-test-net.yaml
COMPOSE_FILE_BASE_RESTORE=compose/compose-test-net-restore.yaml

mv ${COMPOSE_FILE_BASE} ${COMPOSE_FILE_BASE}.bak
cp ${COMPOSE_FILE_BASE_RESTORE} ${COMPOSE_FILE_BASE}

#Bringing network Up with Previous Backup
docker-compose -f ${COMPOSE_FILE_BASE}  up -d

#All done...
exit 1