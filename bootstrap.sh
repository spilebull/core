test -f /opt/bin/docker-compose && exit
sudo mkdir -p /opt/bin/
sudo curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /opt/bin/docker-compose
sudo chmod +x /opt/bin/docker-compose
docker-compose -v

test -f /etc/docker/daemon.json && exit
docker ps -a
echo '{ "insecure-registries":["10.2.66.60:5000"] }' > ~/daemon.json
sudo chmod 644 ~/daemon.json
sudo mv ~/daemon.json /etc/docker/daemon.json
sudo systemctl restart docker