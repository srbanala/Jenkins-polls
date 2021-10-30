pipeline {
    agent any
        environment  {
            DOCKER_CREDS=credentials('docker_id')
            }
        stages {
            stage('Build') {
                steps {
                sh 'sudo mkdir -p /django_polls/dist'
                sh ' sudo cd /django_polls/dist'
                sh 'sudo python -m pip install --user django-polls-0.1.tar.gz'
                }
             }
            stage('Test') {
                steps{
                    sh 'sudo python ./mysite/manage.py test run '
                }
               }
            stage ('Deploy') {
                when {
                    branch 'feature'
                    }
                steps{
                sh 'sudo python ./mysite/manage.py runserver'
                 }
       }
   }
 }
