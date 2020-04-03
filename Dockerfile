FROM nvidia/cuda:8.0-cudnn7-devel-ubuntu16.04

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
ENV PATH /opt/conda/bin:$PATH

RUN apt-get update --fix-missing && \
    apt-get install -y wget bzip2 ca-certificates curl git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-4.3.27-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda clean -tipsy && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

ENV PATH /opt/conda/bin:$PATH

RUN conda install pytorch==0.4 torchvision==0.2
RUN pip install cython cffi opencv-python scipy==1.1.0 msgpack easydict matplotlib pyyaml tensorboardX pillow==6
RUN conda install gxx_linux-64
RUN apt-get update
RUN apt-get install -y libsm6 libxext6 libxrender-dev


WORKDIR /code/
