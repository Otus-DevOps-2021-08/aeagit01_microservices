# aeagit01_microservices
aeagit01 microservices repository
=======================
    ![Main](https://github.com/Otus-DevOps-2021-08/aeagit01_microservices/actions/workflows/run-tests.yml/badge.svg?branch=main) *** ![PULL request](https://github.com/Otus-DevOps-2021-08/aeagit01_microservices/actions/workflows/run-tests.yml/badge.svg?event=pull_request)
=======================

kubernetes - 3
1. Знакомство с представленными в ДЗ схемами взаимодействия
2. Проверка работы kube-dns
3. Настройка и проверка работы LoadBalsnser для ui
4. Установка, настройка и проверка работы ingress
5. Настройка защиты сервиса с использованием TLS, подготовка манифеста для создания Secret
6. Проверка работы NetworkPolicy
7. Работа с PersistentVolume, создание подключение. Проверка работы

=======================
kubernetes - 2

1. Установка kubectl и  minikube
2. Знакомство с параметрами конфигурационного файла kubectl
3. Подготовка файлов Deploiment для развертывания компонентов проложения
4. Подготовка файлов Service для настроки взаимодействия
5. Развертывание и проверка работы приложения.
6. Развертывание и проверка работы расширения minikube - dashboard
7. Проверка использования Namespace
8. Создание кластера Kubernetes в yandex cloud
9. Развертывание приложения в кластере YC, проверка работы
10. Подготовка сценария Terraform для развертывания кластера Kubernets


=======================
kubernetes - 1
1. Подготовка манифестов для запуска POD-ов
2. Подготовка сценария создания хостов для развертывания Kubernetes
3. Настройка мастер ноды
4. Настройка worker-ов
5. Установка сетевого плагина Calico
6. Проверка работы узлов Kubernetes
7. Подготовка сценариев Terraform и Ansible для развертывания кластера Kubernetes

===
To start using your cluster, you need to run the following as a regular user:

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  https://kubernetes.io/docs/concepts/cluster-administration/addons/

You can now join any number of control-plane nodes by copying certificate authorities
and service account keys on each node and then running the following as root:

  kubeadm join 51.250.10.70:6443 --token <TOKEN> \
    --discovery-token-ca-cert-hash sha256:<KEY> \
    --control-plane

Then you can join any number of worker nodes by running the following on each as root:

kubeadm join 51.250.10.70:6443 --token <TOKEN> \
    --discovery-token-ca-cert-hash sha256:<KEY>

kubelet - ставим первым, иначе можно попасть на ошибку установки.

=======================
logging - 1

1. Подготовили Docker хост и пересобрали образы из заданного репозитория
2. Создали docker-compose-loggin.yml для разворачивания elasticsearch в соотвествии с заданием
3. подготовили Dockerfile, config и собрали образ Fluentd в соотвествии с заданием
4. Запустили контейнеры из новых образов, настроили передачу логов во Fluentd
5. Запустили систему сбора логов
6. Тестирование работы kibana (первичная настройка, тестирование простых запросов)
7. Тестирование работы фильтров, для разбора различного вида логов
8. Знакомство с Grok-шаблонами, настройка с их использованием разбора записей журналов
9. НАстройка дополнительного шаблона в соответствии с заданием *
10.Настройка для запуска сервиса Zipkin
11.Запуск сервиса Zipkin, знакомство с его работой.
12.Подготовка и запуск контейнеров с ошибкой, для проверки использования систем логирования при поиска ошибок в работе сервисов
При проверке ошибок было выявлено следующее:
        - Сервис ui пытается найти сервис post в собственном контейнере:  Failed to open TCP connection to 127.0.0.1:4567
          (Connection   refused - connect(2) for "127.0.0.1" port 4567), что говорит о неустановленном значении
          переменной POST_SERVICE_HOST.
        - проверка Dockerfile сервиса ui выявила, что в нем отсутствует блок переменных устанавливающих наименования сервисов POST,COMMENT
        - после внесения исправлений и перезапуска сервисов. Нормальная работа восстановилась


Ошибка при запуске "Cannot start service public-site: failed to initialize logging driver: dial tcp 127.0.0.1:24224:
                    connect: connection refused."
Возникла при попытке запуска контейнеров с передачей логов во Fluentd, лечиться указанием параметра - fluentd-async.
https://docs.docker.com/config/containers/logging/fluentd/#fluentd-async-connect
Конструктор grok выражений
http://grokconstructor.appspot.com/do/match#result
отладчик grok выражений
https://grokdebug.herokuapp.com/

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
