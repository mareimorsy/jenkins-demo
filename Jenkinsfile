pipeline {
    agent any
    // agent {
    //     docker { image 'node:16.13.1-alpine' }
    // }

    stages {
        
        // checkout

        stage("Build") {
            steps {
                echo 'building the application...'
                sh "docker build -t mareimorsy/realworld-app:${env.BUILD_ID} ."

                // docker.withRegistry('https://registry.hub.docker.com', 'DOCKERHUB_CREDENTIALS') {

                //     def customImage = docker.build("mareimorsy/realworld-app:${env.BUILD_ID}")

                //     /* Push the container to the custom Registry */
                //     customImage.push()
                // }
            }
        }
        
        stage("Test") {

            steps {
                echo 'Testing the application...'

                sh 'sleep 65'

                // sh '''
                //     docker-compose up -d

                //     # Wait for mongodb to be up
                //     IS_MONGO_UP=false
                //     while "$IS_MONGO_UP" == false ;do
                //         MONGO_STATUS=$(lsof -i:27017)
                //         if ! -z "$MONGO_STATUS" ;then
                //             IS_MONGO_UP=true
                //         fi
                //         echo $MONGO_STATUS
                //     done

                //     sleep 5

                //     docker exec -t realworld-app sh -c 'npm run test'
                //     '''
            }
        }

        stage("Push") {

            steps {
                echo 'Push the docker image to dockerhub...'
                withCredentials([
                    usernamePassword(credentialsId: 'DOCKERHUB_CREDENTIALS', usernameVariable: 'USER', passwordVariable: 'PASS')
                ]){
                    sh "docker login -u ${USER} --password-stdin ${PASS}"
                    sh "docker push mareimorsy/realworld-app:${env.BUILD_ID}"
                }
            }
        }

        // stage("push") {
        //     agent {
        //         docker { image 'node:16.13.1-alpine' }
        //     }
        //     steps {
        //         echo 'pushing the application...'
        //         // withCredentials([
        //         //     usernamePassword(credentialsId: 'DOCKERHUB_CREDENTIALS', usernameVariable: 'USER', passwordVariable: 'PASS')
        //         // ]){
        //         //     sh "${USER} - ${PASS}"
        //         //     sh "docker push mareimorsy/realworld-app:1 "
        //         // }

        //         // withCredentials([usernamePassword(credentialsId: 'DOCKERHUB_CREDENTIALS', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
        //         // // available as an env variable, but will be masked if you try to print it out any which way
        //         // // note: single quotes prevent Groovy interpolation; expansion is by Bourne Shell, which is what you want
        //         // sh 'echo $PASSWORD'
        //         // // also available as a Groovy variable
        //         // echo USERNAME
        //         // // or inside double quotes for string interpolation
        //         // echo "username is $USERNAME"
        //         // }
        //         // sh 'npm install'
        //         // sh 'npm build'
        //     }
        // }

        // test
        // deploy
        // cleanup
    }
}