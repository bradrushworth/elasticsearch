#!/usr/bin/bash

echo "Setup of host machine:"
echo sudo apt update
echo sudo apt upgrade
echo sudo apt install docker.io
echo sudo usermod -aG docker ubuntu
echo You need to logout and log back in...
echo docker run hello-world
echo df -h
echo sudo apt install docker-compose
#echo docker swarm init
echo
echo "The vm.max_map_count kernel setting must be set to at least 262144 for production use:"
echo "sudo sysctl -w vm.max_map_count=262144"
echo "Add to /etc/sysctl.conf/etc/sysctl.conf to make permanent."
echo
echo "Increase ulimits for nofile and nproc:"
echo "docker run --rm centos:8 /bin/bash -c 'ulimit -Hn && ulimit -Sn && ulimit -Hu && ulimit -Su'"
echo "If required, adjust limits on docker run command by e.g. --ulimit nofile=65535:65535"
echo
echo "Disable swapping on the host or do this instead:"
echo "-e 'bootstrap.memory_lock=true' --ulimit memlock=-1:-1"
echo

#docker build -t bitbot/mariadb mariadb --rm #--no-cache

#docker-compose pull

docker-compose -f create-certs.yml run --rm create_certs

docker-compose up -d #--force

echo
echo "To execute bash inside the container:"
echo "docker exec -it es01  bash"
echo "docker exec -it kib01 bash"
echo "exit"
echo

echo "Get logs:"
echo docker logs -f es01
echo docker logs -f kib01
echo

