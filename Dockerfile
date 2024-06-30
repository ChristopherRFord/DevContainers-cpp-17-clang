FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    gdb \
    meson \
    clang \
    clang-format \
    lldb \
    git \
    wget \
    unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


RUN mkdir -p /workspace/.vscode
RUN mkdir -p /workspace/TestBench

COPY Content/vscode /workspace/.vscode/
COPY Content/meson.build /workspace/
COPY Content/TestBench /workspace/TestBench

ENV CC=clang
ENV CXX=clang++

WORKDIR /workspace
SHELL ["/bin/bash", "-c"]
