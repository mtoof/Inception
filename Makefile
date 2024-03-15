all:up

up:
	mkdir -p /home/mtoof/wordpress_data
	mkdir -p /home/mtoof/mariadb_data
	@docker-compose -f srcs/docker-compose.yml up -d --build

down:
	@docker-compose -f srcs/docker-compose.yml down --volumes --rmi all
	@docker system prune -f -a --volumes --all

status:
	@docker-compose -f srcs/docker-compose.yml ps

start:
	@docker-compose -f srcs/docker-compose.yml start
stop:
	@docker-compose -f srcs/docker-compose.yml stop

# Usage:
re: down up

.PHONY: all up down status start stop