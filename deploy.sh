#!/bin/bash

# SPMS 一键部署脚本
# 包含网络错误容错处理

git clone https://github.com/s-pms/SPMS-Web.git
git clone https://github.com/s-pms/SPMS-Server.git

echo "开始部署SPMS系统..."

# 检查Docker是否安装
if ! command -v docker &> /dev/null
then
    echo "错误: 未检测到Docker，请先安装Docker"
    exit 1
fi

# 检查Docker Compose是否安装
if ! command -v docker-compose &> /dev/null
then
    echo "错误: 未检测到Docker Compose，请先安装Docker Compose"
    exit 1
fi

echo "正在停止并删除已存在的容器..."
docker-compose down

# 检查是否需要清理数据库卷（通过参数传递）
if [ "$1" = "--clean" ]; then
    echo "清理数据库和Redis数据卷..."
    docker-compose down -v
fi

# 拉取镜像（带重试机制和国内镜像源）
pull_image_with_retry() {
    local image=$1
    local retries=3
    local count=0
    
    until [ $count -ge $retries ]
    do
        echo "正在拉取镜像: $image (尝试 $((count+1))/$retries)"
        if docker pull $image; then
            echo "成功拉取镜像: $image"
            return 0
        else
            count=$((count+1))
            if [ $count -ge $retries ]; then
                echo "警告: 拉取镜像失败 $retries 次，尝试使用国内镜像源..."
                # 使用国内镜像源重试
                case $image in
                    "mysql:8.0")
                        if docker pull registry.docker-cn.com/mysql:8.0; then
                            docker tag registry.docker-cn.com/mysql:8.0 mysql:8.0
                            echo "成功使用国内镜像源拉取: $image"
                            return 0
                        fi
                        ;;
                    "redis:7-alpine")
                        if docker pull registry.docker-cn.com/redis:7-alpine; then
                            docker tag registry.docker-cn.com/redis:7-alpine redis:7-alpine
                            echo "成功使用国内镜像源拉取: $image"
                            return 0
                        fi
                        ;;
                    "node:20-alpine")
                        if docker pull registry.docker-cn.com/node:20-alpine; then
                            docker tag registry.docker-cn.com/node:20-alpine node:20-alpine
                            echo "成功使用国内镜像源拉取: $image"
                            return 0
                        fi
                        ;;
                    "nginx:alpine")
                        if docker pull registry.docker-cn.com/nginx:alpine; then
                            docker tag registry.docker-cn.com/nginx:alpine nginx:alpine
                            echo "成功使用国内镜像源拉取: $image"
                            return 0
                        fi
                        ;;
                    "maven:3.9.6-amazoncorretto-17")
                        if docker pull registry.cn-hangzhou.aliyuncs.com/zhuyali/maven:3.9.6-amazoncorretto-17; then
                            docker tag registry.cn-hangzhou.aliyuncs.com/zhuyali/maven:3.9.6-amazoncorretto-17 maven:3.9.6-amazoncorretto-17
                            echo "成功使用国内镜像源拉取: $image"
                            return 0
                        fi
                        ;;
                    "amazoncorretto:17-alpine")
                        if docker pull registry.cn-hangzhou.aliyuncs.com/zhuyali/amazoncorretto:17-alpine; then
                            docker tag registry.cn-hangzhou.aliyuncs.com/zhuyali/amazoncorretto:17-alpine amazoncorretto:17-alpine
                            echo "成功使用国内镜像源拉取: $image"
                            return 0
                        fi
                        ;;
                esac
                
                echo "错误: 无法拉取镜像 $image"
                return 1
            else
                echo "拉取失败，等待10秒后重试..."
                sleep 10
            fi
        fi
    done
}

# 预拉取基础镜像（可选步骤，提高成功率）
echo "预拉取基础镜像..."
pull_image_with_retry "mysql:8.0" || echo "MySQL镜像拉取失败，将在构建时重试"
pull_image_with_retry "redis:7-alpine" || echo "Redis镜像拉取失败，将在构建时重试"
pull_image_with_retry "node:20-alpine" || echo "Node镜像拉取失败，将在构建时重试"
pull_image_with_retry "nginx:alpine" || echo "Nginx镜像拉取失败，将在构建时重试"
pull_image_with_retry "maven:3.9.6-amazoncorretto-17" || echo "Maven镜像拉取失败，将在构建时重试"
pull_image_with_retry "amazoncorretto:17-alpine" || echo "Amazon Corretto镜像拉取失败，将在构建时重试"

echo "开始构建并启动所有服务..."
# 使用分步构建方式提高成功率
echo "1. 构建服务镜像..."
if docker-compose build; then
    echo "服务镜像构建成功！"
else
    echo "服务镜像构建失败，请检查错误日志"
    echo "尝试使用 --parallel 参数重新构建..."
    if docker-compose build --parallel; then
        echo "服务镜像并行构建成功！"
    else
        echo "服务镜像并行构建也失败了"
        exit 1
    fi
fi

echo "2. 启动所有服务..."
if docker-compose up -d; then
    echo "服务启动成功！"
else
    echo "服务启动失败，请检查错误日志"
    echo "查看详细日志请运行: docker-compose logs"
    exit 1
fi

# 等待服务启动
echo "等待服务启动..."
sleep 20

# 检查各服务状态
echo "检查服务状态:"
docker-compose ps

echo ""
echo "部署完成！"
echo "访问地址:"
echo "  前端页面: http://localhost:81"
echo "  后端API:  http://localhost:8081"
echo "  数据库:   localhost:3307"
echo "  Redis:    localhost:6380"
echo ""
echo "默认数据库用户: spms / spms"
echo "默认数据库root用户: root / root"
