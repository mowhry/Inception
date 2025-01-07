NAME = my_project

.PHONY: build up down clean re

build:
	docker-compose build
up:
	docker-compose up -d

down:
	docker-compose down

clean: down
	docker volume prune -f

re: clean build up
