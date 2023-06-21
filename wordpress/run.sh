#!/bin/bash

# EXPORT VARIABLE(S)
export YOUR_UID=`id -u`

echo "만들 컨테이너 이름을 입력합니다(입력 예 'wp-domain-name')"
read -p "> " CONTAINER_NAME

echo "연결할 데이터베이스 이름을 입력합니다(입력 예 'wp_db_name')"
read -p "> " DB_NAME

echo "할당하려는 도메인 이름을 입력하십시오(입력 예 'domain.com' 또는 'domain0.com,domain1.com')"
read -p "> " DOMAIN_NAME_LIST

echo "인증서 취득에 사용할 이메일 주소를 입력하세요."
read -p "> " EMAIL_ADDRESS

echo "현재 디렉토리에 public_html을 만들고 공개 파일을 마운트 할 수 있습니까? [y/n]"
read -p "> " WORDPRESS_PATH_FLAG
case $WORDPRESS_PATH_FLAG in
    y)
        WORDPRESS_PATH="./public_html"
        ;;
    *)
        echo "공개 파일을 마운트할 경로를 입력하십시오(입력 예 "./public_html")"
        read -p "> " WORDPRESS_PATH
        ;;
esac

export YOUR_UID CONTAINER_NAME DB_NAME DOMAIN_NAME_LIST EMAIL_ADDRESS YOUR_UID WORDPRESS_PATH

# RUN CONTAINER(S)
docker-compose -p $CONTAINER_NAME up -d
