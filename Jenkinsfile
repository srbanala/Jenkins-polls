pipeline {
    agent any
        environment  {
            DOCKER_CREDS=credentials('docker_id')
            }
        parameters {
          string(name: 'address', defaultValue: '100.24.65.179', description: 'Web1 server')
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
            stage('SonarQube Analysis') {
              steps {
                   def scannerHome = tool 'sonar-scanner';
                  withSonarQubeEnv() {
                    sh "${scannerHome}/bin/sonar-scanner"
                     }
                    }
            }
                                       
             stage ('Test-Deploy') {

            // TODO Uncommet the below block when running multibranch pipeline
           /*  when {
                   branch 'feature'
                  } */
                steps{
              /*  sh 'chmod 777 pre-prod-deploy.sh'
                sshagent(credentials : ['ec2-user'])
                {
                echo "${params.address} of web2"
                sh 'ssh -o StrictHostKeyChecking=no ec2-user@"${address}" uptime '
                sh 'ssh -v  ec2-user@"${address}" '
                sh 'ssh ec2-user@"${address}"  rm -rf /tmp/pre-prod-deploy.sh'
                sh 'scp ./pre-prod-deploy.sh  ec2-user@"${address}":/tmp'
                sh 'ssh ec2-user@"${address}" /bin/bash /tmp/pre-prod-deploy.sh ' 
                } */
                sh '/bin/bash pre-prod-deploy.sh'
               }
             }
             /*   stage('QA-Deplloy'){
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

       */

       stage ('Prod-Deploy') {
                when {
                   branch 'feature'
                   }
                steps {
                sh 'docker run -d -p 9000:8000 -t anreddy/polls_sqlite'
                }
              }


            }
          }
