#!/bin/sh

# ALSO MINIO_EXTERNAL_URL, but it can be blank to disable rewrites

if [[ -z "${ENV_NAME}" || -z "${API_BASE}" || -z "${KEYCLOAK_REALM}" || -z "${KEYCLOAK_URL}" || -z "${JWT_ISSUER_URI}" || -z "${JWKS_URL}" ]]
then
      echo "Please set required environment vars before running"
      exit 2
fi

DATABASE_PASSWORD=`openssl rand -base64 40 |  tr -cd '[:alpha:]' |  head -c 20`
DATABASE_REPLICATION_PASSWORD=`openssl rand -base64 40 |  tr -cd '[:alpha:]' |  head -c 20`
DATABASE_ROOT_PASSWORD=`openssl rand -base64 40 |  tr -cd '[:alpha:]' |  head -c 20`
MINIO_ACCESS_KEY=`openssl rand -base64 40 | md5sum | head -c 32`
MINIO_SECRET_KEY=`openssl rand -base64 40 | md5sum | head -c 32`

# install these one at a time. this is the correct order.
#oc create configmap envoy-config --from-file=envoy-config.yaml

# to update envoy-config after installation (for fresh install, use above)
#oc create configmap envoy-config --from-file=envoy-config.yaml --dry-run -o yaml | oc apply -f -

#oc process -f ./minio-secrets.yaml MINIO_ACCESS_KEY=${MINIO_ACCESS_KEY} MINIO_SECRET_KEY=${MINIO_SECRET_KEY} ENV_NAME=${ENV_NAME} | oc apply -f -
#oc process -f ./envoy.yaml CPU_REQUEST=200m CPU_LIMIT=500m MEMORY_REQUEST=300M MEMORY_LIMIT=1G ENV_NAME=${ENV_NAME} | oc apply -f -
#oc process -f ./database-secrets.yaml ENV_NAME=${ENV_NAME} DATABASE_PASSWORD=${DATABASE_PASSWORD} DATABASE_REPLICATION_PASSWORD=${DATABASE_REPLICATION_PASSWORD} DATABASE_ROOT_PASSWORD=${DATABASE_ROOT_PASSWORD} | oc apply -f -
#oc process -f ./configmap.yaml  KEYCLOAK_REALM=${KEYCLOAK_REALM} KEYCLOAK_URL=${KEYCLOAK_URL} JWT_ISSUER_URI=${JWT_ISSUER_URI} ENV_NAME=${ENV_NAME}  JWKS_URL=${JWKS_URL} MINIO_HOST=${MINIO_HOST} | oc apply -f -

#oc process -f ./postgres-crunchy.yaml CPU_REQUEST=200m CPU_LIMIT=1000m MEMORY_REQUEST=1000M MEMORY_LIMIT=2G ENV_NAME=${ENV_NAME} | oc apply -f -
#oc process -f ./minio.yaml ENV_NAME=${ENV_NAME}  CPU_REQUEST=200m CPU_LIMIT=400m MEMORY_REQUEST=512M MEMORY_LIMIT=2G  | oc apply -f -
#oc process -f ./backend-bc.yaml ENV_NAME=${ENV_NAME} | oc apply -f -
#oc process -f ./frontend-bc.yaml ENV_NAME=${ENV_NAME} API_BASE=${API_BASE} | oc apply -f -
#oc process -f ./backend.yaml CPU_REQUEST=400m CPU_LIMIT=1000m MEMORY_REQUEST=1000M MEMORY_LIMIT=2G ENV_NAME=${ENV_NAME} | oc apply -f -
#oc process -f ./gpx-processor-bc.yaml ENV_NAME=${ENV_NAME} | oc apply -f -
#oc process -f ./frontend.yaml CPU_REQUEST=400m CPU_LIMIT=1000m MEMORY_REQUEST=500M MEMORY_LIMIT=2G ENV_NAME=${ENV_NAME} | oc apply -f -
#oc process -f ./gpx-processor.yaml CPU_REQUEST=50m CPU_LIMIT=1000m MEMORY_REQUEST=200M MEMORY_LIMIT=2G ENV_NAME=${ENV_NAME} | oc apply -f -
