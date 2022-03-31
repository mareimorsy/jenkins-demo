# SRE challenge

## Deliverables

* [Dockerfile](Dockerfile) & [docker-compose](docker-compose.yaml)
```
docker-compose up --build
```
Here's a screenshot for the tests running locally using docker-compose
![Pipeline tests](images/tests.png)
* [Jenkins File](Jenkinsfile)

I ran jenkins in docker inside my local machine as following
```
docker run --name jenkins -p 8080:8080 -p 50000:50000 --group-add 0 -v /home/marei/jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock jenkins-in-docker
```
also Installed the following plugins
* Git
* Credentials
* Credentials Binding Plugin
* Docker plugin
* Docker Pipeline
* CloudBees Docker Build and Publish plugin

also added the following credentials to be used later in the pipelines
![Jenkins Credentials](images/credentials.png)
Here's a screenshot when tests are running in the `Test`` stage in the pipeline
![Pipeline tests](images/pipeline-tests.png)
Here's a screenshot when all pipelines succeed
![Pipeline tests](images/all-pipelines.png)

* Here's all [k8s manifests](k8s/), in order to create them, just run the following command
```
kubectl create -f k8s/
```
* install [nginx ingress controller](https://docs.nginx.com/nginx-ingress-controller/installation/installation-with-manifests/)
* Place your domain name in the [k8s ingress file](k8s/ingress.yaml) before you apply it.

if you're running minikube you should enable the ingress addon like this
```
minikube addons enable ingress
```