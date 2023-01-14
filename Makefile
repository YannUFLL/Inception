SRC = srcs/docker-compose.yml 
DOCKER=$(shell docker ps -a -q)
IMAGES=$(shell docker images -a -q)

all: run

re : clean build

logs:
	docker-compose -f ${SRC} logs -f -t

run :
	docker-compose -f ${SRC} up
down :
	docker-compose -f ${SRC} down
stop :
	docker-compose -f ${SRC} stop
build :
	docker-compose -f ${SRC} build

clean : down 
	docker volume prune -f

fclean :
	docker rm -f $(DOCKER)
	docker system prune -a -f
	docker rmi $(IMAGES)

.PHONY: up down stop build clean flcean all logs
