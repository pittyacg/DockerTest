# TensorFlow 1.14, Python3.7, cuda and cuDNN (GPU) 
# and some extra packages (opencv, scipy, sklearn, etc)

FROM nvidia/cuda:8.0-cudnn7-devel-ubuntu16.04
FROM continuumio/miniconda3


USER root
SHELL ["/bin/bash", "-c"]

RUN apt-get update -qq \
 && apt-get install -y --no-install-recommends\
    software-properties-common \
    gcc \
	g++\
	wget\
	make \
	zlib1g \
	zlib1g-dev \
	build-essential \
	openssl \
	curl \
	libssl-dev \
	libffi-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
 
# install python 3.7.5
RUN wget https://www.python.org/ftp/python/3.6.0/Python-3.6.0.tgz 
RUN tar -xvf Python-3.6.0.tgz 
RUN cd Python-3.6.0 \
	&& ./configure \
	&& make \
	&& make install

# install pip3
RUN curl https://bootstrap.pypa.io/get-pip.py | python3

# install numpy
RUN python3.6 -m pip install numpy

RUN pip3 install cython cffi opencv-python scipy msgpack easydict matplotlib pyyaml tensorboardX pillow==6.0
