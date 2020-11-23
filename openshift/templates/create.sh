#!/bin/sh

if [[ -z "${ENV_NAME}" || -z "${API_BASE}" ]]
then
      echo "Please set required environment vars before running"
      exit 2
fi

DATABASE_PASSWORD=`openssl rand -base64 40 |  tr -cd '[:alpha:]' |  head -c 20`
DATABASE_REPLICATION_PASSWORD=`openssl rand -base64 40 |  tr -cd '[:alpha:]' |  head -c 20`
DATABASE_ROOT_PASSWORD=`openssl rand -base64 40 |  tr -cd '[:alpha:]' |  head -c 20`

# install these one at a time. this is the correct order.

#oc create configmap envoy-config --from-file=envoy-config.yaml
#oc process -f ./envoy.yaml CPU_REQUEST=200m CPU_LIMIT=500m MEMORY_REQUEST=300M MEMORY_LIMIT=1G ENV_NAME=${ENV_NAME} | oc apply -f -
#oc process -f ./database-secrets.yaml ENV_NAME=${ENV_NAME} DATABASE_PASSWORD=${DATABASE_PASSWORD} DATABASE_REPLICATION_PASSWORD=${DATABASE_REPLICATION_PASSWORD} DATABASE_ROOT_PASSWORD=${DATABASE_ROOT_PASSWORD} | oc apply -f -
#oc process -f ./configmap.yaml BACKEND_SPRING_PROFILES="${BACKEND_SPRING_PROFILES}"

#oc process -f ./postgres-crunchy.yaml CPU_REQUEST=200m CPU_LIMIT=1000m MEMORY_REQUEST=1000M MEMORY_LIMIT=2G ENV_NAME=${ENV_NAME} | oc apply -f -

#oc process -f ./backend-bc.yaml ENV_NAME=${ENV_NAME} | oc apply -f -
#oc process -f ./frontend-bc.yaml ENV_NAME=${ENV_NAME} API_BASE=${API_BASE} | oc apply -f -
#oc process -f ./backend.yaml CPU_REQUEST=400m CPU_LIMIT=1000m MEMORY_REQUEST=1000M MEMORY_LIMIT=2G ENV_NAME=${ENV_NAME} | oc apply -f -
#oc process -f ./frontend.yaml CPU_REQUEST=400m CPU_LIMIT=1000m MEMORY_REQUEST=500M MEMORY_LIMIT=2G ENV_NAME=${ENV_NAME} | oc apply -f -
