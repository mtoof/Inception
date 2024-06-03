# Project Readme

This project is about advanced use of docker containers include networks, volumes and services.The entire project must be implemented within a virtual machine using Docker Compose. Here are the main requirements:

- Each Docker image must have the same name as its corresponding service.
- Each service has to run in a dedicated container.
- Containers must be built from either the penultimate stable version of Alpine or Debian.
- Write your own Dockerfiles, one per service, and call them in your docker-compose.yml using your Makefile.
- Set up the following:
  - NGINX container with only TLSv1.2 or TLSv1.3.
  - WordPress + php-fpm container without NGINX.
  - MariaDB container without NGINX.
  - Volumes for WordPress database and website files.
  - Docker network for inter-container communication.
- Containers must restart in case of a crash.
- Avoid using hacky patches based on 'tail -f' or similar commands.
- Prohibit the use of network: host, --link, or links:.
- Avoid using commands running an infinite loop as entrypoints or in entrypoint scripts.
- Configure domain name to point to local IP address.
- Prohibit the use of latest tag in Dockerfiles.
- No passwords in Dockerfiles; use environment variables.
- Use a .env file to store environment variables.
- NGINX container should be the only entrypoint via port 443 with TLSv1.2 or TLSv1.3 protocol.

```
├── srcs
│   ├── docker-compose.yml
│   ├── .env
│   ├── requirements
│   │   ├── mariadb
│   │   │   ├── Dockerfile
│   │   │   ├── .dockerignore
│   │   │   ├── conf
│   │   │   │   └── (configuration files)
│   │   │   └── tools
│   │   │       └── (additional tools/scripts)
│   │   ├── nginx
│   │   │   ├── Dockerfile
│   │   │   ├── .dockerignore
│   │   │   ├── conf
│   │   │   │   └── (configuration files)
│   │   │   └── tools
│   │   │       └── (additional tools/scripts)
│   │   └── wordpress
│   │       ├── Dockerfile
│   │       └── tools
│   │           └── (additional tools/scripts(Wordpress configuration included in the script file))
├── Makefile
```

# How to run the project
- Clone the repository to your virtual machine.
- Run the command `make up` to build the images and start the containers.

# How to test the project
- Open your web browser and go to the domain name you configured in your .env file.
