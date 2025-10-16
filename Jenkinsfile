pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                // Add your build commands here
                // For example: sh 'make'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                // Add your test commands here
                // For example: sh 'make test'
            }
        }
    }

    post {
        always {
            echo 'Pipeline completed'
        }
    }
}