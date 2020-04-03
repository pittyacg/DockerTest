# TensorFlow 1.14, Python3.7, cuda and cuDNN (GPU) 
# and some extra packages (opencv, scipy, sklearn, etc)

FROM nvidia/cuda:8.0-cudnn7-runtime-ubuntu16.04
FROM continuumio/miniconda3


USER root

# install packages
RUN conda create -n env python=3.6
RUN echo "source activate env" > ~/.bashrc
ENV PATH /opt/conda/envs/env/bin:$PATH

RUN conda install pytorch=0.4.0 torchvision=0.2 numpy
RUN pip install cython cffi opencv-python scipy msgpack easydict matplotlib pyyaml tensorboardX pollow=6.0

WORKDIR /code/
