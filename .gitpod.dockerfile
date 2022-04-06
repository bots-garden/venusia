# 🚧 work in progress
FROM gitpod/workspace-full

ARG GO_VERSION="1.17.5"

USER gitpod

#RUN sudo apt install libncurses5 libxkbcommon0 libtinfo5 libnss3-tools -y
RUN sudo apt install libnss3-tools -y

# GoLang
RUN curl -sL https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer| bash

RUN ["/bin/bash", "-c", ". /home/gitpod/.gvm/scripts/gvm && gvm install go${GO_VERSION} -B"]
RUN ["/bin/bash", "-c", ". /home/gitpod/.gvm/scripts/gvm && gvm use go${GO_VERSION}"]

RUN brew install httpie && \
    brew install bat && \
    brew install mkcert

# ------------------------------------
# Install the Suborbital CLI
# ------------------------------------
RUN brew tap suborbital/subo && \
    brew install subo
