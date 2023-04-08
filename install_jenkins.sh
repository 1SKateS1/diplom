
#!/bin/bash

# Update the package list
sudo apt-get update

curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
	  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Install Java Development Kit (JDK)
sudo apt-get install -y default-jdk

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update the package list to include Jenkins
sudo apt-get update

# Install Jenkins
sudo apt-get install -y jenkins

# Start the Jenkins service
sudo systemctl start jenkins

# Enable the Jenkins service to start on system startup
sudo systemctl enable jenkins
