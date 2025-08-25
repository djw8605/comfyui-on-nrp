#!/bin/bash
set -e

LOGFILE="/home/$NB_USER/comfyui_install_script.log"
exec > >(tee -a "$LOGFILE") 2>&1

COMFYUI_HOME="/home/$NB_USER/ComfyUI"


if [ -d "$COMFYUI_HOME" ]; then
    echo "ComfyUI already installed at $COMFYUI_HOME. Skipping installation."
else
    echo "Installing ComfyUI to $COMFYUI_HOME..."
    sudo -u $NB_USER git clone https://github.com/comfyanonymous/ComfyUI.git "$COMFYUI_HOME"
    sudo -u $NB_USER git clone https://github.com/ltdrdata/ComfyUI-Manager "$COMFYUI_HOME/custom_nodes/comfyui-manager"
    sudo chown -R $NB_USER:$NB_USER "$COMFYUI_HOME"
fi

# Find pip or pip3 location
if command -v pip &>/dev/null; then
    PIP_CMD=$(command -v pip)
elif command -v pip3 &>/dev/null; then
    PIP_CMD=$(command -v pip3)
elif [ -f "/opt/conda/bin/pip" ]; then
    PIP_CMD="/opt/conda/bin/pip"
elif [ -f "/usr/local/bin/pip3" ]; then
    PIP_CMD="/usr/local/bin/pip3"
else
    echo "pip or pip3 not found. Please install pip."
    exit 1
fi

export PATH="$(dirname "$PIP_CMD"):$PATH"

# Install packages again to ensure all are installed correctly
sudo -u $NB_USER "$PIP_CMD" install uv
sudo -u $NB_USER uv pip install --system -r "$COMFYUI_HOME/requirements.txt"
