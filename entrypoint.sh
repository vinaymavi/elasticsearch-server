#!/bin/sh
#Enable job control
set -m
#Print OS details
echo "************OS Details************"
cat /etc/os-release

echo "************Python Details********"
python --version
pip --version
echo "***********************************"
echo "Running server"

elasticsearch &
ES_PID=$!

# Run load template script
python load_templates.py

# Bring Elastic server to forground
echo "Bring Elastic Server to forground"
fg
