pipeline{
    agent any

    stages{
        stage("Verification des outils"){
            steps{
                sh '''
                    docker version 
                    docker info
                    docker compose version
                    curl --version 
                '''
            }
        }
        stage("Deploiement"){
            steps{
                sh 'mvn clean install'
                sh 'docker system prune -a --volumes -f'
            }
        }

        stage("Demarrage de Docker"){
            steps{
                sh 'docker-compose up -d || exit 0'
                sh 'docker compose ps -a'
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
                sh 'docker compose down --remove-orphans -v'
                sh 'docker compose ps -a'
            }
        }
    }

    post {
        always {
            junit(testResults: 'target/surefire-reports/*.xml', allowEmptyResults : true)
        }
    }
}
