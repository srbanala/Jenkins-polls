pipeline {
    agent any
        environment  {
            DOCKER_CREDS=credentials('docker_id')
            }
        stages {
            stage('Build') {
                steps {
                sh 'docker build -t anreddy/polls_sqlite .'

                }
             }
            stage('Test') {
                steps{
                    sh 'docker run -t anreddy/polls_sqlite python ./mysite/manage.py test run  '
                }
               }
            stage ('Deploy') {
                when {
                    branch 'feature'
                    }
                steps{
                sh 'chmod 777 pre-prod-deploy.sh'
                sh ' cat <<'EOT' ssh   ec2-user@10.0.2.14 -i /tmp/mykp.pem
                yum install docker
                systemctl start docker
                 docker run -d -p 8000:8000 -t anreddy/polls_sqlite
                echo "docker process is running"
                 EOT'
                  }
                }
            stage ('Prod-Deploy') {
                when {
                   branch 'master'
                   }
                steps {
                sh 'docker run -d -p 9090:8000 -t anreddy/polls_sqlite'
                }
              }
   }

 }
