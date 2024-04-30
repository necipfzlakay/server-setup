# Use the official Jenkins LTS image as the base image
FROM jenkins/jenkins:lts

# Switch to the root user to install additional software
USER root

# Install Docker CLI dependencies
RUN apt-get update && \
  apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg \
  lsb-release

# Add Docker GPG key and repository
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# Install Docker CLI
RUN apt-get update && \
  apt-get install -y docker-ce-cli

# Switch back to the Jenkins user
# USER jenkins

# Install Jenkins plugins (if needed)
# Example: RUN /usr/local/bin/install-plugins.sh plugin-name1 plugin-name2

# Set Jenkins environment variables (if needed)
# Example: ENV JENKINS_HOME /var/jenkins_home

# Expose Jenkins port
EXPOSE 8080

# Start Jenkins
CMD ["/usr/local/bin/jenkins.sh"]













# # Use the official Jenkins image as the base image
# FROM jenkins/jenkins:lts

# # Switch to root user to install additional packages
# USER root

# # Install necessary tools and Docker
# RUN apt-get update && \
#   apt-get install -y apt-transport-https \
#   ca-certificates \
#   curl \
#   gnupg2 \
#   software-properties-common && \
#   curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
#   add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
#   apt-get update && \
#   apt-get install -y docker-ce docker-ce-cli containerd.io && \
#   rm -rf /var/lib/apt/lists/*

# # Add the Jenkins user to the docker group
# # RUN sudo groupadd docker
# # RUN sudo usermod -aG docker $USER
# # RUN sudo usermod -aG docker jenkins



# # Switch back to the Jenkins user
# # USER jenkins

# # Skip initial setup wizard
# ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false