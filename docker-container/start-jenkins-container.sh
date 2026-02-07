# run docker container, it return container id
# use container id to get password /var/jenkins_home/secrets/initialAdminPassword
# write password to file jenkins_password.txt

JENKIN_PORT=1010
# first remove all container that created from image that contain jenkins
docker ps -a | grep jenkins | awk '{print $1}' | xargs docker rm -f

# run docker container, it return container id
container_id=$(docker run -d -p $JENKIN_PORT:8080 -p 50000:50000 jenkins:2.60.3)
echo "Container ID: $container_id" >> jenkins_container_id.txt

# do a loop to check if /var/jenkins_home/secrets/initialAdminPassword exist
# if no exist loop again, else terminate the loop
while [ ! $(docker exec -i $container_id bash -c 'ls /var/jenkins_home/secrets/initialAdminPassword') ]; do
    echo "Waiting for Jenkins to start..."
    sleep 0.5
done



# use container id to get password /var/jenkins_home/secrets/initialAdminPassword
# write password to file jenkins_password.txt
docker exec -i $container_id bash -c 'cat /var/jenkins_home/secrets/initialAdminPassword' > jenkins_password.txt


