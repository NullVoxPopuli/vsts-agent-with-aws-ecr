# https://github.com/developertown/vsts-agent 
FROM developertown/vsts-agent

USER root

RUN apt-get update -qq && \
    apt-get install -y \
      wget \
      make

RUN wget https://storage.googleapis.com/golang/go1.8.1.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.8.1.linux-amd64.tar.gz && \
    echo 'export GOPATH=/usr/local/go/bin' >> ~/.profile && \
    echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.profile
    
RUN . ~/.profile && \
    cd /usr/local/go/bin && \
    mkdir -p src/github.com/awslabs/ && \
    cd src/github.com/awslabs/ && \
    git clone https://github.com/awslabs/amazon-ecr-credential-helper.git && \
    cd amazon-ecr-credential-helper && \
    make
    
RUN echo 'PATH=$PATH:/usr/local/go/bin/local/docker-credential-ecr-login' >> ~/.profile && \
    mkdir ~/.docker && echo '{"credsStore": "ecr-login"}' >> ~/.docker/config.json

# re-added because of the user switch, and for explicitness
USER vsts
WORKDIR /usr/local/vsts-agent
CMD ./start.sh
