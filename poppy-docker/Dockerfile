FROM node
COPY ./ /poppy
WORKDIR /poppy
RUN npm config set registry https://registry.npm.taobao.org --global \
    && npm install && npm run build

FROM nginx
RUN mkdir /dist
COPY --from=0 /poppy/dist /dist
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

# docker build . -t interface_client:1.0
# docker run -d -p 8080:80 interface_client:1.0

# 因为有两个FROM所以会产生一个none none的中间镜像,此镜像就是node的编译镜像


########################直接部署 无打包环节##############################################
# FROM nginx
# COPY /build /build
# COPY nginx.conf /etc/nginx/nginx.conf
