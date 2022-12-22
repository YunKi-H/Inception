DOCKER_COMPOSE = docker compose
DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yml

all:
	mkdir -p /home/yuhwang/data/wordpress
	mkdir -p /home/yuhwang/data/database
	sudo $(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up -d --build

clean:
	sudo $(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down
	@sudo docker system prune -af
	@sudo docker volume rm $$(docker volume ls -q)
	@sudo docker network rm $$(docker network ls -q)

re:
	$(MAKE) clean
	$(MAKE) all

.PHONY: all clean re
