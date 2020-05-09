# 1. Redis

> 非关系数据库，不支持SQL语言

## 1. 安装

### 1.linux下安装

+ 下载

  ```shell
  wget http://download.redis.io/releases/redis-6.0.1.tar.gz # redis-6.0.1.tar.gz是redis当前版本，网站肯定会更新版本
  ```

+ 解压

  ```shell
  tar -zxvf redis-6.0.1.tar.gz 
  ```

+ 编译

  > cd redis-6.0.1

  ```shell
  make
  ```

+ 测试

  ```shell
  sudo make test
  ```

+ 安装

  ```shell
  sudo make install
  ```

+ 配置文件移到`/usr/local/etc/`

  ```shell
  sudo cp redis.conf /usr/local/etc/
  ```

+ 运行

  ```shell
  sudo redis-server /usr/local/etc/redis.conf
  ```

### 2.windows下安装

+ 下载地址

  ```shell
  https://github.com/MSOpenTech/redis/releases
  ```

+ redis路径添加到系统环境变量里

+ 运行

  ```shell
  redis-server.exe redis.windows.conf
  # 或者 redis-server
  # redis.windows.conf这个可以省略
  ```

## 2. 配置

+ 绑定IP

  > 如果需要远程访问，可将此行注释，或绑定一个真实IP

  ```shell
  bind 127.0.0.1
  ```

+ 端口

  > 默认为6379

  ```shell
  port 6379
  ```

+ 守护进程

  >如果以守护进程运行，则不会再命令行阻塞，类似于服务
  >
  >如果以非守护进程运行，则当前终端被阻塞
  >
  >设置为yes表示守护进程，设置为no表示非守护进程
  >
  >推荐设置为yes

  ```shell
  daemonize yes
  ```

+ 数据文件(持久化文件)

  ```shell
  dbfilename dump.rdb
  ```

+ 数据文件存储路径

  ```shell
  dir /var/lib/redis
  ```

+ 日志文件

  ```shell
  logfile /var/log/redis/redis-server.log
  ```

+ 数据库

  > 默认有16个数据库

  ```shell
  database 16
  ```

+ 主从复制

  > 类似双机热备

  ```shell
  slaveof
  ```

## 3. 服务端和客户端命令



## 4. 数据操作

## 5. 与Python交互

## 6. 搭建主从复制

## 7. 搭建集群