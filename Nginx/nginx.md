# 1.Nginx总结

## 1. nginx基本配置

```
1.创建一个文件夹  用来存储nginx_singing.key
	mkdir doc——python项目中(pycharm中)
	cd doc
2.在doc中保存nginx_singing.key
	wget  http://nginx.org/keys/nginx_signing.key
3.要将nginx配置系统的资源列表——在后面添加下面的内容
	1.sudo vim  /etc/apt/sources.list
	2.deb http://nginx.org/packages/ubuntu/ codename nginx
	3.deb-src http://nginx.org/packages/ubuntu/ codename nginx
	注意：Ubuntu
	16.04 “xenial”	x86_64, i386, ppc64el, aarch64/arm64
	18.04 “bionic”	x86_64, aarch64/arm64
	19.04 “disco”	x86_64
	-------------------这是我的Ubuntu版本----------------------
	deb http://nginx.org/packages/ubuntu/ bionic nginx
	deb-src http://nginx.org/packages/ubuntu/ bionic nginx
4.更新一下软件——主要看上面的配置情况
	sudo apt update
5.将signing.key添加进去
	sudo apt-key add nginx_signing.key
6.安装nginx
	1.sudo apt install nginx——安装之后默认情况下是直接启动nginx服务器
	2.ps -ef|grep nginx——查看nginx
7.控制
	1.nginx -s  stop	不建议使用   相当于长按关机按钮
	2.sudo nginx -s  quit	正常关机
	3.nginx -s reload	重启
8.启动nginx
	1.nginx -c 路径
	2.sudo nginx
	3.ps -ef|grep nginx
9.版本信息
	nginx -v	只给nginx版本信息
	nginx -V	
10.访问
	浏览器中输入127.0.0.1
11.配置nginx
	cd /etc/nginx
	vim nginx.conf
	vim default.conf
```

## 2. 静态加载

```
1.导出配置文件
	1.cd /etc/nginx
	2.cat nginx.conf > ~/Desktop/nginx.conf
	3.cd conf.d
		cat default.conf > ~/Desktop/default.conf
	4.复制修改
		1.注释nginx.conf中的include /etc/nginx/conf.d/*.conf;
		2.要将default.conf的内容复制都nginx.conf中
		3.删除注释
		4.只保留下面的
			location / {
				root /usr/share/nginx/html;
				index index.html index.htm
			}
	5.修改文件中的root  路径为项目路径
		root /home/action/PycharmProject/day15/axf;
2.测试配置文件
	sudo nginx -t -c 项目中的nginx.conf的路径
3.退出nginx	
	sudo nginx -s quit
4.重启访问
	1.sudo nginx
	2.sudo nginx -c 项目中的nginx.conf的路径
5.配置项目
	root /copypath  项目路径
	location /static{
		alias 静态文件的路径
	}
6.重新启动nginx
	1.sudo nginx -t -c 项目中的nginx.conf的路径
	2.sudo nginx -s quit
	3.sudo nginx -c 项目中的nginx.conf的路径 
7.访问
	在浏览器中输入127.0.0.1/static/css/base.css 根据自己的项目来改
```

## 3.动态加载

```
1.安装uwsgi
	pip install uwsgi
2.将uwsgi文件导入项目——下面是uwsgi.ini文件中的
	[uwsgi]
	# 使用nginx连接时 使用
    ;socket=0.0.0.0:8888--------这里注释掉
    # 直接作为web服务器使用
    http=0.0.0.0:8888-----------这里去掉注释
    # 配置工程目录
    chdir=/home/action/PycharmProjects/day15/axf--根据自己的项目来改路径
    # 配置项目的wsgi目录。相对于工程目录
    wsgi-file=axf/wsgi.py-----根据自己的项目来改
    #配置进程，线程信息
    processes=4
    threads=10
    enable-threads=True
    master=True
    pidfile=uwsgi.pid
    daemonize=uwsgi.log
3.启动uwsgi
	uwsgi --ini  uwsgi.ini文件路径
4.查看uwsgi活跃
	ps -ef|grep uwsgi
5.重启2个服务器
	1.sudo nginx -s quit
	2.sudo nginx -c  copypath(config.conf)
	3.uwsgi --stop uwsgi.pid
	4.sudo nginx -s reload
	5.uwsgi --ini copypath(uwsgi.ini)
6.访问
	http://127.0.0.1:8888/netcotss/costlist/
	注意：没有和静态页面进行关联
```

## 4. 动静结合

```
1.修改uwsgi里面的配置
	[uwsgi]
	# 使用nginx连接时 使用
    socket=0.0.0.0:8888--------这里去掉注释
    # 直接作为web服务器使用
    ;http=0.0.0.0:8888-----------这里注释掉
    # 配置工程目录
    chdir=/home/action/PycharmProjects/day15/axf--根据自己的项目来改路径
    # 配置项目的wsgi目录。相对于工程目录
    wsgi-file=axf/wsgi.py-----根据自己的项目来改
    #配置进程，线程信息
    processes=4
    threads=10
    enable-threads=True
    master=True
    pidfile=uwsgi.pid
    daemonize=uwsgi.log
2.配置nginx.conf
	location / {
		include /etc/nginx/uwsgi_params;
		uwsgi_pass 127.0.0.1:8888;
	}
3.重启2个服务器
	1.sudo nginx -s quit
	2.sudo nginx -c  copypath(config.conf)
	3.uwsgi --stop uwsgi.pid
	4.sudo nginx -s reload
	5.uwsgi --ini copypath
```

## 5. 阿里云服务器

+ 本地操作

  ```
  1.安装依赖包————pip freeze > requirements.txt
  2.压缩项目文件—— tar -czf newfile.tgz files(tar -czf 压缩后的文件名 要压缩的文件)
  3.链接服务器
      1.ssh root@公网ip
      2.防火墙(安全组)
          ssh
          http
          https
          mysql
          redis
  ```

+ 线上操作

  ```
  1.查看服务器状态
  	1.free -h
  	2.df -h
  2.安装虚拟环境
  	1.python——————查看python版本
  	2.python3——————查看python3版本
  	3.apt update————更新软件
  	4.apt install python3-dev python3-pip————安装pip3
  	5.pip install virtualenvwrapper————安装虚拟环境
  	6.pip install virtualenv————安装虚拟环境
  	7.mkdir .virtualenvs————创建一个存放虚拟环境的目录
  	8.find / -name virtualenvwrapper.sh————寻找虚拟环境的启动文件
  	9.vim .bashrc——————打开bashrc
  	10.配置bashrc
  		export WORKON_HOME=/root/.virtualenvs 
  		source find / -name virtualenvwrapper.sh//usr/local/bin/virtualenvwrapper.sh
  	11.source .bashrc————激活
  	12.mkvirtualenv netctoss -p /usr/bin/python3
  		创建python3的虚拟环境netctoss
  3.安装mysql
  	apt install mysql-server
  4.安装redis
  	1.mkdir software----创建文件夹
  	2.cd software --进入software目录中
  	3.wget redis原码链接(redis.io)
  	4.tar -zxvf redis---解压
  	5.cd redis---------进入redis原码包中
  	6.make==>make test==>apt install tcl==>make test
  	或者试试(make && sudo make install)
  	7.安装
  		1. cd utils
  		2. ./install_server.sh
  		3. ps -ef|grep redis
  		4. apt install redis-tools
  		5. apt install redis-server
  		6. redis-cli
  			输入ping==>得到pong
  	8.将项目上传到服务器上
  		1.cd /var/
  		2.mkdir www
  		3.cd www
  		4.scp 要上传的文件 root@公网IP:~ (上传到服务器家目录下)
  		  scp 要上传的文件 root@公网IP:/var/www/
  		5.tar -zxvf  项目 ------解压
  	9.基本配置
  		1.cd ~
  		2.cd software
  		3.wget  http://nginx.org/keys/nginx_signing.key
  		4.apt-key add nginx_signing.key
  		5.sudo vim  /etc/apt/sources.list
  			deb http://nginx.org/packages/ubuntu/ bionic nginx
  			deb-src http://nginx.org/packages/ubuntu/ bionic nginx
  		6.apt update
  		7.apt install nginx
  		8.ps -ef|grep nginx
  		9.nginx
  		10.cd /var/www/---进入项目文件
  		11.pwd
  		12.vim nginx.conf
  		13. sudo nginx -s quit
  		14.nginx -t -c nginx.conf的路径
  		15.nginx -c nginx.conf的路径
  		16.pip install -r requirements.txt
  		17.vim uwsgi.ini
  			修改chdir的路径
  		18.uwsgi --ini uwsgi.ini
  		19.ps -ef|grep uwsgi
  		20.workon 环境==>建库 迁移 插入数据
  ```

  

