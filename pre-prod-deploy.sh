ssh  -tt ec2-user@10.0.102.109 -i /tmp/mykp.pem
sudo yum install docker
sudo systemctl start docker
sudo docker run -d -p 8000:8000 -t anreddy/polls_sqlite
sudo echo "docker process is running"