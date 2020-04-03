# TensorFlow 1.14, Python3.7, cuda and cuDNN (GPU) 
# and some extra packages (opencv, scipy, sklearn, etc)

FROM nvidia/cuda:8.0-cudnn7-runtime-ubuntu16.04
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
 
# install packages
RUN conda create -n torch python=3.6
#RUN conda activate torch

RUN echo "source activate torch" > ~/.bashrc
ENV PATH /opt/conda/envs/env/bin:$PATH

RUN conda install pytorch=0.4.0 torchvision=0.2
RUN pip install cython cffi opencv-python scipy msgpack easydict matplotlib pyyaml tensorboardX pillow==6.0

WORKDIR /code/
