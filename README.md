# Jupyter-Docker-Conda

A Jupyter Environment which is run on docker and you can easily change kernels via conda

To install new python environment and switch to it.

Open up terminal.

```
conda create -n my_env python=3.11
```

Then

```
python -m ipykernel install --user --name my_env2
```
