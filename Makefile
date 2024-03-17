all:up

up:
	@if ! sudo grep -q "127.0.0.1 mtoof.42.fr" /etc/hosts; then \
    	echo "127.0.0.1 mtoof.42.fr" | sudo tee -a /etc/hosts; \
	fi
	mkdir -p /home/mtoof/data/wordpress_data
	mkdir -p /home/mtoof/data/mariadb_data
	@docker compose -f srcs/docker-compose.yml up -d --build

down:
	@docker compose -f srcs/docker-compose.yml down --volumes --rmi all
	@docker system prune -f -a --volumes --all
	@sudo rm -rf /home/mtoof/data

status:
	@docker compose -f srcs/docker-compose.yml ps

start:
	@docker compose -f srcs/docker-compose.yml start
stop:
	@docker compose -f srcs/docker-compose.yml stop

# Usage:
re: down up

.PHONY: all up down status start stop