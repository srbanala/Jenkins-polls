pipeline {
    agent any
        environment  {
            DOCKER_CREDS=credentials('docker_id')
            }
        stages {
            stage('Build') {
                steps {
                sh 'docker build -t anreddy/polls_sqlite .'
                sh 'docker run -t -d anreddy/polls_sqlite -p 8000:8000'
                }
             }
            stage('Test') {
                steps{
                    sh 'docker run -t anreddy/polls_sqlite python /django_polls/dist/mysite/manage.pytest run '
                }
               }
            stage ('Deploy') {
                when {
                    branch 'feature'
                    }
                steps{
                sh 'docker run -t -d anreddy/polls_sqlite -p 8000:8000 '
                 }
       }
   }
 }
