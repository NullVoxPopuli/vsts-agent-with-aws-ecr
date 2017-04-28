# https://github.com/developertown/vsts-agent
# FROM developertown/vsts-agent
FROM microsoft/vsts-agent:ubuntu-16.04-tfs-2017-docker-17.03.0-ce-standard

#USER root

RUN apt-get update -qq && \
    apt-get install -y \
      wget \
      make \
      awscli

RUN wget https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.8.1.linux-amd64.tar.gz

ENV GOPATH=/usr/local/go/bin
ENV PATH=$PATH:/usr/local/go/bin

RUN cd /usr/local/go/bin && \
    mkdir -p src/github.com/awslabs/ && \
    mkdir -p local && \
    cd src/github.com/awslabs/ && \
    git clone https://github.com/awslabs/amazon-ecr-credential-helper.git && \
    cd amazon-ecr-credential-helper && \
    make && \
    mv ./bin/local/docker-credential-ecr-login /usr/local/go/bin/local/

ENV PATH=$PATH:/usr/local/go/bin/local/

RUN mkdir ~/.docker && echo '{"credsStore": "ecr-login"}' >> ~/.docker/config.json
