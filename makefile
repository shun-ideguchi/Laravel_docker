# laravel version
laravel_version := laravel/laravel=9.*

build:
	docker compose build --no-cache

up:
	docker compose up -d

re-build:
	docker compose up -d --build

web:
	docker compose exec web bash

laravel-install:
	docker compose exec web composer create-project --prefer-dist ${laravel_version} .

init:
	@make build
	@make up
	@make laravel-install
	docker compose exec web chmod -R 777 storage