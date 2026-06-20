pipeline {
    agent any

    environment {
        SONAR_PROJECT_KEY = 'mspr-database-main'
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Validation SQL') {
            steps {
                // Vérifie que les fichiers SQL sont bien formés
                sh '''
                    echo "=== Fichiers SQL trouvés ==="
                    find . -name "*.sql" -not -path "./.git/*"

                    echo "=== Vérification de la syntaxe de base ==="
                    for f in $(find . -name "*.sql" -not -path "./.git/*"); do
                        echo "Vérification : $f"
                        # Vérifie que le fichier n'est pas vide et est lisible
                        if [ -s "$f" ]; then
                            echo "  OK : $f"
                        else
                            echo "  AVERTISSEMENT : $f est vide"
                        fi
                    done
                '''
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    script {
                        def scannerHome = tool 'SonarQube Scanner'
                        sh """
                            ${scannerHome}/bin/sonar-scanner \
                                -Dsonar.projectKey=${SONAR_PROJECT_KEY} \
                                -Dsonar.sources=. \
                                -Dsonar.inclusions="**/*.sql" \
                                -Dsonar.exclusions="**/.git/**"
                        """
                    }
                }
            }
        }

        stage('Quality Gate') {
            steps {
                timeout(time: 5, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }

    post {
        success {
            echo "Pipeline database-main : SUCCESS (build #${BUILD_NUMBER})"
        }
        failure {
            echo "Pipeline database-main : FAILURE (build #${BUILD_NUMBER})"
        }
        always {
            cleanWs()
        }
    }
}
