FROM nvidia/cuda:8.0-cudnn7-devel-ubuntu16.04
FROM continuumio/miniconda3:4.8.2

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

RUN pip install cython cffi opencv-python scipy msgpack easydict matplotlib pyyaml tensorboardX pillow==6.0
