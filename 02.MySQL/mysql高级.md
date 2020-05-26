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

>  和其它数据库相比，MySQL有点与众不同，它的架构可以在多种不同场景中应用并发挥良好作用。主要体现在存储引擎的架构上，
>
> **插件式的存储引擎架构将查询处理和其它的系统任务以及数据的存储提取相分离。**这种架构可以根据业务的需求和实际需要选择合适的存储引擎。

![mysql的逻辑架构](.\img\mysql的逻辑架构.png)

+ 连接层

  最上层是一些客户端和连接服务，包含本地sock通信和大多数基于客户端/服务端工具实现的类似于tcp/ip的通信。主要完成一些类似于连接处理、授权认证、及相关的安全方案。在该层上引入了线程池的概念，为通过认证安全接入的客户端提供线程。同样在该层上可以实现基于SSL的安全链接。服务器也会为安全接入的每个客户端验证它所具有的操作权限。

+ 服务层

  + Management Serveices & Utilities： 系统管理和控制工具 

  + SQL Interface: SQL接口

       接受用户的SQL命令，并且返回用户需要查询的结果。比如select from就是调用SQL Interface

  + Parser: 解析器

    ​    SQL命令传递到解析器的时候会被解析器验证和解析。 

  + Optimizer: 查询优化器。

       SQL语句在查询之前会使用查询优化器对查询进行优化。 

       用一个例子就可以理解： select uid,name from user where gender= 1;

       优化器来决定先投影还是先过滤。

  + Cache和Buffer： 查询缓存。

       如果查询缓存有命中的查询结果，查询语句就可以直接去查询缓存中取数据。

       这个缓存机制是由一系列小缓存组成的。比如表缓存，记录缓存，key缓存，权限缓存等

    ​    缓存是负责读，缓冲负责写。

+ 引擎层

   存储引擎层，存储引擎真正的负责了MySQL中数据的**存储和提取**，服务器通过API与存储引擎进行通信。不同的存储引擎具有的功能不同，这样我们可以根据自己的实际需要进行选取。后面介绍MyISAM和InnoDB

+ 存储层

  数据存储层，主要是将数据存储在运行于裸设备的文件系统之上，并完成与存储引擎的交互。

#### 2.查询说明

查询流程：

![查询流程](.\img\查询流程.png)

首先，mysql的查询流程大致是：

- mysql客户端通过协议与mysql服务器建连接，发送查询语句，先检查查询缓存，如果命中(一模一样的sql才能命中)，直接返回结果，否则进行语句解析,也就是说，在解析查询之前，服务器会先访问查询缓存(query cache)——它存储SELECT语句以及相应的查询结果集。如果某个查询结果已经位于缓存中，服务器就不会再对查询进行解析、优化、以及执行。它仅仅将缓存中的结果返回给用户即可，这将大大提高系统的性能。

- 语法解析器和预处理：首先mysql通过关键字将SQL语句进行解析，并生成一颗对应的“解析树”。mysql解析器将使用mysql语法规则验证和解析查询；预处理器则根据一些mysql规则进一步检查解析数是否合法。

- 查询优化器当解析树被认为是合法的了，并且由优化器将其转化成执行计划。一条查询可以有很多种执行方式，最后都返回相同的结果。优化器的作用就是找到这其中最好的执行计划。。

- 然后，mysql默认使用的BTREE索引，并且一个大致方向是:无论怎么折腾sql，至少在目前来说，mysql最多只用到表中的一个索引。

### 5.存储引擎

#### 1.查看命令

+ 查看mysql提供哪些存储引擎

  ```sql
  show engines;
  ```

  ![mysql存储引擎](.\img\mysql存储引擎.png)

+ 查看mysql当前默认存储引擎

  ```sql
  show variables like '%storage_engine%';
  ```

  ![mysql默认存储引擎](.\img\mysql默认存储引擎.png)

#### 2.引擎介绍

+ InnoDB存储引擎

  InnoDB是MySQL的默认**事务型引擎**，它被设计用来处理大量的短期(short-lived)事务。除非有非常特别的原因需要使用其他的存储引擎，否则应该优先考虑InnoDB引擎。**行级锁，适合高并发情况**

+ MyISAM存储引擎

  MyISAM提供了大量的特性，包括全文索引、压缩、空间函数(GIS)等，但MyISAM**不支持事务和行级锁(myisam改表时会将整个表全锁住)**，有一个毫无疑问的缺陷就是崩溃后无法安全恢复。

+ Archive引擎

  Archive存储引擎**只支持INSERT和SELECT**操作，在MySQL5.1之前不支持索引。

  Archive表适合日志和数据采集类应用。**适合低访问量大数据等情况。**

  根据英文的测试结论来看，Archive表比MyISAM表要小大约75%，比支持事务处理的InnoDB表小大约83%。

+ Blackhole引擎

  Blackhole引擎没有实现任何存储机制，它会丢弃所有插入的数据，不做任何保存。但服务器会记录Blackhole表的日志，所以可以用于复制数据到备库，或者简单地记录到日志。但这种应用方式会碰到很多问题，因此并不推荐。

+ CSV引擎

  CSV引擎可以将普通的CSV文件作为MySQL的表来处理，但不支持索引。

  CSV引擎可以作为一种数据交换的机制，非常有用。

  CSV存储的数据直接可以在操作系统里，用文本编辑器，或者excel读取。

+ Memory引擎

  如果需要快速地访问数据，并且这些数据不会被修改，重启以后丢失也没有关系，那么使用Memory表是非常有用。Memory表至少比MyISAM表要快一个数量级。(使用专业的内存数据库更快，如redis)

+ Federated引擎

  Federated引擎是访问其他MySQL服务器的一个代理，尽管该引擎看起来提供了一种很好的跨服务器的灵活性，但也经常带来问题，因此默认是禁用的。

#### 3.MyISAM和InnoDB

![myisam和innodb区别](.\img\myisam和innodb区别.png)

#### 4.阿里用哪个

![其他存储引擎](.\img\其他存储引擎.png)

- Percona 为 MySQL 数据库服务器进行了改进，在功能和性能上较 MySQL 有着很显著的提升。该版本提升了在高负载情况下的 InnoDB 的性能、为 DBA 提供一些非常有用的性能诊断工具；另外有更多的参数和命令来控制服务器行为。

- 该公司新建了一款存储引擎叫xtradb完全可以替代innodb,并且在性能和并发上做得更好

- 阿里巴巴大部分mysql数据库其实使用的percona的原型加以修改。
- AliSql+AliRedis



## 2.索引优化

### 1.SQL慢

+ 查询语句写的烂
+ 索引失效
+ 关联查询太多join(设计缺陷或不得已的需求)
+ 服务器调优及各个参数设置(缓冲、线程数等)

### 2.常见的join查询

#### 1.SQL执行顺序

+ 手写

  ```sql
  select distinct 
  	<select_list>
  from
  	<left_table> <jion_type>
  join <right_table> on <jion_condition>
  where
  	<wherer_condition>
  group by
  	<group_by_list>
  having
  	<having_condition>
  order by 
  	<order_by_condition>
  limit <limit_number>
  ```

+ 机读

  随着Mysql版本的更新换代，其优化器也在不断的升级，优化器会分析不同执行顺序产生的性能消耗不同而动态调整执行顺序。

  下面是经常出现的查询顺序：

  ![SQL语句执行顺序](.\img\SQL语句执行顺序.png)

+ 总结

  ![SQL语句执行顺序总结](.\img\SQL语句执行顺序总结.png)

#### 2.jion图

![数据库表查询](.\img\数据库表查询.png)

+ 共有和独有

  **共有**：满足 a.deptid = b.id 的叫共有

  **A独有**: A 表中所有不满足 a.deptid = b.id 连接关系的数据

  同时参考 join 图



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



