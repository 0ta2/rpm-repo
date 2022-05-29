.DEFAULT_GOAL := help

build: ## docker compose build
	docker compose build --no-cache --force-rm

init: ## Initialize the setup.
	@make build
	rm -fr repodata
	docker compose run createrepo createrepo /tmp/rpms/

update: ## Update the metafile.
	docker compose run createrepo createrepo --update /tmp/rpms/

up: ## docker compose up.
	docker compose up -d
down: ## docker compose down.
	docker compose down
ps: ## docker compose ps.
	docker compose ps

createrepo: ## docker compose exec createrepo.
	docker compose exec createrepo bash

help: ## Self-documented Makefile.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
  	| sort \
    | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
