pipeline {
    agent any
    // agent {
    //     docker { image 'node:16.13.1-alpine' }
    // }

    stages {

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

                sh '''
                    docker-compose up -d

                    # Wait for mongodb to be up
                    IS_MONGO_UP=false
                    while "$IS_MONGO_UP" == false ;do
                        MONGO_STATUS=$(lsof -i:27017)
                        if ! -z "$MONGO_STATUS" ;then
                            IS_MONGO_UP=true
                        fi
                        echo $MONGO_STATUS
                    done

                    sleep 5

                    docker exec -t realworld-app sh -c 'npm run test'
                    '''
            }
        }

        stage("Push") {

            steps {
                echo 'Push the docker image to dockerhub...'
                withCredentials([
                    usernamePassword(credentialsId: 'DOCKERHUB_CREDENTIALS', usernameVariable: 'USER', passwordVariable: 'PASS')
                ]){
                    sh "docker login --username ${USER} --password ${PASS}"
                    sh "docker push mareimorsy/realworld-app:${env.BUILD_ID}"
                }
            }
        }


    }
}