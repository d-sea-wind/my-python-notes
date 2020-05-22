# MySQL高级

## 1.mysql架构

### 1.mysql简介

#### 1.概述

```
MySQL是一个关系型数据库管理系统，由瑞典MySQL AB公司开发，目前属于Oracle公司。
MySQL是一种关联数据库管理系统，将数据保存在不同的表中，而不是将所有数据放在一个大仓库内，这样就增加了速度并提高了灵活性。
Mysql是开源的，所以你不需要支付额外的费用。
Mysql是可以定制的，采用了GPL协议，你可以修改源码来开发自己的Mysql系统。
Mysql支持大型的数据库。可以处理拥有上千万条记录的大型数据库。
MySQL使用标准的SQL数据语言形式。
Mysql可以允许于多个系统上，并且支持多种语言。这些编程语言包括C、C++、Python、Java、Perl、PHP、Eiffel、Ruby和Tcl等。
MySQL支持大型数据库，支持5000万条记录的数据仓库，32位系统表文件最大可支持4GB，64位系统支持最大的表文件为8TB。
```

#### 2.高级

mysql内核

sql优化攻城狮

mysql服务器优化

各种参数常量设定

查询语句优化

主从复制

软硬件升级

容灾备份

sql编程

> 完整的mysql优化需要很深的功底，大公司甚至有专门的DBA写上述

### 2. mysql安装

> linux版安装

+ 下载地址

  [mysql官网下载](http://dev.mysql.com/downloads/mysql/)

+ 拷贝解压

  ```bash
  # 将压缩包拷贝到root/opt下
  cp xxxx  root/opt
  # 解压
  tar -xzf xxx.tar.gz
  ```

+ 检查

  + 检查当前系统是否安装过mysql

    ```bash
    rpm -qa|grep -i mysql
    ```

    ![mysql是否安装](.\img\mysql是否安装.png)

    卸载

    ```bash
    rpm -e --nodeps  mysql-libs
    ```

  + 检查/tmp文件权限

    ```shell
    # 由于mysql安装过程中，会通过mysql用户在/tmp目录下新建tmp_db文件，所以请给/tmp较大的权限 执行下面操作
    chmod -R 777 /tmp
    ```

+ 安装

  ```bash
  rpm -ivh MySQL-server-5.5.54-1.linux2.6.x86_64.rpm
  
  rpm -ivh MySQL-client-5.5.54-1.linux2.6.x86_64.rpm
  ```

+ 查看mysql版本

  ```bash
  mysqladmin --version
  ```

+ mysql启+停

  ```bash
  # 启动
  service mysql start
  # 停止
  service mysql stop
  ```

+ 首次登录

  ```bash
  # 给root用户设置密码
  /usr/bin/mysqladmin -u root  password '123456'
  # 登录
  mysql -uroot -p123456
  ```

+ mysql安装位置

  > 在linux下查看安装目录 ps -ef|grep mysql

  ![mysql目录](.\img\mysql目录.png)

+ 自启动mysql服务

  ```bash
  # 设置开机自启动mysql
  chkconfig mysq on
  # 查看2345位启动
  chkconfig --list|grep mysql
  # 看到[*]mysql这一行表示开机后会自动启动mysql
  ntsysv
  ```

+ 修改配置文件

  ```bash
  # 拷贝
  cp /usr/share/mysql/my-default.cnf /etc/my.cnf
  ```

+ 修改字符集

  ```bash
  # 查看字符集
  show variables like 'character%'; 
  show variables like '%char%';
  ```

  ![mysql字符集](.\img\mysql字符集.png)

  默认的是客户端和服务器都用了latin1，所以会乱码。

  ```bash
  # 进入tec/
  cd tec/
  # 修改my.cnf
  vim my.cnf	# set nu 表示显示行号
  # 在第21行添加
  default-character-set=utf8
  # 在第28行添加
  character_set_server=utf8
  character_set_client=utf8
  collation-server=utf8_general_ci
  # 在139行下面添加
  default-character-set=utf8
  ```

### 3.mysql配置文件

#### 1.二进制日志

> log-bin

主要用于主从复制和备份恢复

log-bin 中存放了所有的操作记录(写？)，可以用于恢复。相当于 Redis 中的 AOF  

my.cnf中的log-bin配置(默认关闭)

![二进制日志](.\img\二进制日志.png)

#### 2.错误日志

> 默认是关闭的，记录严重的警告和错误信息，每次启动和关闭的详细信息等。

#### 3.慢查询日志

> 默认关闭，记录查询的sql语句，如果开启会降低mysql的整体性能，因为记录日志也是需要消耗系统资源的

#### 4.数据文件

+ 两系统

  + windows

    > mysql安装目录下data下可以挑选很多库

  + linux

    > 默认路径：/var/lib/mysql 
    >
    > 每个目录代表一个同名的库
    >
    > 可在配置文件中更改 /usr/share/mysql/ 下的 my-huge.cnf

+ myisam存放方式

  + frm文件

    > 存放表结构

  + myd文件

    > 存放表数据

  + myi文件

    > 存放表索引

+ innodb存放方式

  + ibdata1

    > Innodb引擎将所有表的的数据都存在这里面 /usr/share/mysql/ibdata1 而frm文件存放在库同名的包下

  + frm文件

    > 存放表结构

  + 单独存放

    ```mysql
    show variables like 'innodb_file_per_table%';
    set global innodb_file_per_table=1;
    
    ```

    ![单独存放](.\img\单独存放.png)

#### 5.如何配置

+ windows

  > my.ini

+ linux

  > my.cnf

### 4.逻辑架构介绍

#### 1.总体概览



#### 2.查询说明



### 5.存储引擎





## 2.索引优化

### SQL慢

### 常见的join查询

### 索引简介

### 性能分析

### 索引优化



## 3.查询截取

### 查询优化

### 慢查询日志

### 批量数据脚本

### show profile

### 全局查询日志



## 4. 锁机制

### 概述

### 表锁

### 行锁

### 页锁



## 5. 主从复制

### 复制基本原理

### 复制基本原则

### 复制最大问题

### 主从常见配置



