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
        stage("Deploiement"){
            steps{
                bat 'mvn clean install'
                bat 'docker system prune -a --volumes -f'
            }
        }

        stage("Demarrage de Docker"){
            steps{
                bat 'docker-compose up -d || exit 0'
                bat 'docker compose ps -a'
            }
        }

        stage('Deployment Artifact') {
            steps {
                echo 'Creation des artifacts'
                archiveArtifacts artifacts: 'target/users-0.0.1-SNAPSHOT.jar, src/main/ui/', 
                   allowEmptyArchive: true,
                   fingerprint: true,
                   onlyIfSuccessful: true
            }
        }

        stage("Nettoyage de Docker"){
            steps{
                bat 'docker compose down --remove-orphans -v'
                bat 'docker compose ps -a'
            }
        }
    }

    post {
        always {
            junit(testResults: 'target/surefire-reports/*.xml', allowEmptyResults : true)
        }
    }
}