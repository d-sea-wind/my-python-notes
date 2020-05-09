## Day07

#### 1.yield

1. 带有 yield 的函数不再是一个普通函数，而是一个生成器generator，可用于迭代
2. yield 是一个类似 return 的关键字，迭代一次遇到yield时就返回yield后面(右边)的值。重点是：下一次迭代时，从上一次迭代遇到的yield后面的代码(下一行)开始执行
3. 简要理解：yield就是 return 返回一个值，并且记住这个返回的位置，下次迭代就从这个位置后(下一行)开始

```
name_list = [x for x in range(10)]
def createGenorator():
	items = []
	for i in name_list:
		print('第{}次调用'.format(i))
		items.append(i)
	return items
def testFunc1():
	generator = createGenorator2()
	for a in generator:
		print('使用第{}次'.format(a))

def createGenorator2():
	for i in name_list:
		print('第{}次调用'.format(i))
		yield i
print(testFunc1())
```

#### 案例：

​	 1.校花网          （1）.管道封装（2）.多条管道下载  （3）多页数据下载

​         2.电影天堂       （1）一个item包含多级页面

#### 2.Mysql

​		（1）下载（https://dev.mysql.com/downloads/windows/installer/5.7.html）

​		（2）安装（https://jingyan.baidu.com/album/d7130635f1c77d13fdf475df.html）

#### 3.pymysql的使用步骤

```
1.pip install pymysql
2.conn = pymysql.Connect(host,port,user,password,db,charset)
3.conn.cursor()
4.cursor.execute(sql)
```

#### 4.CrawlSpider

```
1.继承自scrapy.Spider
2.独门秘笈
	CrawlSpider可以定义规则，再解析html内容的时候，可以根据链接规则提取出指定的链接，然后再向这些链接发送请求
	所以，如果有需要跟进链接的需求，意思就是爬取了网页之后，需要提取链接再次爬取，使用CrawlSpider是非常合适的
```

```
3.提取链接
	链接提取器，在这里就可以写规则提取指定链接
scrapy.linkextractors.LinkExtractor(
	 allow = (),           # 正则表达式  提取符合正则的链接
	 deny = (),            # (不用)正则表达式  不提取符合正则的链接
	 allow_domains = (),   # （不用）允许的域名
	 deny_domains = (),    # （不用）不允许的域名
	 restrict_xpaths = (), # xpath，提取符合xpath规则的链接
	 restrict_css = ()     # 提取符合选择器规则的链接)
4.模拟使用
		正则用法：links1 = LinkExtractor(allow=r'list_23_\d+\.html')
		xpath用法：links2 = LinkExtractor(restrict_xpaths=r'//div[@class="x"]')
		css用法：links3 = LinkExtractor(restrict_css='.x')
5.提取连接
		link.extract_links(response)
```

```
6.注意事项
	【注1】callback只能写函数名字符串, callback='parse_item'
	【注2】在基本的spider中，如果重新发送请求，那里的callback写的是   callback=self.parse_item 【注--稍后看】follow=true 是否跟进 就是按照提取连接规则进行提取
```

运行原理：![](G:\千峰教育\笔记\Typora\8.爬虫\img\crawlspider运行原理.png)		

#### 5.CrawlSpider案例

需求：读书网数据入库

```
1.创建项目：scrapy startproject dushuproject
2.跳转到spiders路径  cd\dushuproject\dushuproject\spiders
3.创建爬虫类：scrapy genspider -t crawl read www.dushu.com
4.items
5.spiders
6.settings
7.pipelines
		数据保存到本地
		数据保存到mysql数据库
```

作业：1.使用CrawlSpider爬取糗事百科所有页的用户信息

​	   2.使用CrawlSpider爬取电影天堂所有的电影信息（多级页面）

​           3.把读书网的数据入库 mysql（要求数据库的链接参数必须在settings中书写）

​	

