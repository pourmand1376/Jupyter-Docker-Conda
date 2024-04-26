FROM ubuntu
# if you want to use GPU, you only need to change from Image and provide your own NVIDIA CUDA base Image
# FROM nvidia/cuda:12.0.1-cudnn8-devel-ubuntu22.04

RUN apt-get update && apt-get install -y wget git curl nano vim htop nodejs && rm -rf /var/lib/apt/lists/*

# change default shell to bash
RUN ln -sf /bin/bash /bin/sh

# installing Nodejs is necessary for jupyterlab to work correctly

RUN useradd -m -u 1000 user

RUN groupadd -g 1000 user \
  && useradd --create-home --no-log-init -u 1000 -g 1000 user

USER user

ENV HOME=/home/user \
    PATH=/home/user/.local/bin:${PATH}

WORKDIR ${HOME}/app

ENV PATH="${HOME}/miniconda3/bin:${PATH}"
ARG PATH="${HOME}/miniconda3/bin:${PATH}"


RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-py311_24.1.2-0-Linux-x86_64.sh \
    && mkdir ${HOME}/.conda \
    && bash Miniconda3-py311_24.1.2-0-Linux-x86_64.sh -b \
    && rm -f Miniconda3-py311_24.1.2-0-Linux-x86_64.sh

RUN conda install nb_conda_kernels -y

RUN conda install -c conda-forge jupyterlab ipywidgets -y

ENV JUPYTER_PORT=8888 \
    TOKEN=docker \
    SHELL=/bin/bash \
    PATH="${HOME}/miniconda3/bin:${PATH}"

# install oh-my-bash
RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

RUN conda init bash

RUN echo "export PATH=$PATH" >> ${HOME}/.bashrc

EXPOSE $JUPYTER_PORT

WORKDIR ${HOME}/app

COPY --chown=1000 entry_point.sh /entry/entry_point.sh

CMD ["/entry/entry_point.sh"]
