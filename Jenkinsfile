pipeline{
    agent any
    stages{
        stage("Verification des outils"){
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

        stage("Demarrage du Docker"){
            steps{
                //bat 'docker compose up -d --no-color --wait'
                bat 'docker compose ps -a'
            }
        }
    }

    post {
        always {
            bat 'docker compose down --remove-orphans -v'
            bat 'docker compose ps -a'
        }
    }
}