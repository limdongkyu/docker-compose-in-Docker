FROM python:3.11-slim


RUN pip3 install --upgrade pip
RUN pip3 cache purge
RUN pip3 install fastapi uvicorn


# 작업 디렉터리 설정
WORKDIR /app

# 필요한 파일을 복사합니다.
COPY . /app

EXPOSE 80
# Docker Compose를 실행합니다.
# CMD ["docker-compose", "up"]

# docker build -t my_docker_compose_runner .  
# docker run --privileged -p 80:80 -p 53:53 -v /var/run/docker.sock:/var/run/docker.sock -v /app:/app/app my_docker_compose_runner
# docker run -p 80:80 -v /var/run/docker.sock:/var/run/docker.sock -v /app:/app/app my_docker_compose_runner
# docker run -p 80:80 -v /var/run/docker.sock:/var/run/docker.sock my_docker_compose_runner -it /bin/bash
# docker run -it -p 80:80 my_docker_compose_runner 