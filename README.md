# ComfyUI on JupyterHub

This repository builds a JupyterHub-compatible Docker image that installs [ComfyUI](https://github.com/comfyanonymous/ComfyUI) and [ComfyUI-Manager](https://github.com/ltdrdata/ComfyUI-Manager) into each user's home directory at Jupyter startup.

## Features

- **Automatic Installation:**
  On container startup, ComfyUI and ComfyUI-Manager are installed in the user's home directory if not already present. This ensures a fresh environment for each user and avoids redundant installations.

- **JupyterHub Integration:**
  The image is designed for use with JupyterHub. It leverages the built-in JupyterHub proxy to route connections to the ComfyUI service, allowing seamless access from the JupyterHub interface.

- **User Isolation:**
  Each user's ComfyUI installation is isolated in their own home directory, supporting multi-user environments.

## How It Works

- On container startup, a script checks for the presence of ComfyUI in the user's home directory.
- If not found, it clones both ComfyUI and ComfyUI-Manager and installs required Python dependencies using [`uv`](https://github.com/astral-sh/uv) for fast, reliable installation.
- The JupyterHub proxy is used to forward connections to the ComfyUI service, making it accessible through the JupyterHub interface.

## Usage

1. Build the Docker image from this repository.
2. Deploy it as a JupyterHub user image.
3. On first login, ComfyUI and ComfyUI-Manager will be installed automatically for each user.

## Notes

- The installation script runs as the JupyterHub user (`NB_USER`) to ensure correct permissions.
- All installation logs are saved to `~/comfyui_install_script.log` for troubleshooting.

## License

See individual component repositories for their respective licenses.
