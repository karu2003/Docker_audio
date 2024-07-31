# syntax=docker/dockerfile:1
ARG _DEV_CONTAINERS_BASE_IMAGE=placeholder

# FROM python:latest
FROM mcr.microsoft.com/devcontainers/python:0-3.11

WORKDIR /app

RUN apt update \
    && apt -y install --no-install-recommends \
    git python3-tk libfftw3-3 libhdf5-dev libnetcdf-dev libfftw3-dev python3-sklearn python3-pyfftw portaudio19-dev\
    python3-numpy python3-pyfftw alsa-utils  alsa-oss libasound2 libasound2-dev libsndfile1 libsndfile1-dev \
    libasound2-dev

RUN pip install --upgrade pip

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt && \
    rm /tmp/requirements.txt
    
COPY requirements-dev.txt /tmp/requirements-dev.txt
RUN pip install -r /tmp/requirements-dev.txt && \
    rm /tmp/requirements-dev.txt    