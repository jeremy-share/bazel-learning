FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN     apt-get update \
    &&  apt-get install -y \
            wget \
            make \
            nano \
            build-essential \
            pylint \
            python3 \
            python3-pip

RUN       mkdir -p /opt/bin \
      &&  wget -O /opt/bin/bazelisk https://github.com/bazelbuild/bazelisk/releases/download/v1.20.0/bazelisk-linux-amd64 \
      &&  ln -s /opt/bin/bazelisk /opt/bin/bazel \
      &&  chmod 777 /opt/bin/* \
      &&  chmod +x /opt/bin

ENV PATH="$PATH:/opt/bin/"

RUN     bazel --version

RUN       mkdir /.cache \
      &&  chmod 777 /.cache
