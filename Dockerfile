FROM jenkins/jenkins:lts
# Copies [first file, the local one] to [second path/file this place in the container]
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
# COPY jenkins.yaml /var/jenkins_conf/jenkins.yaml

ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false"
ENV JENKINS_USER admin
ENV JENKINS_PASS admin
ENV DOCKERVERSION=18.03.1-ce
# ENV CASC_JENKINS_CONFIG /var/jenkins_conf

# Run from Root
USER root

# Update linux
RUN apt-get update
# Install maven
RUN apt-get install -y maven

# Stop running from Root
USER jenkins

# Install Plugins
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt