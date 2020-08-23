FROM python:3.7-alpine

LABEL Author="Frieza"
LABEL version="2.0"
LABEL maintainer="714227638@qq.com"

COPY . /clover

WORKDIR /clover

# tip: http://www.gevent.org/development/installing_from_source.html#general-notes
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories \
    && apk add --no-cache --upgrade bash \
    && apk add --no-cache --virtual build-deps file make gcc musl-dev libffi-dev \
    && pip --no-cache-dir install -r requirements.txt -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com

EXPOSE 5000

CMD gunicorn -c gconfig.py /clover/clover:app && python worker.py

# docker build -t interface:1.0 .
# docker run --name interface -dp 8119:5000 interface:1.0
# docker exec -it <CONTAINER ID> /bin/sh
