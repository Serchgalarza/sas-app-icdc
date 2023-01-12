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
        stage("Construction"){
            steps{
                bat 'mvn clean install'
            }
        }

        stage("Demarrage du Docker"){
            steps{
                echo 'Pruebas docker'
                bat 'docker system prune -a --volumes -f'
                bat 'docker-compose up -d || exit 0'
            }
        }

        stage('Despliegue de Artifact') {
            steps {
                echo 'Creation des artifacts'
                archiveArtifacts artifacts: 'target/users-0.0.1-SNAPSHOT.jar, src/main/ui/', 
                   allowEmptyArchive: true,
                   fingerprint: true,
                   onlyIfSuccessful: true
            }
        }
    }

    post {
        always {
            bat 'docker compose ps -a'
            bat 'docker compose down --remove-orphans -v'
            bat 'docker compose ps -a'
            junit 'target/**/**/*.xml || exit 0 '
        }
    }
}