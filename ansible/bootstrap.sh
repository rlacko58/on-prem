#!/usr/bin/env bash

# This script creates a Python env, enters it and installs
# ansible and requirements from the requirements.galaxy.yaml

[[ ! -d .venv ]] && python3 -m venv .venv
source .venv/bin/activate

pip3 install -r requirements.txt

ansible-galaxy install "$1" -r requirements.galaxy.yaml

# to stay in our comfy virtualenv
exec "${SHELL:bash}"
