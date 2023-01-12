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
                //bat 'docker system prune -a --volumes -f'
                //sh 'docker-compose up -d --no-color'
                //bat 'docker compose ps -a'
            }
        }

        stage('Despliegue de Artifact') {
            steps {
                echo 'Creation des artifacts'
                archiveArtifacts artifacts: 'target/users-0.0.1-SNAPSHOT.jar', 
                   allowEmptyArchive: true,
                   fingerprint: true,
                   onlyIfSuccessful: true

                archiveArtifacts artifacts: 'src/main/ui/', 
                   allowEmptyArchive: true,
                   fingerprint: true,
                   onlyIfSuccessful: true
            }
        }
    }

    post {
        always {
            //bat 'docker compose down --remove-orphans -v'
            //bat 'docker compose ps -a'
            echo 'Buscamos los test'
            junit '**/**/*.xml'
        }
    }
}