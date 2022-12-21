DOCKER_COMPOSE = docker compose
DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yml

all:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up -d --build

clean:
	$(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down
	@docker system prune -af
	@docker volume rm $$(docker volume ls -q)
	@docker network rm $$(docker network ls -q)

re:
	$(MAKE) clean
	$(MAKE) all

.PHONY: all clean re
