#!/bin/bash
set -e

LOGFILE="/home/$NB_USER/comfyui_install_script.log"
exec &> "$LOGFILE"

COMFYUI_HOME="/home/$NB_USER/ComfyUI"


if [ -d "$COMFYUI_HOME" ]; then
    echo "ComfyUI already installed at $COMFYUI_HOME. Skipping installation."
else
    echo "Installing ComfyUI to $COMFYUI_HOME..."
    sudo -u $NB_USER git clone https://github.com/comfyanonymous/ComfyUI.git "$COMFYUI_HOME"
    sudo -u $NB_USER git clone https://github.com/ltdrdata/ComfyUI-Manager "$COMFYUI_HOME/custom_nodes/comfyui-manager"
    sudo chown -R $NB_USER:$NB_USER "$COMFYUI_HOME"
fi

# Install packages again to ensure all are installed correctly
sudo -u $NB_USER uv pip install --system -r "$COMFYUI_HOME/requirements.txt"
