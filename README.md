# docker-compose 编排记录

## 1.下载clover源码,并修改mysql配置
```bash
git clone https://github.com/52clover/clover.git
# 目录 datura->clover

# 修改mysql的配置host  clover->config.py
MYSQL = {"host": "mysql"}

# 修改redis的配置host  clover->config.py
REDIS_HOST = {"host": "redis"}

# 复制clover-docker所有文件到clover文件夹下
```

## 2.下载poppy源码
```bash
git clone https://github.com/52clover/poppy.git
# 目录 datura->poppy

# 复制poppy-clover所有文件到clover文件夹下
```

## 3.下载镜像包
```text
1. 下载项目中的datura.tar文件
```

## 4.镜像包安装到本地
```bash
docker load -i datura.tar

# 查看安装的镜像
docker images
```

## 5.启动容器
```bash
docker-compose up -d
```

---
---
---

## clover部署教程--旧

## docker一键部署(适合新手)

<details>
<summary>docker基本用法</summary>
<p> 懂docker基本用法的请路过它 </p>
<code><pre>
# centos 7 安装docker
yum -y install docker
# 启动docker
service docker start
# 查看本地已有的docker镜像
docker images
</pre></code>
</details>

```bash
```

## 手动部署(适合老鸟)

```bash
```

## PS

- 2020.05.27 目前处于测试阶段
