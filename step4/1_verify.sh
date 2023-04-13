#!/bin/bash

# Check if the Service exists
if ! kubectl get service my-app-service-nodeport >/dev/null 2>&1; then
  echo "Service tidak ditemukan"
  exit 1
fi

# Check if the Service has the correct configuration
SERVICE_TYPE=$(kubectl get service my-app-service-nodeport -o=jsonpath='{.spec.type}')
SERVICE_PORT=$(kubectl get service my-app-service-nodeport -o=jsonpath='{.spec.ports[0].port}')
SERVICE_TARGET_PORT=$(kubectl get service my-app-service-nodeport -o=jsonpath='{.spec.ports[0].targetPort}')

if [ "$SERVICE_TYPE" != "NodePort" ] || [ "$SERVICE_PORT" != "3030" ] || [ "$SERVICE_TARGET_PORT" != "80" ]; then
  echo "Konfigurasi Service salah"
  exit 1
fi

echo "OK"
exit 0