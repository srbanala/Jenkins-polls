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
                 sh 'ssh -o StrictHostKeyChecking=no  ec2-user@10.0.2.216 uptime'
                 sh 'ssh -v  ec2-user@10.0.2.216'
                 sh 'ssh ec2-user@10.0.2.216  rm -rf /tmp/pre-prod-deploy.sh'
                 sh 'scp ./pre-prod-deploy.sh  ec2-user@10.0.2.216:/tmp'
                 sh 'ssh ec2-user@10.0.2.216  /bin/bash /tmp/pre-prod-deploy.sh '
                 }
                }
             }
            stage('QA-Deplloy'){
             when {
                  branch 'feature'
                  }
             steps{
             sshagent(credentials : ['ec2-user'])
             {
             sh 'ssh -o StrictHostKeyChecking=no ec2-user@10.0.1.58 uptime'
             sh ' ssh -v ec2-user@10.0.1.58'
             sh ' ssh ec2-user@10.0.1.58 rm -rf /tmp/pre-prod-deploy.sh'
             sh 'scp ./pre-prod-deploy.sh ec2-user@10.0.1.58:/tmp'
             sh 'ssh ec2-user@10.0.1.58 /bin/bash /tmp/pre-prod-deploy.sh'
             }
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
