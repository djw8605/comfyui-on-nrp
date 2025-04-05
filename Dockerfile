FROM gitlab-registry.nrp-nautilus.io/nrp/scientific-images/python:tensorflow-cuda-v1.5.0

RUN mkdir -p /opt/comfyui && \
    git clone https://github.com/comfyanonymous/ComfyUI.git /opt/comfyui


RUN pip install uv && \
    uv pip install jupyter_comfyui_proxy/.
