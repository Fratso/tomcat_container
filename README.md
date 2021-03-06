# Tomcat container with some web vulnerabilities

A docker compose example project with a MySQL and a Tomcat container linked together.

## Requirement
- Docker
- Docker-compose

## Run
Feel free to open and adapt the launch.sh script to meet your needs.
To run: 
	$ ./launch.sh


## Description
Host ports:
8002: tomcat
8001: mysql

Containers:
- MySQL: on startup, the container executes a simple database initialisation script `./db/mysql-init.sql`, which
  creates a database containing a single table which is populated with a few records.
- Tomcat: a simple web application, located within `./tomcat/webapps`, is deployed. The application is a war file so you access your app through 127.0.0.1:8002/app\_name. Notice that the war file is generated through the launch.sh script.

ATTENTION: This project come with known vulnerabilities. I decline all responsability in any use of this project. See it as a learning project.

This Docker-compose is here for learning purpose only and may contains vulnerabilities.

### Tips
Some build/src files may be overwrite on startup. Make sure to modify the build/adapt\_this files in consequences.

## Source
Inspired by https://github.com/dmulligan/docker-example-tomcat-mysql to make the docker-compose.
