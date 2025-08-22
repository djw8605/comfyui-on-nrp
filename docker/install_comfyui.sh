#!/bin/bash
set -e

COMFYUI_HOME="$HOME/ComfyUI"


if [ -d "$COMFYUI_HOME" ]; then
    echo "ComfyUI already installed at $COMFYUI_HOME. Skipping installation."
else
    echo "Installing ComfyUI to $COMFYUI_HOME..."
    git clone https://github.com/comfyanonymous/ComfyUI.git "$COMFYUI_HOME"
    git clone https://github.com/ltdrdata/ComfyUI-Manager "$COMFYUI_HOME/custom_nodes/comfyui-manager"
    uv pip install --system -r "$COMFYUI_HOME/requirements.txt"
fi
