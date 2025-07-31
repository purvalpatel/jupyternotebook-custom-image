How to create custom image which works with jupyter notebook:
------------------------------------------------------------
Below packages are required in any image:
```
RUN apt update && apt install -y python3 python3-pip && \
    pip3 install notebook jupyterhub jupyterlab
```
```
RUN mkdir /etc/work
RUN mkdir /etc/jupyterhub-singleuser
RUN chmod 0777 /etc/jupyterhub-singleuser

RUN echo 'jovyan ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
WORKDIR /home/jovyan
```
And below command should run on startup of pod:
`exec jupyterhub-singleuser --ip="$IP" --port="$NOTEBOOK_PORT" "$@" &`





Create Docker image from this Dockerfile:
`docker build -t docker.xxxx.xxxx/xxxx/nvidia_environment:0.7 .`

Push Docker imahe on hub:
`docker push docker.xxxx.xxxx/xxxx/nvidia_environment:0.7`

You can use this image jupyter notebook.

