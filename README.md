# Jupyter-Docker-Conda

![Docker Image Size (tag)](https://img.shields.io/docker/image-size/amirpourmand/jupyter-docker-conda/latest)

## Overview

Jupyter-Docker-Conda is a versatile Jupyter environment designed to run within a Docker container, offering seamless kernel switching via Conda. This setup provides you with the flexibility to create isolated Python environments and change Python versions effortlessly. It is based on Debian, enabling easy installation of additional dependencies using apt.

## Getting Started

1. To run Jupyter-Docker-Conda, follow these simple steps:

Pull the Docker image and start a container:

```
docker run -d \
  -p 10000:8888 \
  -v "$(pwd)":/home/app \
  --name my_jupyter_container \
  amirpourmand/jupyter-docker-conda
```

This command will map your current working directory into the Docker container. For added security, consider creating an empty folder called jupyter or another suitable name.

2. Open up your browser to with port 10000 (http://localhost:10000) to see your jupyter notebook.

Password: `docker`

## New Environment

To create and switch to a new Python environment, open a terminal and execute the following commands:

```
conda create -n my_env ipykernel -y
```

or

```
conda create -n my_env ipykernel python=3.8 -y
```

After installation, wait for at most 30 seconds so that your new kernel is added to your jupyter.

Now, you can seamlessly switch between Python environments within your Jupyter notebook.

## Features

- Easy Python version switching
- Effortless isolation of environments
- Based on Debian, allowing straightforward installation of additional packages using apt
- Default Jupyter notebook password: docker
- Root access within the container

Feel free to explore and utilize Jupyter-Docker-Conda for your data science and development needs!
