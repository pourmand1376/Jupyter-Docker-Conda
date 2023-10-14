# Jupyter-Docker-Conda

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/amirpourmand/jupyter-docker-conda/latest)
![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/pourmand1376/Jupyter-Docker-Conda/deploy-image.yaml)

## Overview

Jupyter-Docker-Conda is a versatile Jupyter environment designed to run within a Docker container, offering seamless kernel switching via Conda. This setup provides you with the flexibility to create isolated Python environments and change Python versions effortlessly. It is based on Debian, enabling easy installation of additional dependencies using apt.

This is very useful if you are on a shared server and you don't want (or you don't have permission) to mess around with system dependencies.

## Getting Started

1. To run Jupyter-Docker-Conda, follow these simple steps:

Pull the Docker image and start a container:

```
docker run -d \
  -p 10000:8888 \
  -v "$(pwd)":/home/user/app \
  --name my_jupyter_container \
  amirpourmand/jupyter-docker-conda
```

or to run it always in the startup:
```
docker run -d \
  -p 10000:8888 \
  -v "$(pwd)":/home/user/app \
  --name my_jupyter_container \
  --restart unless-stopped \ 
  amirpourmand/jupyter-docker-conda
```

This command will map your current working directory into the Docker container. For added security, consider creating an empty folder called jupyter or another suitable name.

2. Open up your browser to with port 10000 (http://localhost:10000) to see your jupyter notebook.

Password: `docker`

## New Environment

To create and switch to a new Python environment, open a terminal (inside Jupyter Launcher) and execute the following commands:

```
conda create -n my_env ipykernel -y
```

or

```
conda create -n my_env ipykernel python=3.8 -y
```

After installation, wait for ~30 seconds so that your new kernel is added to your jupyter.

Now, you can seamlessly switch between Python environments within your Jupyter notebook.

> Note: It is important to install ipykernel. Otherwise, you can not choose kernel from the Jupyter notebook.

## Using Apt install (Sudo Permission)

If you need sudo permission, there are several ways.

1. if you don't care about security considerations, you can use `-u 0` or `--user 0` argument to run the container as root at the beginning.

```
docker run -d -u 0 \
  -p 10000:8888 \
  -v "$(pwd)":/home/user/app \
  --name my_jupyter_container \
  amirpourmand/jupyter-docker-conda
```

2. If you have a running container, you can also access the root via:

```
docker exec -it -u 0 my_jupyter_container bash
```

## Features

- Easy Python version switching
- Effortless isolation of environments
- Based on Debian, allowing straightforward installation of additional packages using apt
- Default Jupyter notebook password: docker
- Root access within the container (non-default)
- Build with security in mind
- Very Simple to work with.

Feel free to explore and utilize Jupyter-Docker-Conda for your data science and development needs!
