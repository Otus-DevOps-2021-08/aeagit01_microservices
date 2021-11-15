# aeagit01_microservices
aeagit01 microservices repository
=======================
    MN:![branch parameter main](https://github.com/Otus-DevOps-2021-08/aeagit01_microservices/actions/workflows/run-tests.yml/badge.svg?branch=main) *** PR:![event parameter](https://github.com/Otus-DevOps-2021-08/aeagit01_microservices/actions/workflows/run-tests.yml/badge.svg?event=pull_request)
=======================

#docker - 3
При использовании образа ubunu для модуля ui и post, необходимо постаить пакеты:
     ruby-full
     ruby-dev
     build-essential
При использовании образа alpine:
    для установки используем apk add
    пакеты еобходимые для работы ui и post
     ruby-full
     ruby-dev
     build-base вместо build-essential
Самый маленький образ получился при использование alpine

=======================
#docker-1 && docker -2

docker-machine - в настоящее время depricated для установки можно использовать ссылку:
    - https://github.com/docker/machine/releases
