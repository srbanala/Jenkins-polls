pipeline {
    agent any
        environment  {
            DOCKER_CREDS=credentials('docker_id')
            }
        parameters {
          string(name: 'address', defaultValue: '10.0.2.90', description: 'Web2 server')
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
                echo "${params.address} of web2"
                // sh 'ssh -o StrictHostKeyChecking=no ec2-user@${Ec2-ip-address} uptime '
                 //sh 'ssh -v  ec2-user@${Ec2-ip-address}'
                 //sh 'ssh ec2-user@${Ec2-ip-address}  rm -rf /tmp/pre-prod-deploy.sh'
                 //sh 'scp ./pre-prod-deploy.sh  ec2-user@${Ec2-ip-address}:/tmp'
                 //sh 'ssh ec2-user@${Ec2-ip-address}  /bin/bash /tmp/pre-prod-deploy.sh '
                }
               }
             }
            }
          }
