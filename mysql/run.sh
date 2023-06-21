#!/bin/bash

# EXPORT VARIABLE(S)
echo "phpmyadmin에 로그인할 포트 번호를 입력하세요."
read -p "> " PHPMYADMIN_PORT

export PHPMYADMIN_PORT

# RUN DOCKER-COMPOSE
docker-compose up -d
