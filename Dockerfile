FROM jenkins/jenkins:lts-jdk11
USER root
RUN curl -sSL https://get.docker.com/ | sh
# USER jenkins