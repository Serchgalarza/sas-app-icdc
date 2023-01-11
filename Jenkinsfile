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

        stage("Nettoyage du Docker"){
            steps{
                bat 'docker system prune -a --volumes -f'
            }
        }

        stage("Démarrage du Docker"){
            steps{
                //bat 'docker compose up -d --no-color --wait'
                bat 'dcoker compose ps -a'
            }
        }
    }
}