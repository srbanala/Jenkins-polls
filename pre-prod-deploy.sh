 sudo yum install docker -y
 sudo systemctl start docker
 sudo docker run --name polls_sqlite -d -p 8000:8000 -t anreddy/polls_sqlite
 sudo docker ps
 echo "docker process is running"
