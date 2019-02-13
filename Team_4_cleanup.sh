echo " Stopping the docker container "
sudo docker stop $(sudo docker ps -aq)

sleep 1
echo " Removing the docker conainer "
sudo docker rm $(sudo docker ps -aq)


sleep 1
echo " Remove docker volume "
sudo docker volume rm $(sudo docker volume ls | awk '{print $2}')

sleep 1
echo " Removing the dev-peer0.org1.example.com-* Images "
sudo docker rmi $(sudo docker images | grep peer0 | awk '{print $3}')

sleep 1
echo " Dumping empty container and volume "
sudo docker ps -a
sudo docker volume ls

echo " Install the iptables "
sudo iptables -D INPUT -p tcp --dport 8000 -j ACCEPT

