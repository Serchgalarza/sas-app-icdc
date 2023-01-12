pipeline{
    agent any
    stages{
        /*stage("Verification des outils"){
            steps{
                bat '''
                    docker version 
                    docker info
                    docker compose version
                    curl --version 
                '''
            }
        }*/

        stage("Nettoyage du Docker"){
            steps{
                bat 'mvn clean install'
                bat 'docker system prune -a --volumes -f'
            }
        }

        stage("Demarrage du Docker"){
            steps{
                bat 'docker-compose up -d --no-color'
                bat 'docker compose ps -a'
            }
        }
    }

    post {
        always {
            bat 'docker compose down --remove-orphans -v'
            bat 'docker compose ps -a'
            eco 'Buscamos los test'
            junit 'target/surefire-reports/*.xml'
        }
    }
}