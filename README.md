# aeagit01_microservices
aeagit01 microservices repository
=======================
    ![Main](https://github.com/Otus-DevOps-2021-08/aeagit01_microservices/actions/workflows/run-tests.yml/badge.svg?branch=main) *** ![PULL request](https://github.com/Otus-DevOps-2021-08/aeagit01_microservices/actions/workflows/run-tests.yml/badge.svg?event=pull_request)
=======================
#monitoring-1
Выполнено:
1. Приготовили докер хост
2. запустили докер контейнер на базе образа prom/prometheus
3. Протестировали работу запущенного prometheus
4. Собрали свой образ на базе  prom/prometheus:v2.1.0, подготовили первый вариант конфигурационного файла, запушили образ в свое хранилище на DockerHub
5. Собрали и запушили образы сервисов, сформировали docker-compose.yml для разворачивания всех сонтейнеров на docker-host-e
6. Протестировали работу prometheus, изменяя состояния отслеживаемых сервисов
7. Подключили node-exporter, протестировали работу
8. Подключили mongodb-exporter на базе образа ercona/mongodb_exporter:0.30.0, образ разместили в хранилище, протестировали работу
9. Подключили blackbox-exporter, образ разместили в хранилище, протестировали работу

https://prometheus.io/docs/guides/multi-target-exporter/
https://habr.com/ru/company/otus/blog/500448/
https://github.com/prometheus/blackbox_exporter/blob/master/CONFIGURATION.md


=======================

#docker - 4
Фомирование имени контейнера:
    default - составляется из имени каталога, содержащего файл docker-compose.yaml, за ним следует имя контейнера, указанное в файле docker-compose.yaml , и номер экземпляра - <project_folder_name>_<conteiner_name>_<num>
    Первая часть может быть переопределена:
                - параметром -p/--project-name в комманднй строке docker-compose
                - рутем установки переменной окружения COMPOSE_PROJECT_NAME, переменную можно определить в файле .env
    имя контейнера можно прямо задать через параметр container_name файла docker-compose.yaml

nginx: [emerg] bind() to 0.0.0.0:80 failed (98: Address already in use)
2021/11/20 18:52:56 [emerg] 1#1: bind() to [::]:80 failed (98: Address already in use)
nginx: [emerg] bind() to [::]:80 failed (98: Address already in use)
2021/11/20 18:52:56 [notice] 1#1: try again to bind() after 500ms
2021/11/20 18:52:56 [emerg] 1#1: still could not bind()

links:
https://runnable.com/docker/advanced-docker-compose-configuration

add telnet && net tools (ifconfig,ping etc.) to alpine image
apk add busybox-extras && apk add net-tools

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
