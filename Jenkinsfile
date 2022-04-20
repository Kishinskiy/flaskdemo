pipeline {
    agent any
    options {
        timestamps()
        timeout(time: 1, unit: 'HOURS')
        buildDiscarder(logRotator(artifactDaysToKeepStr: '7', artifactNumToKeepStr: '10', daysToKeepStr: '7', numToKeepStr: '50'))
    }
    environment {
        registry = "kishinskiy/flaskdemo"
        registryCredential = 'dockerhub_id'
        dockerImage = ''
        POSTGRES_DB="flask_db"
        PGDATA="/data/postgres"
        PORT="80"
        DEBUG="False"
    }

    stages {
       stage("Building image") {
           steps{
               script{
                  docker.withRegistry( '', registryCredential ) {
                      def dockerImage = docker.build "kishinskiy/flaskdemo:latest"
                      dockerImage.push()
                  }
               }
           }
       }
    }


    post {
        always {
            cleanWs disableDeferredWipeout: true, deleteDirs: true
        }
    }
}
