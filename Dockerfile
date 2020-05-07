#Load Elastic search image
FROM docker.elastic.co/elasticsearch/elasticsearch:6.8.8
#Install pip
RUN yum install python-devel -y
RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN pip install requests
# Set container user
USER elasticsearch
#Setup configurations
WORKDIR /usr/share/elasticsearch
COPY ./templates templates
COPY ./entrypoint.sh .
COPY ./load_templates.py .
ENTRYPOINT [ "/usr/share/elasticsearch/entrypoint.sh" ]