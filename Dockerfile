#FROM gitlab-registry.nrp-nautilus.io/nrp/scientific-images/python:tensorflow-cuda-v1.5.0
FROM quay.io/jupyter/pytorch-notebook:latest


USER root

RUN mkdir -p /opt/comfyui && \
    git clone https://github.com/comfyanonymous/ComfyUI.git /opt/comfyui

ENV COMFYUI_PATH=/opt/comfyui
ENV PATH="$PATH:$COMFYUI_PATH"

ADD jupyter_comfyui_proxy /home/extensions/jupyter_comfyui_proxy
RUN pip install uv /home/extensions/jupyter_comfyui_proxy/. && \
  uv --system pip install -r /opt/comfyui/requirements.txt

USER $NB_USER
