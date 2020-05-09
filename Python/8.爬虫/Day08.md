## Day08

#### 1.数据入库

```
（1）settings配置参数：
			  DB_HOST = '192.168.231.128'
              DB_PORT = 3306
              DB_USER = 'root'
              DB_PASSWORD = '1234'
              DB_NAME = 'test'
              DB_CHARSET = 'utf8'
（2）管道配置
              from scrapy.utils.project import get_project_settings
              import pymysql
              class MysqlPipeline(object):
                  """docstring for MysqlPipeline"""
                  def __init__(self):
                      settings = get_project_settings()
                      self.host = settings['DB_HOST']
                      self.port = settings['DB_PORT']
                      self.user = settings['DB_USER']
                      self.pwd = settings['DB_PWD']
                      self.name = settings['DB_NAME']
                      self.charset = settings['DB_CHARSET']

                      self.connect()

                 def connect(self):
                      self.conn = pymysql.connect(host=self.host,
                                                 port=self.port,
                                                 user=self.user,
                                                 password=self.pwd,
                                                 db=self.name,
                                                 charset=self.charset)
                      self.cursor = self.conn.cursor()

                def close_spider(self, spider):
                    self.conn.close()
                    self.cursor.close()

                def process_item(self, item, spider):
                    sql = 'insert into book(image_url, book_name, author, info) values("%s", "%s", "%s", "%s")' % (item['image_url'], item['book_name'], item['author'], item['info'])
                    
                    sql = 'insert into book(image_url,book_name,author,info) values
 ("{}","{}","{}","{}")'.format(item['image_url'], item['book_name'], item['author'], item['info'])
                    # 执行sql语句
                    self.cursor.execute(sql)
                    self.conn.commit()
                    return item
```

#### 2.日志信息和日志等级

```
（1）日志级别：
            CRITICAL：严重错误
            ERROR：一般错误
            WARNING：警告
            INFO: 一般信息
            DEBUG：调试信息
            
            默认的日志等级是DEBUG
            只要出现了DEBUG或者DEBUG以上等级的日志
            那么这些日志将会打印
（2）settings.py文件设置：
		   默认的级别为DEBUG，会显示上面所有的信息
            在配置文件中  settings.py
            LOG_FILE  : 将屏幕显示的信息全部记录到文件中，屏幕不再显示，注意文件后缀一定是.log
            LOG_LEVEL : 设置日志显示的等级，就是显示哪些，不显示哪些
```

#### 3.Request和response总结

```
Request 是一个类
	get请求
		scrapy.Request(url=url, callback=self.parse_item, meta={'item': item}, headers=headers)
                url: 要请求的地址
                callback：响应成功之后的回调函数
                meta: 参数传递  接收的语法：item = response.meta['item']
                headers: 定制头信息，一般不用      parse_item方法中的response参数就是url执行之后的请求结果
```

```
response 是一个对象 函数的第二个参数
               	response.text: 字符串格式的文本
                response.body: 二进制格式的文本
                response.url: 当前响应的url地址
                response.status: 状态码
                response.xpath(): 筛选你想要的内容
                response.css(): 筛选你想要的内容
```

#### 4.scrapy的post请求

```
（1）重写start_requests方法：
		def start_requests(self)
 (2) start_requests的返回值：
 	 scrapy.FormRequest(url=url, headers=headers, callback=self.parse_item, formdata=data)
            url: 要发送的post地址
            headers：可以定制头信息
            callback: 回调函数   
            formdata: post所携带的数据，这是一个字典
```

#### 5.代理（通过下载中间件来进行添加）

```
	（1）到settings.py中，打开一个选项
		DOWNLOADER_MIDDLEWARES = {
		   'postproject.middlewares.Proxy': 543,
		}
	（2）到middlewares.py中写代码
		def process_request(self, request, spider):
	        request.meta['proxy'] = 'https://113.68.202.10:9999'
	        return None
```

#### 6.cookie登陆

```
案例：微博网登陆
代码：
import scrapy
class WbSpider(scrapy.Spider):
    name = 'wb'
    allowed_domains = ['weibo.cn']
    
    def start_requests(self):
        url = 'https://passport.weibo.cn/sso/login'
        headers={
            'accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3',
            # 'accept-encoding': 'gzip, deflate, br',
            'accept-language': 'zh-CN,zh;q=0.9',
            'cache-control': 'max-age=0',
            'cookie': 'SCF=Ahi2Sm3XHpcYIJvIsbJd8AnqkyO8t5RFmHXn8yHeTOMYgumvEqFGsgNbZbD6BmzlV7GA-B8sNWcbTcHeVmF3eNc.; _T_WM=32e4d519b787dd16fa96e2224b27a576; SUB=_2A25x8xaODeRhGeBK7lMV-S_JwzqIHXVTH7rGrDV6PUJbkdAKLVHlkW1NR6e0UBazrACpD1Cukh54U8WxKn23yIXs; SUHB=08JLxm5YJpiTJ1; SSOLoginState=1559717598',
            'referer': 'https://weibo.cn/',
            'upgrade-insecure-requests': '1',
            'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36',
        }
        data = {
            'username': '18642820892',
            'password': 'lijing1150501',
            'savestate': '1',
            'r': 'https://weibo.cn/',
            'ec': '0',
            'pagerefer': 'https://weibo.cn/pub/',
            'entry': 'mweibo',
            'wentry': '',
            'loginfrom': '',
            'client_id': '',
            'code': '',
            'qq': '',
            'mainpageflag': '1',
            'hff': '',
            'hfp': '',
        }
        yield scrapy.FormRequest(url=url,callback=self.parse_item,formdata=data,headers=headers)

    def parse_item(self,response):
        url = 'https://weibo.cn/6451491586/info'
        headers = {
            'accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3',
            # 'accept-encoding': 'gzip, deflate, br',
            'accept-language': 'zh-CN,zh;q=0.9',
            'cache-control': 'max-age=0',
            'cookie': 'SCF=Ahi2Sm3XHpcYIJvIsbJd8AnqkyO8t5RFmHXn8yHeTOMYgumvEqFGsgNbZbD6BmzlV7GA-B8sNWcbTcHeVmF3eNc.; _T_WM=32e4d519b787dd16fa96e2224b27a576; SUB=_2A25x8xllDeRhGeBK7lMV-S_JwzqIHXVTH6ctrDV6PUJbkdAKLRjYkW1NR6e0UHabYnrx2IRT40S735NJ0JgW9T6S; SUHB=0LciE0Eb6CLyKh; SSOLoginState=1559718197',
            'referer': 'https://weibo.cn/',
            'upgrade-insecure-requests': '1',
            'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36',
        }
        yield scrapy.Request(url=url,callback=self.parse_item1,headers=headers)

    def parse_item1(self,response):
        content = response.text
        with open('weibo.html','w',encoding='utf-8')as fp:
            fp.write(content)
```

扩展：scrapy爬虫命令解析（https://blog.csdn.net/djd1234567/article/details/45913967）

#### 7.分布式爬虫准备工作

1. linux下Python环境搭建、scrapy安装。

   ```
   见--linux下scrapy安装.txt
   ```

2. redis安装

   ```
   windows
   	（1）下载msi安装包，安装过程需要将添加环境变量、过滤防火墙选中，内存使用默认100M即可
   	（2）启动：
                 cd C:\Program Files\Redis
                     跳转到redis的安装目录下
                 redis-server.exe redis.windows.conf
                     启动redis服务
                 redis-cli
             发生启动错误信息
                 creating server tcp listening socket 127.0.0.1:6379: bind No error
             解决办法
                     1. redis-cli.exe
                     2. shutdown
                     3. exit
                     4. redis-server.exe redis.windows.conf
   	（3）本地连接
   		redis-cli
   	（4）远程连接限制
   		windows上面的redis配置文件中有限制，只允许本机连接，所以我们需要来修改一下配置，让远程linux连接
   		来到redis的安装路径   C:\Program Files\Redis
   		redis的配置文件就是   redis.windows.conf
   		修改配置文件
                 第56行   注释掉这一行   前面添加#号
                 第75行   protected-mode no
   	（5）远程连接
   				指令：(默认端口号都是6379，可以不加)
                     redis-cli -h host -p port      
                     redis-cli -h 10.11.63.79
   注：linux安装见文档
   ```

   ```
   客户端安装
             图形化界面操作redis数据库
             select 0-15 用来切换数据库
   ```

   扩展：1.redis数据类型（http://www.runoob.com/redis/redis-sorted-sets.html）

   ​	    2.redis常见问题（https://blog.csdn.net/hjm4702192/article/details/80518856）

3. 分布式安装

    windows：pip install scrapy_redis

    linux：       pip3 install scrapy_redis

#### 8.scrapy和scrapy_redis区别？

```
（1）scrapy是一个通用的爬虫框架，但是这个框架不支持分布式
（2）scrapy_redis就是为了实现scrapy的分布式而诞生的，它提供了一些基于redis的组件
	（https://www.cnblogs.com/nick477931661/p/9135497.html）
```

#### 9.scrapy_redis官方案例介绍

（https://github.com/rmax/scrapy-redis）

```
1.声明普通的spider类继承的是scrapy.spider
2.dmoz 普通的crawlspider类
                        连接提取的spider
3.myspider_redis 继承的是RedisSpider
            （1）普通的spider的分布式
            （2）  def __init__(self, *args, **kwargs):
                         # Dynamically define the allowed domains list.
                         domain = kwargs.pop('domain', '')
                         self.allowed_domains = filter(None, domain.split(','))
                         super(MySpider, self).__init__(*args, **kwargs)
                         官方文档指定的init的暂时不可以代替allowed_domains
                         所以我们还是要使用allowd_domains
             (3)指定redis_key
                eg:redis_key = 'mycrawler:start_urls'
4.mycrawler_redis 继承的是RedisCrawlSpider
             (1)连接提取的分布式
             (2)def __init__(self, *args, **kwargs):
                      # Dynamically define the allowed domains list.
                      domain = kwargs.pop('domain', '')
                      self.allowed_domains = filter(None, domain.split(','))
                      super(MySpider, self).__init__(*args, **kwargs)
                      官方文档指定的init的暂时不可以代替allowed_domains
                      所以我们还是要使用allowd_domains
              (3)指定redis_key
                 eg:redis_key = 'mycrawler:start_urls'
5.新增组件
from scrapy_redis.spiders import RedisSpider
from scrapy_redis.spiders import RedisCrawlSpider
这两个就是scrapy_redis新增加的两个组件，都是继承自官方的Spider、CrawlSpider
```

友情提示：使用redis存储注意事项

	DOWNLOAD_DELAY = 1
	【注】在爬取网站的时候，将这个选项打开，给对方一条活路
#### 10.多台电脑部署分布式

```
现在有4台电脑：windows   centos  ubuntu   macos
windows上面安装的是redis服务器，master端
	centos、ubuntu、macos都从redis上面获取请求，或者将请求添加到redis服务器中，   slave端
	slave端首先启动，页面就会停止在那里等待指令
	这个时候master通过lpush向队列中添加一个起始url，其中一个slave端获取到这个url开始爬取，这个slave端会将解析之后的很多url再次的添加到redis服务中，然后redis服务再从请求队列中向每个slave端分发请求，最终直到所有请求爬取完毕为止
```

```
分布式settings基本配置：
             （1）使用的是scrapy_redis的去重类
              	  DUPEFILTER_CLASS = "scrapy_redis.dupefilter.RFPDupeFilter"
             （2）调度器使用是scrapy_redis的调度器
              	  SCHEDULER = "scrapy_redis.scheduler.Scheduler"
             （3）爬取的过程中是否允许暂停
                  SCHEDULER_PERSIST = True
             （4）配置存储的redis服务器
                  REDIS_HOST = '10.11.52.62'
                  REDIS_PORT = 6379
                  ITEM_PIPELINES = {
                     'scrapy_redis.pipelines.RedisPipeline': 400,
                  }
```

```
scrapy-redis执行代码：
	（1）slave端执行scrapy runspider mycrawler_redis.py
	（2）master端向队列中添加起始url
		这个key就是你代码中写的  redis_key
		lpush fen:start_urls 'http://www.dytt8.net/html/gndy/dyzz/index.html'
```

#### 11.分布式爬虫原理

![scrapy_redis原理](G:\千峰教育\笔记\Typora\8.爬虫\img\scrapy_redis原理.png)

```
如何去重？
这里借助redis的集合，redis提供集合数据结构，在redis集合中存储每个request的指纹
在向request队列中加入Request前先验证这个Request的指纹是否已经加入集合中。如果已经存在则不添加到request队列中，如果不存在，则将request加入到队列并将指纹加入集合

如何防止中断？如果某个slave因为特殊原因宕机，如何解决？
这里是做了启动判断，在每台slave的Scrapy启动的时候都会判断当前redis request队列是否为空
如果不为空，则从队列中获取下一个request执行爬取。如果为空则重新开始爬取，第一台丛集执行爬取向队列中添加request
```

作业：1.预习分布式爬虫

​            2.房天下   全国所有的二手房，和新房的房源 ​
