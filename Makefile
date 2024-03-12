all:up

up:
	@docker-compose -f srcs/docker-compose.yml up -d --build

down:
	@docker-compose -f srcs/docker-compose.yml down

status:
	@docker-compose -f srcs/docker-compose.yml ps

start:
	@docker-compose -f srcs/docker-compose.yml start
stop:
	@docker-compose -f srcs/docker-compose.yml stop

.PHONY: all up down status start stop