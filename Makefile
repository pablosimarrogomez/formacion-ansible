build:
	docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down

.PHONY: build up down
