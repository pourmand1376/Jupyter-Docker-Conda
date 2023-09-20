FROM bitnami/minideb:latest

ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp/

RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh 

RUN conda install nb_conda nb_conda_kernels

RUN conda install -c conda-forge jupyterlab

ENV JUPYTER_PORT=8888 \
    TOKEN=docker 

EXPOSE $JUPYTER_PORT

WORKDIR /home/app

COPY entry_point.sh /entry/entry_point.sh

CMD ["/entry/entry_point.sh"]