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
# wait server to bootstrap
echo "Waiting...."
sleep 60

# print Elastic Server details
echo "********* Elastic Server Details **********"
curl 127.0.0.1:9200

# Run load template script
python load_templates.py

# Bring Elastic server to forground
echo "Bring Elastic Server to forground"
fg
