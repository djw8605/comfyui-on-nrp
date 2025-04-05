FROM gitlab-registry.nrp-nautilus.io/nrp/scientific-images/python:tensorflow-cuda-v1.5.0

USER root

RUN mkdir -p /opt/comfyui && \
    git clone https://github.com/comfyanonymous/ComfyUI.git /opt/comfyui

ENV COMFYUI_PATH=/opt/comfyui/ComfyUI
ENV PATH="$PATH:$COMFYUI_PATH"

RUN pip install uv && \
    uv pip install jupyter_comfyui_proxy/.


