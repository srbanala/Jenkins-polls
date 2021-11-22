 cat <<'EOT' ssh   ec2-user@10.0.2.14 -i /tmp/mykp.pem
 yum install docker
 systemctl start docker
 docker run -d -p 8000:8000 -t anreddy/polls_sqlite
 echo "docker process is running"
 EOT