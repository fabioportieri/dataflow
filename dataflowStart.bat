set DATAFLOW_VERSION=2.10.0-SNAPSHOT&
set SKIPPER_VERSION=2.9.0-SNAPSHOT&
set HOST_MOUNT_PATH=%userprofile%\.m2
set DOCKER_MOUNT_PATH=/root/.m2/
docker-compose -f common.yml -f docker-compose.yml -f docker-compose-kafka-ext.yml -f docker-compose-postgres.yml -f docker-compose-prometheus.yml up

