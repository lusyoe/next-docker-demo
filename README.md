# Docker 多阶段构建示例

本项目已配置好Docker支持，使用Nginx部署静态文件。

## 文件说明

- `Dockerfile`: 多阶段构建的Docker配置文件
- `.dockerignore`: Docker构建时忽略的文件列表
- `next.config.mjs`: 已配置静态导出模式

## 使用方法

### 1. 构建Docker镜像

```bash
# 构建生产镜像
docker build -t next-docker-demo .
```

### 2. 直接运行Docker容器

```bash
# 运行生产容器
docker run -p 80:80 next-docker-demo
```

## 部署特点

- **静态文件部署**: 使用Next.js静态导出，生成纯静态文件

## 最佳实践

1. **多阶段构建**: 使用多阶段构建减小最终镜像大小
2. **静态导出**: 将Next.js应用导出为静态文件，提高性能
4. **安全性**: 配置安全头，使用Alpine Linux基础镜像

## 故障排除

### 构建失败
- 检查网络连接
- 确认所有依赖文件存在
- 查看构建日志

### 容器无法启动
- 检查端口是否被占用
- 确认环境变量配置正确
- 查看容器日志: `docker logs <container_id>`

## 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情。

MIT 许可证允许您：
- 自由使用、修改和分发本软件
- 用于商业和非商业目的
- 在保留原始许可证和版权声明的前提下进行修改

## 贡献

欢迎提交 Issue 和 Pull Request！

1. Fork 本项目
2. 创建您的特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交您的更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 打开一个 Pull Request