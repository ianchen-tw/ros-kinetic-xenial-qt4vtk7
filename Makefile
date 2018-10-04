.DEFAULT_GOAL := build

.PHONY: build 
build:
	docker-compose build

.PHONY: publish
publish:
	docker-compose push