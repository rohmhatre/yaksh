#### Pre-Requisites

	1. Fresh installed ubuntu 16.04.
	2. root user permissions to run commands.


#### Help for deploying Yaksh interface.

	- To get help while deployment
		$ make help

	- Clone yaksh from github:
		$ make clone

	- Pulll docker images:
		$ make pull

	- To run containers:
		$ make start

	- You need to create super a user to work with yaksh:
		$ make createsuperuser

	- Now Your interface is ready. You can access it using browser just go to http://localhost:8000

	- Clean your docker containers:
		$ make clean

	- other utilities like restart, tail, status
