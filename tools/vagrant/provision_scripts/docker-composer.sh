sudo curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
echo "alias docker-compose='sudo docker-compose -H unix://var/snap/microk8s/current/docker.sock'" >> ~/.bash_aliases