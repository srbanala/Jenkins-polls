pipeline {
    agent any
     environment {
        DOCKER_CREDS=credentials('docker_id')
        }
     parameters{
         string(name: 'address', defaultValue: '10.0.2.67'  ,description: 'web2 server' )
         }
     stages {

       stage ('Build') {
         steps {
          //sh 'docker build -t anreddy/docker_compose_polls . '
          sh 'echo "$DOCKER_CREDS_PSW"|docker login -u "$DOCKER_CREDS_USR" --password-stdin '
         // sh ' docker push  anreddy/docker_compose_polls'
             }
          }

       stage ('Test'){
         steps {
        //  sh ' docker run -t anreddy/docker_compose_polls python3 ./mysite/manage.py test run'
            sh ' echo "Testing sonarqube" '
            }
          }


       stage('Deploy') {
       //TODO Uncommet the below block when using  multibranch pipeline
        /*when {
        branch 'dev'
         }
         */
         steps {
            sh ' chmod 777 * '
            sshagent(credentials : ['sshkeys'])
            {
            sh 'echo "web2 server ip address is ${address}" '
            sh 'ssh -o StrictHostKeyChecking=no ec2-user@"${address}" uptime'
            sh 'ssh -v ec2-user@"${address}" '
            //sh 'scp -r * ec2-user@"${ec2-address}":/home/ec2-user'
           //sh 'ssh ec2-user@"${address}" docker run -d --name sonarqube -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true -p 9000:9000 sonarqube:latest '
           sh 'scp -r docker-compose-install.sh ec2-user@"${address}":/tmp '
           sh 'scp -r docker-compose-db.yml ec2-user@"${address}":/tmp '
           //sh 'ssh ec-user@"${address}" ./tmp/docker-compose-install.sh'
           sh 'ssh ec2-user@"${address}" docker-compose up -f /tmp/docker-compose-db.yml -d '
            }
            }
         }
       }
     }







