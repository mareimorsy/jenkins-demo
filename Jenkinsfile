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
                    usernamePassword(credentialsId: 'DOCKERHUB_CREDENTIALS', usernameVariable: 'USER', passwordVariable: 'PASS')
                ]){
                    sh "${USER} - ${PASS}"
                }

                // withCredentials([usernamePassword(credentialsId: 'DOCKERHUB_CREDENTIALS', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                // // available as an env variable, but will be masked if you try to print it out any which way
                // // note: single quotes prevent Groovy interpolation; expansion is by Bourne Shell, which is what you want
                // sh 'echo $PASSWORD'
                // // also available as a Groovy variable
                // echo USERNAME
                // // or inside double quotes for string interpolation
                // echo "username is $USERNAME"
                // }
                // sh 'npm install'
                // sh 'npm build'
            }
        }

        // test
        // deploy
        // cleanup
    }
}