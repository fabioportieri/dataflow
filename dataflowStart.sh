export DATAFLOW_VERSION=2.10.0-SNAPSHOT
export SKIPPER_VERSION=2.9.0-SNAPSHOT
export HOST_MOUNT_PATH=~/.m2
export DOCKER_MOUNT_PATH=/root/.m2/
docker-compose -f common.yml -f docker-compose.yml -f docker-compose-kafka-ext.yml -f docker-compose-postgres.yml -f docker-compose-prometheus.yml up
#docker-compose -f docker-compose.yml -f docker-compose-kafka.yml -f docker-compose-postgres.yml -f docker-compose-prometheus.yml up
