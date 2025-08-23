#FROM gitlab-registry.nrp-nautilus.io/nrp/scientific-images/python:tensorflow-cuda-v1.5.0
FROM quay.io/jupyter/pytorch-notebook:cuda12-latest


USER root

ENV COMFYUI_PATH=/home/$NB_USER/ComfyUI
ENV PATH="$PATH:$COMFYUI_PATH"
ENV COMFYUI_SESSION_TIMEOUT=600

ADD jupyter_comfyui_proxy /home/extensions/jupyter_comfyui_proxy
RUN pip install uv /home/extensions/jupyter_comfyui_proxy/.

# Add comfyui install script
ADD docker/install_comfyui.sh /usr/local/bin/install_comfyui.sh
RUN chmod +x /usr/local/bin/install_comfyui.sh

# Configure Jupyter to run comfyui install script at startup
RUN mkdir -p /usr/local/bin/start-notebook.d
ADD docker/install_comfyui.sh /usr/local/bin/start-notebook.d/install_comfyui.sh
RUN chmod +x /usr/local/bin/start-notebook.d/install_comfyui.sh


USER $NB_USER
