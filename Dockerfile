# 构建阶段
# FROM node:20-alpine AS builder
FROM registry.cn-hangzhou.aliyuncs.com/lusyoe/node:20-alpine AS builder

WORKDIR /app

# 复制依赖文件
COPY package*.json ./

# 安装所有依赖
RUN npm config set registry http://registry.npmmirror.com && npm install

# 复制源代码
COPY . .

# 构建静态文件
RUN npm run build

# 生产阶段 - 使用 Nginx
# FROM nginx:alpine
FROM registry.cn-hangzhou.aliyuncs.com/lusyoe/nginx:alpine

# 复制构建的静态文件到Nginx目录
COPY --from=builder /app/out /usr/share/nginx/html

# 复制自定义Nginx配置（可选）
# COPY nginx.conf /etc/nginx/nginx.conf

# 暴露端口
EXPOSE 80

# 启动Nginx
CMD ["nginx", "-g", "daemon off;"]