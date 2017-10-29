help:
	@echo "Docker Compose Help for Deploying Yaksh interface"
	@echo  "-----------------------"
	@echo ""
	@echo "Clone yaksh for github:"
	@echo "    make clone"
	@echo ""
	@echo "Pull docker images:"
	@echo "    make pull"
	@echo ""
	@echo "To run containers:"
	@echo "    make start"
	@echo ""
	@echo "You need to create super user in order to work with yaksh:"
	@echo "    make createsuperuser"
	@echo ""
	@echo "Now Your interface is ready. You can access it using browser just go to http://localhost:8000"
	@echo ""
	@echo "Really, really start over:"
	@echo "    make clean"
	@echo ""
	@echo "other utilities:restart,tail,status"

begin: migrate fixtures start


clone:
	@/bin/bash clone-yaksh.sh

start:
	@docker-compose up -d

stop:
	@docker-compose stop

status:
	@docker-compose ps

restart: stop start

clean: stop
	@docker-compose rm --force

pull:
	@docker-compose pull

createsuperuser: migrate superuser

migrate:
	@docker exec -it yaksh_django python3 manage.py makemigrations
	@docker exec -it yaksh_django python3 manage.py migrate

superuser:
	@docker exec -it yaksh_django python3 manage.py createsuperuser
	@docker exec -it yaksh_django python3 manage.py add_group
	@docker exec -it yaksh_django python3 manage.py collectstatic
	@echo "You can access it using browser, just go to http://localhost:8000"

tail:
	@docker-compose logs -f

.PHONY: clone start stop status restart clean pull migrate tail superuser createsuperuser
