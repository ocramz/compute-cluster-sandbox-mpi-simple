#Using a line command, we can get a ready virtual machine with Docker.
#         $ sudo docker run -d -h node01 --name cont01 centos:mpi /usr/sbin/sshd –D
#After the container was up, you can get the IP address of container using “docker inspect”.
#         $ sudo docker inspect -f "{{ .NetworkSettings.IPAddress }}" cont01
