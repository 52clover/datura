# 镜像制作过程记录

## 1.下载前端项目源码
```bash
git clone https://github.com/52clover/poppy.git
```

## 2.编写Dockerfile
```text
TIP: 因为Dockerfile有两个FROM所以会产生一个none none的中间镜像,此镜像就是node的编译镜像
```

## 3.编写.dockerignore

## 4.编译制作镜像
```bash
docker build -t poppy:2.0 .
```

## 5.运行部署镜像(创建容器运行)
```bash
docker run --name poppy -dp 8080:80 poppy:2.0
```

## 6.镜像打包
```bash
docker save poppy:2.0 > poppy.tar
```

## 7.服务器上传镜像文件并运行部署
```bash
docker load < poppy.tar
docker run --name poppy -dp 8080:80 poppy:2.0
```
