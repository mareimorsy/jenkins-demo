pipeline {
    agent any
    // agent {
    //     docker { image 'node:16.13.1-alpine' }
    // }

    stages {
        
        // checkout

        stage("build") {
            steps {
                echo 'building the application...'
                // sh 'node --version'
                // sh 'npm install'
                // sh 'npm build'

                sh 'docker build -t mareimorsy/realworld-app .'

                // docker.withRegistry('https://registry.hub.docker.com', 'DOCKERHUB_CREDENTIALS') {

                //     def customImage = docker.build("mareimorsy/realworld-app:${env.BUILD_ID}")

                //     /* Push the container to the custom Registry */
                //     customImage.push()
                // }
            }
        }
        
        stage("test") {

            steps {
                // echo 'pushing the application...'
                // echo 'pushing the application...'


                docker.image('mongo:5.0').withRun('-e "MONGO_INITDB_ROOT_USERNAME=admin" -e="MONGO_INITDB_ROOT_PASSWORD=admin"') { c ->
                    // docker.image('mysql:5').inside("--link ${c.id}:db") {
                    //     /* Wait until mysql service is up */
                    //     sh 'while ! mysqladmin ping -hdb --silent; do sleep 1; done'
                    // }
                    docker.image('mareimorsy/realworld-app').withRun('-e "NODE_ENV=production" -e SECRET="prod-secret" -e MONGODB_URI="mongodb://admin:admin@mongodb:27017/conduit?authSource=admin"').inside("--link ${c.id}:db") {
                        /*
                        * Run some tests which require MySQL, and assume that it is
                        * available on the host name `db`
                        */
                        sh 'npm run test'
                    }
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