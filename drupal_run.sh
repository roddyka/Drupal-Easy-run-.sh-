#!/bin/bash

# This is a start to clean if you was running this before and give to you a cleanner instalation again
# Stop docker containers with this names
# mysql
docker stop meu-mysql
# Drupal
docker stop meu-drupal 

# Remove the network with this name
docker network rm drupal-network

# Remove the containers
docker rm meu-mysql
docker rm meu-drupal


# Create network Docker
docker network create drupal-network

# Run MySQL Container
docker run --name meu-mysql \
           -e MYSQL_ROOT_PASSWORD=drupal \
           -e MYSQL_DATABASE=drupal \
           -e MYSQL_USER=drupal \\
           -e MYSQL_PASSWORD=drupal \
           -d --network drupal-network mysql:latest

# Run Drupal Container
docker run -d \
           -p 8080:80 \
           --name meu-drupal \
           --network drupal-network \
           drupal:latest

# # Wait the drupal start
sleep 5

# # You can copy now some content to your Drupal modules folder
docker cp ./modules/my-module meu-drupal:/var/www/html/modules/
