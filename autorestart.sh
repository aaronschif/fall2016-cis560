#!/bin/bash

watchmedo auto-restart -R -i 'venv;__pycache__;*.pyc*' -- ./run.py
