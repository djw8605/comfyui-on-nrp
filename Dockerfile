FROM gitlab-registry.nrp-nautilus.io/nrp/scientific-images/python:tensorflow-cuda-v1.5.0

RUN mkdir -p /home/workspace/comfyui && \
    git clone https://github.com/comfyanonymous/ComfyUI.git /home/workspace/comfyui

ENV COMFYUI_PATH=/home/workspace/ComfyUI
ENV PATH="$PATH:$COMFYUI_PATH"

RUN pip install uv && \
    uv pip install jupyter_comfyui_proxy/.


