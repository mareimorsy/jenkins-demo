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

        stage("push") {
            steps {
                echo 'pushing the application...'
                withCredentials([
                    usernamePassword(credentials: 'DOCKERHUB_CREDENTIALS', usernameVariable: USER, passwordVariable: PASS)
                ]){
                    sh "${USER} - ${PASS}"
                }
                // sh 'npm install'
                // sh 'npm build'
            }
        }

        // test
        // deploy
        // cleanup
    }
}