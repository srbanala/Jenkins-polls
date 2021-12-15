pipeline {
    agent any
        environment  {
            DOCKER_CREDS=credentials('docker_id')
            }
        parameters {
          string(name: 'ipaddress', defaultValue: 10.0.2.90, description: 'Web2 server')
         }
        stages {
            stage('Build') {
                steps {
                sh 'docker build -t anreddy/polls_sqlite .'
                }
             }
            stage('Test') {
                steps{
                    sh 'docker run -t anreddy/polls_sqlite python ./mysite/manage.py test run '
                }
               }
            stage ('Test-Deploy') {
             when {
                   branch 'feature'
                  }
                steps{
                sh 'chmod 777 pre-prod-deploy.sh'
                sshagent(credentials : ['ec2-user'])
                {
                echo "${ipaddress}"
                }
               }
             }
            }
          }
