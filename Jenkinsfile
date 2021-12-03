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
            stage ('Test-Deploy') {
                when {
                    branch 'feature'
                    }
                steps{
                sh 'chmod 777 pre-prod-deploy.sh'
                sshagent(credentials : ['ec2-user'])
                 {
                 sh 'ssh -o StrictHostKeyChecking=no  ec2-user@10.0.2.135 uptime'
                 sh 'ssh -v  ec2-user@10.0.2.135'
                 sh 'ssh ec2-user@10.0.2.135  rm -rf /tmp/pre-prod-deploy.sh'
                 sh 'scp ./pre-prod-deploy.sh  ec2-user@10.0.2.135:/tmp'
                 sh 'ssh ec2-user@10.0.2.135  /bin/bash /tmp/pre-prod-deploy.sh '
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
             sh 'ssh -o StrictHostKeyChecking=no ec2-user@10.0.2.157 uptime'
             sh ' ssh -v ec2-user@10.0.2.157'
             sh ' ssh ec2-user@10.0.2.157 rm -rf /tmp/pre-prod-deploy.sh'
             sh 'scp ./pre-prod-deploy.sh ec2-user@10.0.2.157:/tmp'
             sh 'ssh ec2-user@10.0.2.157 /bin/bash /tmp/pre-prod-deploy.sh'
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
