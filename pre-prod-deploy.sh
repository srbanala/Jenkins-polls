ssh ec2-user@10.0.102.109 -i /tmp/mykp.com
sudo yum install docker
sudo systemctl start docker
sudo docker run -d -p 8000:8000 -t anreddy/polls_sqlite '