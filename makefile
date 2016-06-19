#Using a line command, we can get a ready virtual machine with Docker.
#         $ sudo docker run -d -h node01 --name cont01 centos:mpi /usr/sbin/sshd –D

#After the container was up, you can get the IP address of container using “docker inspect”.
#         $ sudo docker inspect -f "{{ .NetworkSettings.IPAddress }}" cont01

#         $ export MPI_ROOT=/opt/ibm/platform_mpi/

#         $ $MPI_ROOT/bin/mpicc hello_world.c -o hello_world

#         $ $MPI_ROOT/bin/mpirun -np 4 -hostlist node01,node02,node03,node04 ./hello_world

.DEFAULT_GOAL := help

help:
	@echo "Use \`make <target>\` where <target> is one of"
	@echo "  help     to display this help message"
	@echo "  network_test  test Docker networking"


network_test:
	docker network create --driver bridge network1
	docker network inspect network1

	# # provision cluster 
	docker pull ocramz/mpich-docker
	docker run -d --net=network1 -h node01 --name node01cont ocramz/mpich-docker
	docker run -d --net=network1 -h node02 --name node02cont ocramz/mpich-docker

	# the two new containers should now appear in the Docker `bridge` network:
	docker network inspect network1

network_test_rm:
	docker stop node01cont
	docker stop node02cont
	docker rm node01cont
	docker rm node02cont
	docker network rm network01


