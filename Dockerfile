FROM ubuntu:latest
RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip
WORKDIR /NFS/workspaces/swmoon/workspace/Jenkins
COPY mlcode/code.py .
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
CMD ["python3", "./code.py"]