# Day01

## 学习目标：

- CS/BS
  - 概念
  - 区别
  - 应用语言
- MVC
- MTV
- Django
  - 简介
  - 虚拟环境
  - 虚拟化技术
  - 安装
  - 创建django项目
  - 编写第一个请求
  - 拆分路由器
  - 工作机制
- 模版展示
- DML
- 修改数据库
- django shell
- 一对多模型关系

## 学习课程

#### 1.CS/BS简介

概念：

```
BS:B browser 浏览器   S server  服务器   主流
CS:C client  客户端   S server  服务器
B/S结构是WEB兴起后的一种网络结构模式，WEB浏览器是客户端最主要的应用软件。这种模式统一了客户端，将系统功能实现的核心部分集中到服务器上，简化了系统的开发、维护和使用。
```

CS/BS区别：

![image-20190720173825832](./img/1.png)

CS/BS应用语言：

```
CS/BS
	客户端和服务器的交互模型
		Client
			客户端
		Browser
			浏览器
		Server
		
			Web后端
				python
					django     8
					flask      1
					tornado    1
				java
					struts2/struts1
					hibernate
					spring
					springmvc
					mybatis
					springboot
					springclude
				php
					yii
					ci
					thinkphp
```

#### 2.MVC

```
MVC：软件架构思想
	简介：
		MVC开始是存在于桌面程序中的，M是指业务模型 model，V是指用户界面 view，C则是控制器 controler，使用MVC的目的是将M和V的实现代码分离，从而使同一个程序可以使用不同的表现形式。比如一批统计数据可以分别用柱状图、饼图来表示。C存在的目的则是确保M和V的同步，一旦M改变，V应该同步更新
实现了模型层的复用
	核心思想: 
		解耦合
	面向对象语言：高内聚  低耦合
	Model
		模型
		封装数据的交互操作
			CRUD
	View
		视图
		是用来将数据呈现给用户的
	Controller
		控制器
		接受用户输入输出
		用来协调Model和View的关系，并对数据进行操作，筛选
	流程
		控制器接受用户请求
		调用模型，获取数据
		控制器将数据展示到视图中
```

![img](https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike80%2C5%2C5%2C80%2C26/sign=7948cf4dbf096b63951456026d5aec21/b03533fa828ba61edbddc04d4034970a304e59a4.jpg)

#### 3.MTV

```
MTV
	也叫做MVT
	本质上就是MVC，变种
	Model
		同MVC中Model
	Template
		模板
		只是一个html，充当的是MVC中View的角色，用来做数据展示
	Views
		视图函数
		相当于MVC中Controller
```

![img](https://img2018.cnblogs.com/blog/1456293/201811/1456293-20181118142357195-711371172.png)

#### 4.Django

##### 简介

```
Django是一个开放源代码的Web应用框架，它最初是被开发来用于管理劳伦斯出版集团旗下的一些以新闻内容为主的网站的，即是CMS（内容管理系统）软件。并于2005年7月在BSD许可证下发布。这套框架是以比利时的吉普赛爵士吉他手Django Reinhardt来命名的。
	重量级，替开发者想了太多的事情，帮开发者做了很多的选择，内置了很多的功能
官方网站
	http://www.djangoproject.com
使用版本1.11.7
	LTS：长期支持版本
	以后再学2.2 LTS
```

##### 虚拟环境

```
虚拟环境
	mkvirtualenv  虚拟环境的名字  -p  python路径
		eg：mkvirtualenv django 190x -p /usr/bin/python3
		创建虚拟环境
	deactivate
		退出虚拟环境
	workon
		进入虚拟环境
	rmvirtualenv
		删除虚拟环境
		
注意：ubuntu16版本和ubuntu18版本的虚拟环境修改区别
          # 以前的配置路径(ubuntu16.04)
          source /usr/local/bin/virtualenvwrapper.sh   
          #ubuntu18.04中的配置路径
          source ~/.local/bin/virtualwrapper.sh
```

##### 虚拟化技术

```
虚拟化技术
	（1）虚拟机      
	（2）虚拟容器
		Docker  
			支持很多种语言
	（3）虚拟环境--迷你
		python专用
		将python依赖隔离
```

##### 安装

```
	pip install django
		pip install django==1.11.7   一定要使用==
		pip install django==1.11.7 -i https://pypi.douban.com/simple  豆瓣源
	查看django是否安装成功
		pip freeze
		pip list
		进入python环境
			import django
			django.get_version()
```

##### 创建django项目

```
django-admin startproject 项目名字
        tree命令观察项目结构
            如果未安装   sudo apt install tree
```

```
项目结构
	项目名字
		manage.py
			管理整个项目的文件
			以后的命令基本都通过他来调用
		项目名字
			__init__
				python包而不是一个文件夹
			settings
				项目全局配置文件
					ALLOWED_HOST=["*"]
					修改settings
						LANGUAGE_CODE='zh-hans'
						TIME_ZONE='Asia/Shanghai'
			urls
				根路由
					url（p1,p2）
			wsgi
				用在以后项目部署上，前期用不到
				服务器网关接口
				webserver gateway interface
```

```
启动项目
	python manage.py runserver
		使用开发者服务器启动项目
		默认会运行在本机的 8000端口上
	启动服务器命令
    (1)python manage.py runserver
    (2)python manage.py runserver 9000
    (3)python manage.py runserver 0.0.0.0:9000
```

```
创建一个应用
	python manage.py startapp App/django-admin startapp App
	App结构
		__init__
		views
			视图函数
				视图函数种参数是request  方法的返回值类型是HttpResponse
		models
			模型
		admin
			后台管理
		apps
			应用配置
		tests
			单元测试
		migrations
			__init__
			迁移目录
```

##### 拆分路由器

```
	python manager.py startapp  Two
	
	创建urls
		urlpatterns = [
    		url(r'^index/',views.index)
		]
	创建views方法
	主路由引用
		    url(r'^two/',include('Two.urls')),
	访问url
		127.0.0.1：8000/two/index/
```



##### 编写第一个请求

```
1.编写一个路由
      url(p1, p2)
              url(r'^index/',views.index),
      p1 正则匹配规则
      p2 对应的视图函数
2.编写视图函数
	（1）本质上还是一个函数
		def index(request):
    		return HttpResponse('123')
		要求：只是默认第一个参数是一个request，必须返回一个response
	（2）返回值：
		1.HttpResponse()
			HttpResponse('123')
			HttpResponse('<h1>123</h1>')
	    2.render
			在App下创建templates
				注意名字是固定的，不能打错单词
			render方法的返回值类型也是一个HttpResponse类型的
			要求：
				第一个参数是request，第二个参数的是页面
	********注意需要在settings里的INSTALLED_APPS设置App路径*****
	将应用注册到项目的settings中INSTALLED_APPS中
			写法可以直接写'App'
			也可以写'App.apps.AppConfig'
             加载路由的方式
                  INSTALLED_APPS---》‘Two’
                  INSTALLED_APPS---》‘Two.apps.TwoConfig’  版本限制 1.9之后才能使用
3.模板配置有两种情况
		①在App中进行模板配置
		  - 只需在App的根目录创建templates文件夹即可
		  - 必须在INSTALLED_APP下安装app
		②在项目目录中进行模板配置
		  - 需要在项目目录中创建templates文件夹并标记
		  - 需要在settings中进行注册  settings--》TEMPLATES--》DIRS-					    												os.path.join(BASE_DIR,'templates')
		  注意：开发中常用项目目录下的模板    理由：模板可以继承，复用
```

##### Django的工作机制

```
1.用Python manage.py runserver 启动Django服务器时就载入了在同一目录下的settings.py。该文件包含了项目中的配置信息，如URLConf等，其中最重要的配置就是ROOT_URLCONF，它告诉Django哪个Python模块应该用作本站的URLConf，默认的是urls.py

2.当访问url的时候，Django会根据ROOT_URLCONF的设置来装载URLConf。

3.然后按顺序逐个匹配URLConf里的URLpatterns。如果找到则会调用相关联的视图函数，并把HttpRequest对象作为第一个参数(通常是request)

4.最后该view函数负责返回一个HttpResponse对象。
```

#### 5.模板显示

```
显示在模板中
	先挖坑
		{{ var }}
	再填坑
		渲染模板的时候传递上下文进来
		上下文是一个字典
		content={'key':'value'}
	模板的兼容性很强
		不传入不会报错
		多传入也会自动优化掉
	浏览器不认模板
		浏览器也叫做html解析器  只识别html文件
		在到达浏览器之前，已经进行了转换，将模板语言转换成了HTML
	for 支持
		{% for %}
	render底层实现：应用场景，发送邮件，邮件的内容需要使用render方法来操纵
		加载
			three_index = loader.get_template('three.html')
			content={'xxx':'xxxx'}
		渲染
			result = three_index.render(content=content)
			return HttpResponse(result)
```

#### 6.修改数据库

	在settings中的DATABASES中进行修改
	实际上都是关系型数据库
	mysql
		'ENGINE': 'django.db.backends.mysql',
		NAME
			数据库名字
		USER
			用户名字
		PASSWORD
			密码
		HOST
			主机
		PORT
			端口号
				引号加不加“”都可以			
	mysql迁移---》有坑---驱动问题
	mysql驱动
		mysqlclient
			- python2,3都能直接使用
			- 致命缺点
			- 对mysql安装有要求，必须指定位置存在配置文件
		mysql-python
			- python2 支持很好
			- python3 不支持
		pymysql
			会伪装成mysqlclient和mysql-python
			- python2，python3都支持
			init中   import  pymysql      pymysql.install_as_mysqldb()
#### 7.DML

```
数据操作
	迁移
		生成迁移
			python manage.py makemigrations
		执行迁移
			python manage.py migrate
			才会真正在数据库产生表
	ORM
		Object Relational Mapping 对象关系映射
		将业务逻辑和sql进行了一个解耦合
		通过models定义实现  数据库表的定义
	模型定义
		（1）继承models.Model
		（2）会自动添加主键列
		（3）必须指定字符串类型属性的长度
			class Student(models.Model):
                 name = modes.CharField(max_length=16)
                 age = models.IntegerField(default=1)
	存储数据
		创建对象进行save()
	数据查询
		模型.objects.all()
		模型.objects.get(pk=2)
	更新
		基于查询
		save()
	删除
		基于查询
		delete()
```

#### 8.django shell

```
python manage.py shell
	django 终端
		python manager.py shell
	集成了django环境的python 终端
	通常用来调试
	eg：
	from Two.models import Student
	students = Student.objects.all()
    for student in students:
             print(students.name)
```

#### 9.数据级联-一对多

```
模型关系：
    class Grade(models.Model):
      	g_name = models.CharField(max_length=32)
    class Student(models.Model):
        s_name =models.CharField(max_length=16)
        s_grade=models.ForeignKey(Grade) 
 多获取一
	就是一个书写的属性
	eg:根据学生找班级名字
        student = Student.objects.get(pk=2)
        grade = student.s_grade
        return HttpResponse(grade.g_name)
 一获取多
	多的set
	eg:根据班级  找所有的学生
        grade = Grade.objects.get(pk=2)
        students = grade.student_set.all()
        content = {
                    'students':students
        }
        return render(request,'students_list.html',content)    
```

#### 作业：

作业：1  建立一个班级表  建立一个学生表   执行一个请求  获取班级列表  点击班级列表 获取所有学生
