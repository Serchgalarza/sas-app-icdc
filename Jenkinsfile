pipeline{
    agent any
    stages{
        stage("verification des outils"){
            steps{
                bat '''
                    docker version 
                    docker info
                    docker compose version
                    curl --version 
                '''
            }
        }
    }
}