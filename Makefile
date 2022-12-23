DOCKER_COMPOSE = docker compose
DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yml

all:
	mkdir -p ${HOME}/data/wordpress
	mkdir -p ${HOME}/data/database
	sudo $(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) up -d --build --force-recreate

clean:
	sudo $(DOCKER_COMPOSE) -f $(DOCKER_COMPOSE_FILE) down -v --rmi all --remove-orphans

fclean: clean
	@sudo rm -rf ${HOME}/data
	@sudo docker system prune -af
	@sudo docker volume prune -f
	@sudo docker network prune -f

re:
	$(MAKE) fclean
	$(MAKE) all

.PHONY: all clean fclean re
