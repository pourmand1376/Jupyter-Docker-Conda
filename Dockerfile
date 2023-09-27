FROM bitnami/minideb:latest

RUN apt-get update && apt-get install -y wget git curl nano vim htop && rm -rf /var/lib/apt/lists/*

RUN useradd -m -u 1000 user
USER user
ENV HOME=/home/user \
    PATH=/home/user/.local/bin:${PATH}
WORKDIR ${HOME}/app

ENV PATH="${HOME}/miniconda3/bin:${PATH}"
ARG PATH="${HOME}/miniconda3/bin:${PATH}"

RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir ${HOME}/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh

RUN conda install nb_conda nb_conda_kernels

RUN conda install -c conda-forge jupyterlab

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
