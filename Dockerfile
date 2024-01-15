FROM python:3.10-bookworm
LABEL authors="90houlaoheshang"

WORKDIR /usr/src/app

RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip config set install.trusted-host pypi.tuna.tsinghua.edu.cn
RUN pip install tb-nightly==2.16.0a20240111 -i https://mirrors.aliyun.com/pypi/simple
RUN apt-get update
RUN apt-get install libgl1-mesa-glx -y

COPY . .
RUN python install.py --torch cuda --onnxruntime cuda
RUN rm -rf ./*

