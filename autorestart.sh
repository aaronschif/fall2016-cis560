#!/bin/bash

watchmedo auto-restart -R -i '**/venv/**;__pycache__;*.pyc*;**/.git/**' -- ./run.py
