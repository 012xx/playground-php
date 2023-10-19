init:
	make build && make up && make composer-install && mkdir -p htdocs/public/uploads
build:
	docker-compose build
up:
	docker-compose up -d
down:
	docker-compose down
playground-php:
	docker exec -it playground-php bash
playground-mysql:
	docker exec -it playground-mysql bash
composer-install:
	docker exec playground-php composer install
dump-autoload:
	docker exec playground-php composer dump-autoload
migrate:
	docker exec playground-php vendor/bin/phinx migrate -e development