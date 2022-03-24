pipeline {
    // agent any
    agent {
        docker { image 'node:16.13.1-alpine' }
    }

    stages {
        
        // checkout

        stage("build") {
            steps {
                echo 'building the application...'
                sh 'node --version'
                // sh 'npm install'
                // sh 'npm build'
            }
        }

        // test
        // deploy
        // cleanup
    }
}