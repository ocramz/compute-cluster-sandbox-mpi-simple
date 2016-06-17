#!/bin/bash

# # # Update APT and install dependencies and tools
apt-get update && apt-get install -y --no-install-recommends \
			  wget curl unzip python pkg-config build-essential \
		          openssh-client openssh-server


# # Download and extract PETSc.
wget --no-verbose http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-lite-$PETSC_VERSION.tar.gz && \
    gunzip -c petsc-lite-$PETSC_VERSION.tar.gz | tar -xof -

# # # Configure and build PETSc 

echo "\n=== Configuring without batch mode\n"

./configure --with-cc=gcc --with-cxx=g++ --with-fc=gfortran --download-fblaslapack --download-mpich &&\
    make all && \
    make test
