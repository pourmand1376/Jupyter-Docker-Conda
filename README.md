# Jupyter-Docker-Conda

![Docker Image Size (tag)](https://img.shields.io/docker/image-size/amirpourmand/jupyter-docker-conda/latest)

A Jupyter Environment which is run on docker and you can easily change kernels via conda

To run it:

```
docker run -d \
  -p 10000:8888 \
  -v "$(pwd)":/home/app \
  --name my_jupyter_container \
  amirpourmand/jupyter-docker-conda
```

> Note that this command will map your current directory into docker container. It is recommended to create an empty folder called `jupyter` or something if you want to be more secure.

To install new python environment and switch to it.

Open up terminal.

```
conda create -n my_env python=3.11
```

Then:

```
python -m ipykernel install --user --name my_env
```
