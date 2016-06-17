#Using a line command, we can get a ready virtual machine with Docker.
#         $ sudo docker run -d -h node01 --name cont01 centos:mpi /usr/sbin/sshd –D

#After the container was up, you can get the IP address of container using “docker inspect”.
#         $ sudo docker inspect -f "{{ .NetworkSettings.IPAddress }}" cont01

#         $ export MPI_ROOT=/opt/ibm/platform_mpi/

#         $ $MPI_ROOT/bin/mpicc hello_world.c -o hello_world

#         $ $MPI_ROOT/bin/mpirun -np 4 -hostlist node01,node02,node03,node04 ./hello_world
