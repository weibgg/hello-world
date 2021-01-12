# 拉取代码
git pull

# 安装依赖和打包
npm install --registry=https://registry.npm.taobao.org/ && npm run build

# 删除容器(nginx是自己启动的nginx的镜像名称对应docker ps结果中的NAMES字段)
docker rm -f nginx &> /dev/null

# 避免停止还未成功休眠5秒
sleep 5

# 启动容器(次写法后此脚本只能放在/opt/apps/hello-world中执行否则找不到项目中的dist文件夹)
docker run -d --restart=on-failure:5 -p 8080:80 -v $PWD/dist:/usr/share/nginx/html --name nginx nginx
# --restart=on-failure:5：在容器非正常退出时重启容器，最多5次
