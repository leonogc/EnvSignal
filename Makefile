
.PHONY: setup
setup:
	@docker-compose build

.PHONY: build
build:
	@docker-compose up --build

.PHONY: start
start:
	@docker-compose up

.PHONY: db
db:
	@docker-compose up envsignal_db_1

.PHONY: start-bash
start-bash:
	@docker-compose exec envsignal_web_1 bash


.PHONY: stop
stop:
	@docker-compose down

.PHONY: clean
clean:
	@docker-compose stop
	@docker-compose rm -f

.PHONY: migrate
migrate:
	@docker-compose run web rails db:migrate
