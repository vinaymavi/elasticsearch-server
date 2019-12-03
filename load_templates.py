# This script is used to load all templates defined in 
# `/usr/share/elasticsearch/templates` directory 
import os
import json
import requests;

TEMPLATE_DIR = "/usr/share/elasticsearch/templates";
HOST = "http://127.0.0.1:9200"
# Read json files
files = []
for r, d, f in os.walk(TEMPLATE_DIR):
    for file in f:
        if '.json' in file:
            files.append(os.path.join(r, file))

print("******** Template Files ************");

for f in files:
    print(f);

print("*************************************\n\n");

print("Template uploading start....\n\n");
# Upload templates
for f in files:
    with open(f) as json_file:
        data = json.load(json_file);
        headers = {'Content-Type': 'application/json'};
        print("URL = {}/_template/{}?pretty".format(HOST,data['name']));
        resp = requests.post("{}/_template/{}?pretty".format(HOST,data['name']),data=json.dumps(data['template']),headers=headers);
        print("Request Status = {}".format(resp.status_code));

print("Template uploading end\n");

print("******** Elastic Server Template List ************");

resp = requests.get("{}/_template/?pretty".format(HOST));
resp_json = resp.json();

for template in resp_json.keys():
    print(template);

