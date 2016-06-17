#!/bin/bash

export PETSC_VERSION=3.7.2


# # env. variables

export PETSC_DIR=/opt/petsc-$PETSC_VERSION
export PETSC_ARCH=arch-linux2-c-debug

# # # Update APT and install dependencies and tools
apt-get update && apt-get install -y --no-install-recommends \
			  gcc gfortran \
			  wget curl unzip python pkg-config build-essential \
		          openssh-client openssh-server


# # Download and extract PETSc.
cd /opt
wget --no-verbose http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-lite-$PETSC_VERSION.tar.gz && \
    gunzip -c petsc-lite-$PETSC_VERSION.tar.gz | tar -xof -

cd $PETSC_DIR

# # # Configure and build PETSc 

echo "\n=== Configuring without batch mode\n"

./configure --with-cc=gcc --with-cxx=g++ --with-fc=gfortran --download-fblaslapack --download-mpich &&\
    make all && \
    make test
