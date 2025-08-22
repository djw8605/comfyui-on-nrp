#FROM gitlab-registry.nrp-nautilus.io/nrp/scientific-images/python:tensorflow-cuda-v1.5.0
FROM quay.io/jupyter/pytorch-notebook:cuda12-latest


USER root

ENV COMFYUI_PATH=/opt/ComfyUI
ENV PATH="$PATH:$COMFYUI_PATH"
ENV COMFYUI_SESSION_TIMEOUT=600


RUN mkdir -p $COMFYUI_PATH && \
    git clone https://github.com/comfyanonymous/ComfyUI.git $COMFYUI_PATH && \
    chown -R $NB_USER: $COMFYUI_PATH


ADD jupyter_comfyui_proxy /home/extensions/jupyter_comfyui_proxy
RUN pip install uv /home/extensions/jupyter_comfyui_proxy/. && \
  uv pip install --system -r $COMFYUI_PATH/requirements.txt

# Install comfy ui manager
RUN git clone https://github.com/ltdrdata/ComfyUI-Manager $COMFYUI_PATH/custom_nodes/comfyui-manager

USER $NB_USER
