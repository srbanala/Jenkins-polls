
 yum install docker
 systemctl start docker
 docker run -d -p 8000:8000 -t anreddy/polls_sqlite
 echo "docker process is running"