#!/bin/bash
set -e

# Docker 데몬을 백그라운드에서 실행
dockerd &

# Docker 데몬이 준비될 때까지 대기
until docker info >/dev/null 2>&1; do
  echo "Waiting for Docker to start..."
  sleep 1
done

# Docker Compose 명령어를 자동으로 실행
# if [ -f /path/to/docker-compose.yml ]; then
#   echo "Starting Docker Compose..."
#   docker-compose up
# else
#   echo "No Docker Compose file found at /path/to/docker-compose.yml"
# fi

echo "Starting Docker Compose..."
docker-compose up

# 기본 명령어를 실행
exec "$@"