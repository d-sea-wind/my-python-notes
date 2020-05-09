

# Day03

## 学习目标

- Template概念
- 模板语法
  - 变量
  - 模板中的点语法
  - 标签
  - 过滤器
  - 结构标签
  - 加载静态资源
- 视图函数基本语法
- 内置函数
- 反向解析

### 1.Template概念

```
概念：模板
	在Django框架中，模板是可以帮助开发者快速生成，呈现给用户页面的工具
	模板的设计方式实现了我们MVT中VT的解耦，VT有着N:M的关系，一个V可以调用任意T，一个T可以供任意V使用
	模板处理分为两个过程
		加载
		渲染
	模板中的动态代码段除了做基本的静态填充，可以实现一些基本的运算，转换和逻辑
	早期的web服务器  只能处理静态资源请求  模板能处理动态资源请求 依据计算能生成相应的页面
	注意：在Django中使用的就是Django模板，在flask种使用得是jinja2模板
```

```
模板组成：模板主要有2个部分
			① HTML静态代码
			② 动态插入的代码段（挖坑，填坑）
```

### 2.模板语法：

#### （1）变量

```
变量
	视图传递给模板的数据
	获取视图函数传递的数据使用{{ var }}接收
	遵守标识符规则：
		拒绝关键字 保留字 数字。。。如果变量不存在，则插入空字符串
	来源：
		视图中传递过来的
		标签中，逻辑创建出来的
```

#### （2）模板中的点语法

```python
模版中的点语法
	属性或者方法
		student.name/student.getname
		class Student(models.Model):
    		s_name = models.CharField(max_length=16)
			def get_name(self):
        		return self.s_name
	弊端：模板中的小弊端，调用对象的方法，不能传递参数 为什么不能传递参数  因为连括号都没有
	索引	students.0.gname
	字典  student_dict.hobby
```

#### （3）标签：

```
特征：标签分为单标签和双标签
      双标签必须闭合
```

```
功能标签：（for）
              for
                  for i in xxx
                  empty
                      {% empty %}
                      判断之前的代码有没有数据 如果没有显示empty下面的代码
                      eg:{% for 变量 in 列表 %}
                              语句1 
                                 {% empty %}
                              语句2
                          {% endfor %}
                  forloop
                      循环状态的记录
                      {{ forloop.counter }} 表示当前是第几次循环，从1数数
                      {{ forloop.counter0}}表示当前是第几次循环，从0数数
                      {{ forloop.revcounter}}表示当前是第几次循环，倒着数数，到1停
                      {{ forloop.revcounter0}}表示当前第几次循环，倒着数，到0停
                      {{ forloop.first }} 是否是第一个  布尔值
                      {{ forloop.last }} 是否是最后一个 布尔值
```

```
功能标签：（if）
                  if
                      分支
                      判断
                      if - else
                      if - elif -else
```

```
注释：
          单行注释
              {#  被注释掉的内容  #}
          多行注释
              {% comment %}
              内容
          	  {% endcomment %}
```

```
withratio
            乘
            {% widthratio 数  分母  分子  %}
            {% widthratio count 1 5 %}
```

```
整除：{% if num|divisibleby:2 %}
                      整除
                      {% if forloop.counter|divisibleby:2%}
                      奇偶行变色
```

```
 ifequal： 
        ifequal
            {%  ifequal  value1 value2 %}
                语句
        {% endifequal %}
            {% ifequal forloop.counter 5 %}
```

#### (4)过滤器

```
管道符:|
	将前面的输入作为后面的输出
	add：
		<h4>{{ count|add:2 }}</h4>
		<h4>{{ count|add:-2 }}</h4>
	upper：
	lower：
	safe
		确认安装
		进行渲染
		eg:
              code = """
                  <h2>睡着了</h2>
                  <script type="text/javascript">
                      var lis = document.getElementsByTagName("li");

                      for (var i=0; i< lis.length; i++){
                          var li = lis[i];
                          li.innerHTML="日本是中国领土的一部分!";
                      }
                  </script>
                   """
	endautoescape：
		{% autoescape off%}
			code
		{% endautoescape %}
```

#### (5)结构标签

```
结构标签
	block
		块
		坑
		用来规划页面布局，填充页面
			首次出现代表规划
			第二次c出现代表填坑
			第三次出现也代表填坑，默认会覆盖
			第N次...
			如果不想被覆盖  block.super
	extends
		继承
		面向对象的体现
		提高模板的复用率
	include
		包含
		将其它模板作为一部分，包裹到我们的页面中
```

#### （6）加载静态资源

```python
加载静态资源
	static--》 html  css js  img font
	静态资源路径 /static/css/xxx.css
		不推荐
		硬编码
	需要在settings中添加  STATICFILES_DIRS=[os.path.join(BASE_DIR,'static')]
	推荐
		{% load static%}
		{%static,'css/xxx.css'%}
		思考：html和模板中的页面  都可以使用load吗？  注意必须在模板中使用
	坑点：仅在DEBUG模式下可以使用  如果settings中的DEBUG=False 那么是不可以使用的
```

### 3.常见的请求状态码

```
请求状态码
	2xx
		成功
	3xx
		重定向 302  301 永久重定向
	4xx
		客户端错误
	5xx
		服务端错误
	200 成功  301 永久重定向  302 重定向  404 路径错误  405 请求方式错误  403 防跨站攻击
	500 业务逻辑错误
```

### 4.view视图函数

#### 1.概念及基础语法

```
概念：视图函数MTV中的View，相当于MVC中的Controller作用，控制器 接收用户输入（请求），
	协调模板模型，对数据进行处理，负责的模型和模板的数据交互。
	
视图函数返回值类型：（1）以Json数据形势返回
						前后端分离
						return  json
				 （2）以网页的形势返回    HttpResponse   render   redirect
						重定向到另一个网页
						错误视图(40X,50X)
```

```
url匹配正则注意事项:
					正则匹配时从上到下进行遍历，匹配到就不会继续向后查找了
					匹配的正则前方不需要加反斜线
					正则前需要加 （r）表示字符串不转义
url匹配规则：按照书写顺序，从上到下匹配，没有最优匹配的概念，匹配到就停止了			
			eg：hehe/hehehe
```

```
url接受参数：
          （1）如果需要从url中获取一个值，需要对正则加小括号
                url(r'^grade/(\d+)$',views.getStudents),
                注意，url匹配中添加了 () 取参，在请求调用的函数中必须接收	
                def  getStudents(request,classId)：
                    一个参数
          （2）如果需要获取url路径中的多个参数，那就添加多个括号，默认按照顺序匹配路径名字
                url(r'^news/(\d{4})/(\d)+/(\d+)$',views.getNews),
                匹配年月日 def getNews(request,year,month,day)：
                    多个参数
                eg:def get_time(request,hour, minute, second):
    					return HttpResponse("Time %s: %s: %s" %(hour, minute, second))
          （3）参数也可以使用关键字参数形势
                 url(r'^news/(?P<year>\d{4})/(?P<month>\d)+/(?P<day>\d+)$',views.getNews),
                    多个参数并且指定位置
               eg:def get_date(request,  month, day, year):
   						 return HttpResponse("Date %s- %s- %s" %(year, month, day))
   						 
   		总结路径参数：
                  位置参数
                      使用圆括号包含规则
                      一个圆括号代表一个参数
                      代表视图函数上的一个参数
                      参数个数和视图函数上的参数一一对应（除默认request）
                  关键字参数
                      可以在圆括号指定参数名字 （?P<name>reg）
                      视图函数中存在和圆括号中name对应的参数
                      参数不区分顺序
                      个数也需要保持一致，一一对应
```

#### 2.内置函数

```
内置函数
	locals()
		将局部变量，使用字典的形式打包
		key是变量的名字
		value是变量的值
```

#### 3.反向解析

```
反向解析
	配置
		在根urls中
              url(r'^views/', include('ViewsLearn.urls',namespace='view')),
                      在根路由中的inclue方法中添加namespace参数
		在子urls中
              url(r'^hello/(\d+)',views.hello,name='sayhello'),
			         在子路由中添加name参数
		在模板中使用
              <a href="{% url 'view:sayhello' %}">Hello</a>

			调用的时候 反向解析的路径不能有编译错误  格式是  {% url 'namespace:name%}'
                        {% url %}
                            {% url 'namespcae:name' %}
		如果存在位置参数
			{% url  ‘namespace:name'   value1 value2 ... %}
		如果存在关键字参数
			{% url 'namespace:name'   key1=value1 key2=vaue2 ...%}
		在模板中使用
			<a href="{% url 'view:sayhello'  year=2017 %}">Hello</a>
	优点
		如果在视图，模板中使用硬编码连接，在url配置发生改变时，需要变更的代码会非常多，这样导致我们的代码结构不是很容易维护，使用反向解析可以提高我们代码的扩展性和可维护性。
```

作业：

1. 样式的引入

2. 403  django中执行post请求会报的错

3. 点击添加之后  应该看到的是所有的数据 list   重定向 

   