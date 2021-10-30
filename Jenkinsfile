pipeline {
    agent any
        environment  {
            DOCKER_CREDS=credentials('docker_id')
            }
        stages {
            stage('Build') {
                steps {
                sh 'mkdir -p /tmp/django_polls/dist'
                sh 'cd /tmp/django_polls/dist'
                
                sh ' python -m pip install --user django-polls-0.1.tar.gz'
                }
             }
            stage('Test') {
                steps{
                    sh 'python /tmp/django_polls/dist/mysite/manage.py test run '
                }
               }
            stage ('Deploy') {
                when {
                    branch 'feature'
                    }
                steps{
                sh 'python /tmp/django_polls/dist/mysite/manage.py runserver'
                 }
       }
   }
 }
