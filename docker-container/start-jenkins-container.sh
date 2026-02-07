#!/bin/bash
# Description: Start Jenkins Docker container and retrieve admin password
# Usage: bash start-jenkins-container.sh
# Output: Creates jenkins_container_id.txt and jenkins_password.txt

set -e

JENKINS_PORT=1010

echo "Removing old Jenkins containers..."
docker ps -a | grep jenkins | awk '{print $1}' | xargs -r docker rm -f || true

echo "Starting Jenkins container..."
container_id=$(docker run -d -p "$JENKINS_PORT:8080" -p 50000:50000 jenkins:2.60.3)
echo "Container ID: $container_id" | tee jenkins_container_id.txt

echo "Waiting for Jenkins to initialize..."
# Wait for the password file to be created
while ! docker exec -i "$container_id" bash -c 'test -f /var/jenkins_home/secrets/initialAdminPassword' 2>/dev/null; do
    echo "  Still waiting..."
    sleep 2
done

echo "Retrieving admin password..."
docker exec -i "$container_id" bash -c 'cat /var/jenkins_home/secrets/initialAdminPassword' > jenkins_password.txt

echo ""
echo "Jenkins started successfully!"
echo "  Container ID: $container_id"
echo "  Access Jenkins at: http://localhost:$JENKINS_PORT"
echo "  Admin password saved to: jenkins_password.txt"
cat jenkins_password.txt


