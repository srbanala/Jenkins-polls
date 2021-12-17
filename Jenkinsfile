pipeline {
    agent any
     environment {
        DOCKER_CREDS=credentials('docker_id')
        }
     parameters{
         string(name: 'ec2-address', defaultValue: '10.0.2.176'  ,description: 'web2 server' )
         }
     stages {

       stage ('Build') {
         steps {
          sh 'docker build -t anreddy/docker_compose_polls . '
          sh 'echo "$DOCKER_CREDS_PSW"|docker login -u "$DOCKER_CREDS_USR" --password-stdin '
          sh ' docker push  anreddy/docker_compose_polls'
             }
          }

       stage ('Test'){
         steps {
          sh ' docker run -t anreddy/docker_compose_polls python3 ./mysite/manage.py test run'
            }
          }

       stage('Deploy') {
        when {
        branch feature
        }
         steps {
            sh ' chmod 777 * '
            sshagent(credentials : ['ec2-user'])
            {
            sh 'echo "web2 server ip address is ${params.ec2-address}"'
            sh 'ssh -o StrictHostKeyChecking=no ec2-user@"${ec2-address}" uptime'
            sh 'ssh -v ec2-user@"${ec2-address}" '
            //sh 'scp -r * ec2-user@"${ec2-address}":/home/ec2-user'
            sh 'ssh ec2-user@"${ec2-address}" docker run -d --name sonarqube -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true -p 9000:9000 sonarqube:latest '
            }
            }
         }
       }
     }







