#!/bin/bash

sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    wget curl \
    gnupg-agent \
    software-properties-common \
    vim \
    gcc g++ make \
    git \
    python3 python3-dev python3-pip \
    snapd \
    default-jdk \
    zsh
