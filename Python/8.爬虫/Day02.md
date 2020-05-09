### Day02

#### 1.URLError\HTTPError

	简介:1.HTTPError类是URLError类的子类
	     2.导入的包urllib.error.HTTPError    urllib.error.URLError
	     3.http错误：http错误是针对浏览器无法连接到服务器而增加出来的错误提示。引导并告诉浏览者该页是哪里出了问题。
	     4.通过urllib发送请求的时候，有可能会发送失败，这个时候如果想让你的代码更加的健壮，可以通过try-except进行捕获异常，异常有两类，URLError\HTTPError

```
eg:

import urllib.request
import urllib.error
url = 'https://blog.csdn.net/ityard/article/details/102646738'

# url = 'http://www.goudan11111.com'

headers = {
        # 'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3',
        # 'Accept-Encoding': 'gzip, deflate, br',
        # 'Accept-Language': 'zh-CN,zh;q=0.9',
        # 'Cache-Control': 'max-age=0',
        # 'Connection': 'keep-alive',
        'Cookie': 'uuid_tt_dd=10_19284691370-1530006813444-566189; smidV2=2018091619443662be2b30145de89bbb07f3f93a3167b80002b53e7acc61420; _ga=GA1.2.1823123463.1543288103; dc_session_id=10_1550457613466.265727; acw_tc=2760821d15710446036596250e10a1a7c89c3593e79928b22b3e3e2bc98b89; Hm_lvt_e5ef47b9f471504959267fd614d579cd=1571329184; Hm_ct_e5ef47b9f471504959267fd614d579cd=6525*1*10_19284691370-1530006813444-566189; __yadk_uid=r0LSXrcNYgymXooFiLaCGt1ahSCSxMCb; Hm_lvt_6bcd52f51e9b3dce32bec4a3997715ac=1571329199,1571329223,1571713144,1571799968; acw_sc__v2=5dafc3b3bc5fad549cbdea513e330fbbbee00e25; firstDie=1; SESSION=396bc85c-556b-42bd-890c-c20adaaa1e47; UserName=weixin_42565646; UserInfo=d34ab5352bfa4f21b1eb68cdacd74768; UserToken=d34ab5352bfa4f21b1eb68cdacd74768; UserNick=weixin_42565646; AU=7A5; UN=weixin_42565646; BT=1571800370777; p_uid=U000000; dc_tos=pzt4xf; Hm_lpvt_6bcd52f51e9b3dce32bec4a3997715ac=1571800372; Hm_ct_6bcd52f51e9b3dce32bec4a3997715ac=1788*1*PC_VC!6525*1*10_19284691370-1530006813444-566189!5744*1*weixin_42565646; announcement=%257B%2522isLogin%2522%253Atrue%252C%2522announcementUrl%2522%253A%2522https%253A%252F%252Fblogdev.blog.csdn.net%252Farticle%252Fdetails%252F102605809%2522%252C%2522announcementCount%2522%253A0%252C%2522announcementExpire%2522%253A3600000%257D',
        # 'Host': 'blog.csdn.net',
        # 'Referer': 'https://passport.csdn.net/login?code=public',
        # 'Sec-Fetch-Mode': 'navigate',
        # 'Sec-Fetch-Site': 'same-site',
        # 'Sec-Fetch-User': '?1',
        # 'Upgrade-Insecure-Requests': '1',
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36',
    }
try:
    request = urllib.request.Request(url=url,headers=headers)

    response = urllib.request.urlopen(request)

    content = response.read().decode('utf-8')
    print(content)
except urllib.error.HTTPError:
    print(1111)

except urllib.error.URLError:
    print(2222)
```

#### 2.cookie登录

	使用案例：
	        1.人人网登陆
	        2.weibo登陆
	        作业：qq空间的爬取
#### 3.Handler处理器

	为什么要学习handler？
	      urllib.request.urlopen(url)
	          不能定制请求头
	      urllib.request.Request(url,headers,data)
	          可以定制请求头
	      Handler
	          定制更高级的请求头（随着业务逻辑的复杂 请求对象的定制已经满足不了我们的需求（动态cookie和代理不能使用请求对象的定制）
```
eg:
import urllib.request
url = 'http://www.baidu.com'
headers = {
        'User - Agent': 'Mozilla / 5.0(Windows NT 10.0;Win64;x64) AppleWebKit / 537.36(KHTML, likeGecko) Chrome / 74.0.3729.169Safari / 537.36'
    }
request = urllib.request.Request(url=url,headers=headers)

handler = urllib.request.HTTPHandler()

opener = urllib.request.build_opener(handler)

response = opener.open(request)

print(response.read().decode('utf-8'))

```

#### 4.代理服务器

	1.什么是代理服务器?
		是一种重要的服务器安全功能，它的工作主要在开放系统互联(OSI)模型的会话层，从而起到防火墙的作用
	翻墙，是指绕过相应的IP封锁、内容过滤、域名劫持、流量限制等
	2.代理的常用功能?
		1.突破自身IP访问限制，访问国外站点。
		2.访问一些单位或团体内部资源
				扩展：某大学FTP(前提是该代理地址在该资源的允许访问范围之内)，使用教育网内地址段免费代理服务器，就可以用于对教育网开放的各类FTP下载上传，以及各类资料查询共享等服务。
		3.提高访问速度
				扩展：通常代理服务器都设置一个较大的硬盘缓冲区，当有外界的信息通过时，同时也将其保存到缓冲区中，当其他用户再访问相同的信息时， 则直接由缓冲区中取出信息，传给用户，以提高访问速度。
		4.隐藏真实IP
				扩展：上网者也可以通过这种方法隐藏自己的IP，免受攻击。
	3.代码配置代理
		创建Reuqest对象
		创建ProxyHandler对象
		用handler对象创建opener对象
		使用opener.open函数发送请求
```
eg:
import urllib.request
url = 'http://www.baidu.com/s?wd=ip'
headers = {
        'User - Agent': 'Mozilla / 5.0(Windows NT 10.0;Win64;x64) AppleWebKit / 537.36(KHTML, likeGecko) Chrome / 74.0.3729.169Safari / 537.36'
    }
request = urllib.request.Request(url=url,headers=headers)
proxies = {'http':'117.141.155.244:53281'}
handler = urllib.request.ProxyHandler(proxies=proxies)
opener = urllib.request.build_opener(handler)
response = opener.open(request)
content = response.read().decode('utf-8')
with open('daili.html','w',encoding='utf-8')as fp:
    fp.write(content)
```

扩展：1.代理池

​	    2.快代理

#### 5.cookie库

	1.cookie库能干啥:通过handler登陆会自动的保存登录之后的cookie
	2.cookie库配置
		创建一个CookieJar对象
		使用cookiejar对象，创建一个handler对象
		使用handler创建一个opener
		通过opener登录
		handler会自动的保存登录之后的cookie
```
案例：全书网
# 登陆之后进入到藏书架
import urllib.request
import urllib.parse
import http.cookiejar

url_login = 'http://www.quanshuwang.com/login.php?do=submit'
headers = {
        'User - Agent': 'Mozilla / 5.0(Windows NT 10.0;Win64;x64) AppleWebKit / 537.36(KHTML, likeGecko) Chrome / 74.0.3729.169Safari / 537.36'
    }
data = {
    'username': 'action',
    'password': 'action',
    'action': 'login',
}
# 对参数进行编码
data = urllib.parse.urlencode(data).encode('utf-8')
# 请求对象的定制
request = urllib.request.Request(url=url_login,headers=headers,data=data)
# 获取一个cookiejar对象
cookiejar = http.cookiejar.CookieJar()
# 获取一个handler对象
handler = urllib.request.HTTPCookieProcessor(cookiejar=cookiejar)
# 获取opener对象
opener = urllib.request.build_opener(handler)
# 获取response对象
response = opener.open(request)
url_bookcase = 'http://www.quanshuwang.com/modules/article/bookcase.php'
request_bookcase = urllib.request.Request(url=url_bookcase,headers=headers)
# 因为之前的opener中 已经包含了登陆的cookie  那么再次使用opener 就会携带已经存在cookie
# 去访问了
response_bookcase = opener.open(request_bookcase)
content = response_bookcase.read().decode('gbk')
with open('bookcase.html','w',encoding='gbk')as fp:
    fp.write(content)
```

#### 6.正则表达式回顾

	单字修饰符：
		1. .   匹配任意字符，除了换行符
		2. []  用来表示一组字符,单独列出：[abc] 匹配 'a'，'b'或'c'
		3. \d  匹配任意数字，等价于 [0-9].
		4. \D  匹配任意非数字
		5. \w  匹配字母数字及下划线
		6. \W  匹配非字母数字及下划线
		7. \s  匹配任意空白字符，等价于 [\t\n\r\f].
		8. \S  匹配任意非空字符
```
数量修饰符
	1.*    匹配0个或多个的表达式	
	2.+    匹配1个或多个的表达式
	3.?    匹配0个或1个由前面的正则表达式定义的片段
	4.{m}  前面字符出现m次
	5.{m,} 前面字符出现至少m次
	6.{m,n}前面字符出现m~n次
```

```
边界修饰符
	1.^    以...开始
	2.$    以...结尾
	eg:
      '^abc' 匹配以abc开头
      ‘abc$'  匹配以abc结尾
```

```
分组修饰符
	1.() 匹配括号内的表达式，也表示一个组	
	2.\1  \2  匹配第1、2个分组的内容
	eg:
     （.*）:(.*)
    	\1  \2
```

```
贪婪模式/非贪婪模式
          贪婪模式：在整个表达式匹配成功的前提下，尽可能多的匹配 ( * )；
          非贪婪模式：在整个表达式匹配成功的前提下，尽可能少的匹配 ( ? )；
          Python里数量词默认是贪婪的。
          示例一 ： 源字符串：abbbc
          使用贪婪的数量词的正则表达式 ab* ，匹配结果： abbb。 
          * 决定了尽可能多匹配 b，所以a后面所有的 b 都出现了。
          使用非贪婪的数量词的正则表达式ab*?，匹配结果： a。 
          即使前面有 *，但是 ? 决定了尽可能少匹配 b，所以没有 b。
          
          示例二 ： 源字符串：aa<div>test1</div>bb<div>test2</div>cc
          使用贪婪的数量词的正则表达式：<div>.*</div>
          匹配结果：<div>test1</div>bb<div>test2</div>
          这里采用的是贪婪模式。在匹配到第一个“</div>”时已经可以使整个表达
          式匹配成功，但是由于采用的是贪婪模式，所以仍然要向右尝试匹配，
          查看是否还有更长的可以成功匹配的子串。匹配到第二个“</div>”后，
          向右再没有可以成功匹配的子串，匹配结束，匹配结果为
          “<div>test1</div>bb<div>test2</div>”

          使用非贪婪的数量词的正则表达式：<div>.*?</div>
          匹配结果：<div>test1</div>
          正则表达式二采用的是非贪婪模式，在匹配到第一个“</div>”
          时使整个表达式匹配成功，由于采用的是非贪婪模式，
          所以结束匹配，不再向右尝试，匹配结果为“<div>test1</div>”。
```

```
模式修饰符
	regular expression			
		1.re.S  单行模式
		2.re.M  多行模式
		3.re.I 忽略大小写
```

```
使用步骤：
      re.complie()
      			  compile 函数用于编译正则表达式，生成一个正则表达式Pattern对象
                  Pattern对象 = re.compile(正则表达式)
                  Pattern对象》find all（html）
      findall()
      			 在字符串中找到正则表达式所匹配的所有子串，并返回一个列表，如果没有找到匹配的，则返回空列表。
```

案例：抓取src的值

```
content = '''
    <div class="thumb">
        <a href="/article/119749308" target="_blank">
        <img src="//pic.qiushibaike.com/system/pictures/11974/119749308/medium/app119749308.jpg" alt="糗事#119749308" class="illustration" width="100%" height="auto">
        </a>
    </div>
    <div class="thumb">
        <a href="/article/119750010" target="_blank">
        <img src="//pic.qiushibaike.com/system/pictures/11975/119750010/medium/app119750010.jpg" alt="糗事#119750010" class="illustration" width="100%" height="auto">
        </a>
    </div>
    <div class="thumb">
        <a href="/article/121859652" target="_blank">
        <img src="//pic.qiushibaike.com/system/pictures/12185/121859652/medium/LZB48T44DNIAY1CV.jpg" alt="糗事#121859652" class="illustration" width="100%" height="auto">
        </a>
    </div>
'''
```

作业：1.站长素材 下载所有的黑人图片 

#### 7.xpath

```
xpath基本语法：
	1.路径查询
		//：查找所有子孙节点，不考虑层级关系
		/：找直接子节点
	2.谓词查询
		//div[@id]  
		//div[@id="maincontent"]    
	3.属性查询
		//@class         
	4.模糊查询
		//div[contains(@id, "he")]   
		//div[starts-with(@id, "he")] 
	5.内容查询
		//div/h1/text()
	6.逻辑运算
		//div[@id="head" and @class="s_down"]
		//title | //price
```

```
xpath使用：
	注意：提前安装xpath插件
	1.安装lxml库      
			pip install lxml -i https://pypi.douban.com/simple
	2.导入lxml.etree  
			from lxml import etree
	3.etree.parse()   解析本地文件
		    html_tree = etree.parse('XX.html')	
	4.etree.HTML()    服务器响应文件
		    html_tree = etree.HTML(response.read().decode('utf-8')	
	4.html_tree.xpath(xpath路径)
```

应用案例：

​	           1.站长素材图片抓取并且下载（http://sc.chinaz.com/tupian/shuaigetupian.html）--》懒加载

​		   2.股票信息提取（http://quote.stockstar.com/）