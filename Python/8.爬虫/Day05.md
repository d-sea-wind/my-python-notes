## Day05

#### 1.requests

```
1.文档：
	官方文档
		http://cn.python-requests.org/zh_CN/latest/
	快速上手
		http://cn.python-requests.org/zh_CN/latest/user/quickstart.html
```

```
2.安装
	pip install requests
```

```
3.response的属性以及类型
	类型             ：models.Response
	r.text    		: 获取网站源码
	r.encoding		：访问或定制编码方式
	r.url     		：获取请求的url
	r.content 		：响应的字节类型
	r.status_code    ：响应的状态码
	r.headers        ：响应的头信息
```

```
4.get请求
	requests.get()
		eg:
			 import requests
              url = 'http://www.baidu.com/s?'
              headers = {
                  'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, 				   like Gecko) Chrome/65.0.3325.181 Safari/537.36'
              }
              data = {
                  'wd':'北京'
              }
              response = requests.get(url,params=data,headers=headers)
	定制参数
		参数使用params传递
		参数无需urlencode编码
		不需要请求对象的定制
		请求资源路径中？可加可不加
```

```
5:post请求
	requests.post()
	百度翻译:
		eg:
			import requests
			post_url = 'http://fanyi.baidu.com/sug'
             headers={
                  'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 					(KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36'
              }
            data = {
                'kw': 'eye'
            }
			r = requests.post(url = post_url,headers=headers,data=data
```

```
6：get和post区别？
	1： get请求的参数名字是params  post请求的参数的名字是data  
	2： 请求资源路径后面可以不加?  
	3： 不需要手动编解码  
	4： 不需要做请求对象的定制
```

```
7：proxy定制
	在请求中设置proxies参数
	参数类型是一个字典类型
	eg:
		import requests
		url = 'http://www.baidu.com/s?'
         headers = {
              'user-agent': 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, 			  like Gecko) Chrome/65.0.3325.181 Safari/537.36'
          }
        data = {
            'wd':'ip'
        }
        proxy = {
              'http':'219.149.59.250:9797'
          }
	   r = requests.get(url=url,params=data,headers=headers,proxies=proxy)
        with open('proxy.html','w',encoding='utf-8') as fp:
            fp.write(r.text)
```

```
8:cookie定制
	应用案例：
            （1）笑话集
            		http://www.jokeji.cn/
            		账号密码	action   action123
            （2）全书网登陆
            		账号密码    action    action
            （3）古诗文网（需要验证）
            （4）云打码平台
            	用户登陆   actionuser  action
			   开发者登陆  actioncode  action
```

作业：国家统计局（http://www.stats.gov.cn/tjsj/tjbz/tjyqhdmhcxhfdm/2017/）共计68万条数

#### 2.scrapy

```
1.scrapy是什么？
		Scrapy是一个为了爬取网站数据，提取结构性数据而编写的应用框架。 可以应用在包括数据挖掘，信息处理或存储历史数据等一系列的程序中。
```

```
2.安装scrapy：
			pip install scrapy
  安装过程中出错：
  			如果安装有错误！！！！
             pip install Scrapy
             building 'twisted.test.raiser' extension
             error: Microsoft Visual C++ 14.0 is required. Get it with "Microsoft Visual C++ 			 Build Tools": http://landinghub.visualstudio.com/visual-cpp-build-tools
  解决方案：
		http://www.lfd.uci.edu/~gohlke/pythonlibs/#twisted 
		下载twisted对应版本的whl文件（如我的Twisted-17.5.0-cp36-cp36m-win_amd64.whl），cp后面是            python版本，amd64代表64位，运行命令：
		pip install C:\Users\...\Twisted-17.5.0-cp36-cp36m-win_amd64.whl
		pip install Scrapy
  如果再报错   win32
  解决方法：
  		pip install pypiwin32
  再报错：使用anaconda
```

##### 1.scrapy项目的创建以及运行

```
1.创建scrapy项目：
			  终端输入   scrapy startproject  项目名称
```

```
2.项目组成：
          spiders 
              __init__.py
              自定义的爬虫文件.py       ---》由我们自己创建，是实现爬虫核心功能的文件
          __init__.py                  
          items.py                     ---》定义数据结构的地方，是一个继承自scrapy.Item的类
          middlewares.py               ---》中间件   代理
          pipelines.py				  ---》管道文件，里面只有一个类，用于处理下载数据的后续处理
										默认是300优先级，越小优先级越高（1-1000）
          settings.py				  ---》配置文件  比如：是否遵守robots协议，User-Agent定义等

```

```
3.创建爬虫文件：
			（1）跳转到spiders文件夹   cd 目录名字/目录名字/spiders
			（2）scrapy genspider 爬虫名字 网页的域名
  爬虫文件的基本组成：
  			 继承scrapy.Spider类
                                name = 'qiubai'       ---》  运行爬虫文件时使用的名字
                                allowed_domains       ---》 爬虫允许的域名，在爬取的时候，如果不是此域名之下的url，会被过滤掉
                                start_urls			 ---》 声明了爬虫的起始地址，可以写多个url，一般是一个
                                parse(self, response) ---》解析数据的回调函数
                                        response.text
                                        response.body ---》响应的是二进制文件
                                        response.xpath()
                                extract()             ---》提取的是selector对象的是data
                                extract_first()       ---》提取的是selector列表中的第一个数据
```

```
4.运行爬虫文件：
			scrapy crawl 爬虫名称
			注意：应在spiders文件夹内执行
```

扩展：导出文件

	-o name.json
	-o name.xml
	-o name.csv
##### 3.scrapy架构组成

```
        （1）引擎           		---》自动运行，无需关注，会自动组织所有的请求对象，分发给下载器
        （2）下载器				   ---》从引擎处获取到请求对象后，请求数据
        （3）spiders				 ---》Spider类定义了如何爬取某个(或某些)网站。包括了爬取的动作(例如:是否跟进链接)以及如何从网页的内容中提取结构化数据(爬取item)。 换句话说，Spider就是您定义爬取的动作及分析某个网页(或者是有些网页)的地方。
        （4）调度器				   ---》有自己的调度规则，无需关注
        （5）管道（Item pipeline）   ---》最终处理数据的管道，会预留接口供我们处理数据
当Item在Spider中被收集之后，它将会被传递到Item Pipeline，一些组件会按照一定的顺序执行对Item的处理。
每个item pipeline组件(有时称之为“Item Pipeline”)是实现了简单方法的Python类。他们接收到Item并通过它执行一些行为，同时也决定此Item是否继续通过pipeline，或是被丢弃而不再进行处理。
          以下是item pipeline的一些典型应用：
          1. 清理HTML数据
          2. 验证爬取的数据(检查item包含某些字段)
          3. 查重(并丢弃)
          4. 将爬取结果保存到数据库中
```

##### 4.scrapy工作原理

![scrapy原理](C:\Users\lijingAction\Desktop\SH-1905-爬虫\day05\doc\scrapy原理.png)案例：​  1.站长素材

