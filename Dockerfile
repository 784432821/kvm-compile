FROM ubuntu:22.04

LABEL maintainer="liusheng build" \
    description="kvm Docker image"

WORKDIR /root

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list

RUN apt-get clean && apt-get update
RUN apt-get install -y make cmake python3 python3-pip
RUN pip3 install meson ninja pyelftools -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com

RUN apt-get install -y pkg-config curl wget

ENV LANG C.UTF-8
RUN echo 'alias ll="ls -l"' >> /root/.bashrc

RUN apt-get install -y libncurses5-dev libncursesw5-dev libnuma-dev libpq-dev
RUN apt-get install -y automake pciutils gdb vim sysstat linux-tools-common
RUN apt-get install -y numactl git iproute2
RUN apt-get install -y libgstreamer1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-tools
RUN apt-get install -y net-tools tftpd-hpa bison flex postgresql-client libedit-dev
COPY ./librockchip_mpp.so /usr/lib/aarch64-linux-gnu/
COPY ./libgstrockchipmpp.so /usr/lib/aarch64-linux-gnu/gstreamer-1.0/
RUN apt-get install -y monit
RUN apt-get install -y libtool libpng-dev
