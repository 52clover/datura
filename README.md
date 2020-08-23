# Docker部署

```bash
# 1. 下载本项目的 datura/docker部署 文件夹下所有内容
# 2. dockerb部署文件下的文件说明
#   2.1 datura20.tar: docker镜像包
#   2.2 docker-compose.yml: docker镜像容器编排文件
# 3. 安装docker镜像: docker load -i datura20.tar
# 4. 启动docker容器: docker-compose up -d  (TIP: docker-compose命令和docker-compose.yml文件相同目录)
##############################################################################
# 5. 进入clover容器手动启动gunicorn服务: gunicorn -c gconfig.py clover:app

# 6. 127.0.0.1:8080即可访问服务
# 7. 修改8080端口的方式:
#   7.1 编辑docker-compose.yml文件
#   7.2 poppy
#         ports:
#           - "xxxx:80"
```
