#!/bin/bash
set -e
# Default values
NOTEBOOK_PORT=${NOTEBOOK_PORT:-8888}
IP=${IP:-0.0.0.0}

mkdir -p /home/jovyan/work
mkdir -p /home/jovyan/jupyterhub-singleuser
chown jovyan:jovyan /home/jovyan/work
chown jovyan:jovyan /home/jovyan/jupyterhub-singleuser
chmod 0777 /home/jovyan/work
chmod 0777 /home/jovyan/jupyterhub-singleuser

# Optional: activate conda/env or custom user logic here

# Execute the notebook server
echo "`date` Starting notebook"
exec jupyterhub-singleuser --ip="$IP" --port="$NOTEBOOK_PORT" "$@" &

# Keep the container running
tail -f /dev/null &
