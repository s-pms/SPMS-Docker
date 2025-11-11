# SPMS 一键部署指南

## 部署说明

本项目支持通过 Docker Compose 进行一键部署，包含以下服务：
- SpringBoot 后端服务
- Vue3 前端服务（通过 Nginx 部署）
- MySQL 数据库服务
- Redis 缓存服务

## 端口映射

| 服务             | 容器端口 | 映射端口 | 访问地址              |
| ---------------- | -------- | -------- | --------------------- |
| 前端(Nginx)      | 80       | 80       | http://localhost      |
| 后端(SpringBoot) | 8080     | 8080     | http://localhost:8080 |
| 数据库(MySQL)    | 3306     | 3306     | localhost:3306        |
| 缓存(Redis)      | 6379     | 6379     | localhost:6379        |

## 部署步骤

### 1. 环境准备

确保已安装以下软件：
- Docker
- Docker Compose

### 2. 执行一键部署

```bash
# 给部署脚本添加执行权限
chmod +x deploy.sh

# 执行一键部署
./deploy.sh
```

### 3. 访问应用

部署完成后，可以通过以下地址访问：
- 前端界面：http://localhost
- 后端API：http://localhost:8080
- 数据库：localhost:3306 (用户: spms, 密码: spms)
- Redis：localhost:6379
