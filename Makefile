.DEFAULT_GOAL := help

up:
	docker compose up -d
down:
	docker compose down

createrepo:
	docker compose exec createrepo bash

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
  	| sort \
    | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
