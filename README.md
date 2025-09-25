# Kaniko Demo

Pequeña app de ejemplo para construir con Kaniko en Kubernetes y publicar en Docker Hub.

## Ejecutar local
npm ci --prefix app
node app/server.js

## Docker local
docker build -t tu_usuario/kaniko-demo:dev .
docker run --rm -p 3000:3000 tu_usuario/kaniko-demo:dev