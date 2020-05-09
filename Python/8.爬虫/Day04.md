## Day04

#### 1.BeautifulSoup

1.基本简介

```
1.BeautifulSoup简称：
     bs4
2.什么是BeatifulSoup？
	BeautifulSoup，和lxml一样，是一个html的解析器，主要功能也是解析和提取数据
3.优缺点？
	缺点：效率没有lxml的效率高	
	优点：接口设计人性化，使用方便
```

2.安装以及创建

```
1.安装
	pip install bs4
2.导入
	from bs4 import BeautifulSoup
3.创建对象
	本地文件生成对象
		soup = BeautifulSoup(open('1.html'), 'lxml')
		注意：默认打开文件的编码格式gbk所以需要指定打开编码格式
		
	服务器响应的文件生成对象
		soup = BeautifulSoup(response.read().decode(), 'lxml')
```

3.节点定位

```
1.根据标签名查找节点
		soup.a 【注】只能找到第一个a
			soup.a.name
			soup.a.attrs
2.函数
		(1).find(返回一个对象)
                  find('a')：只找到第一个a标签
                  find('a', title='名字')
                  find('a', class_='名字')
		(2).find_all(返回一个列表)
                  find_all('a')  查找到所有的a
                  find_all(['a', 'span'])  返回所有的a和span
                  find_all('a', limit=2)  只找前两个a
		(3).select(根据选择器得到节点对象)【推荐】
                  1.element
                      eg:p
                  2..class
                      eg:.firstname
                  3.#id
                      eg:#firstname
                  4.属性选择器
                      [attribute]
                          eg:li = soup.select('li[class]')
                      [attribute=value]
                          eg:li = soup.select('li[class="hengheng1"]')
                  5.层级选择器
                      element element
                          div p
                      element>element
                          div>p
                      element,element
                          div,p 
                          		eg:soup = soup.select('a,span')
3.获取子孙节点
		contents：返回的是一个列表
			eg:print(soup.body.contents)
		descendants：返回的是一个生成器
			eg:for a in soup.body.descendants:
					print(a)
```

4.节点信息

```
	(1).获取节点内容：适用于标签中嵌套标签的结构
            obj.string
            obj.get_text()【推荐】
	(2).节点的属性
            tag.name 获取标签名
                eg:tag = find('li)
                   print(tag.name)
		   tag.attrs将属性值作为一个字典返回
	(3).获取节点属性
            obj.attrs.get('title')【常用】
            obj.get('title')
            obj['title']
```

5.节点类型（理解）

```
节点类型
	bs4.BeautifulSoup 根节点类型
	bs4.element.NavigableString 连接类型  可执行的字符串
	bs4.element.Tag 节点类型  
	bs4.element.Comment 注释类型
		eg:
			if type(aobj.string) == bs4.element.Comment:
                print('这个是注释内容')
             else:
                print('这不是注释')
```

应用实例： 1.股票信息提取（http://quote.stockstar.com/）

​		    2.中华英才网-旧版

​                    3 .腾讯公司招聘需求抓取（https://hr.tencent.com/index.php）

#### 2.selenium

```
1.什么是selenium？
	（1）Selenium是一个用于Web应用程序测试的工具。
	（2）Selenium 测试直接运行在浏览器中，就像真正的用户在操作一样。
	（3）支持通过各种driver（FirfoxDriver，IternetExplorerDriver，OperaDriver，ChromeDriver）驱动真实浏览器完成测试。
	（4）selenium也是支持无界面浏览器操作的。
```

```
2.为什么使用selenium？
	模拟浏览器功能，自动执行网页中的js代码，实现动态加载
```

```
3.如何安装selenium？
	（1）操作谷歌浏览器驱动下载地址
			http://chromedriver.storage.googleapis.com/index.html 
	（2）谷歌驱动和谷歌浏览器版本之间的映射表
			http://blog.csdn.net/huilan_same/article/details/51896672
	（3）查看谷歌浏览器版本
			谷歌浏览器右上角-->帮助-->关于
	（4）pip install selenium
```

```
4.selenium的使用步骤？
	（1）导入：from selenium import webdriver
	（2）创建谷歌浏览器操作对象：
				path = 谷歌浏览器驱动文件路径
				browser = webdriver.Chrome(path)
	（3）访问网址
				url = 要访问的网址
				browser.get(url)
```

```
4-1：selenium的元素定位？
		元素定位：自动化要做的就是模拟鼠标和键盘来操作来操作这些元素，点击、输入等等。操作这些元素前首先要找到它们，WebDriver提供很多定位元素的方法
		方法：
              1.find_element_by_id
              			eg:button = browser.find_element_by_id('su')
              2.find_elements_by_name
              			eg:name = browser.find_element_by_name('wd')
              3.find_elements_by_xpath
              			eg:xpath1 = browser.find_elements_by_xpath('//input[@id="su"]')
              4.find_elements_by_tag_name
              			eg:names = browser.find_elements_by_tag_name('input')
              5.find_elements_by_css_selector
              			eg:my_input = browser.find_elements_by_css_selector('#kw')[0]
              6.find_elements_by_link_text
              			eg:browser.find_element_by_link_text("新闻")
```

```
4-2:访问元素信息
	获取元素属性
		.get_attribute('class')
	获取元素文本
		.text
	获取id
		.id
	获取标签名
		.tag_name
```

```
4-3:交互
	点击:click()
	输入:send_keys()
	后退操作:browser.back()
	前进操作:browser.forword()
	模拟JS滚动:
		js = 'document.body.scrollTop=100000'
		js='document.documentElement.scrollTop=100000'
		browser.execute_script(js) 执行js代码
	获取网页代码：page_source 
	退出：browser.quit()
	案例练习：糗事百科
```

#### 3.Phantomjs

```
1.什么是Phantomjs？
	（1）是一个无界面的浏览器
	（2）支持页面元素查找，js的执行等
	（3）由于不进行css和gui渲染，运行效率要比真实的浏览器要快很多
```

```
2.如何使用Phantomjs？
	（1）获取PhantomJS.exe文件路径path
	（2）browser = webdriver.PhantomJS(path)
	（3）browser.get(url)
	 扩展：保存屏幕快照:browser.save_screenshot('baidu.png')
```

#### 4.Chrome handless

```
1.系统要求：
          Chrome 
                Unix\Linux 系统需要 chrome >= 59 
                Windows 系统需要 chrome >= 60
          Python3.6
          Selenium==3.4.*
          ChromeDriver==2.31
```

```
2.配置：
	from selenium import webdriver
	from selenium.webdriver.chrome.options import Options

    chrome_options = Options()
    chrome_options.add_argument('--headless')
    chrome_options.add_argument('--disable-gpu')

    path = r'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe'
    chrome_options.binary_location = path

	browser = webdriver.Chrome(chrome_options=chrome_options)

	browser.get('http://www.baidu.com/')
```

```
3.配置封装：
          from selenium import webdriver
          #这个是浏览器自带的  不需要我们再做额外的操作
          from selenium.webdriver.chrome.options import Options

          def share_browser():
              #初始化
              chrome_options = Options()
              chrome_options.add_argument('--headless')
              chrome_options.add_argument('--disable-gpu')
              #浏览器的安装路径    打开文件位置
              #这个路径是你谷歌浏览器的路径
              path = r'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe'
              chrome_options.binary_location = path

              browser = webdriver.Chrome(chrome_options=chrome_options)

              return  browser
  封装调用：
          from handless import share_browser

          browser = share_browser()

          browser.get('http://www.baidu.com/')

          browser.save_screenshot('handless1.png')
```

作业：1.阳光宽频网

​            2.西瓜视频

#### 5.requests

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
3.get请求
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
		参数无需urlencode
	r.text : 获取网站源码
	r.encoding 访问或定制编码方式
	r.url 获取请求的url
	r.content 响应的字节类型
	r.status_code 响应的状态码
	r.headers 响应的头信息
```

```
4:post请求
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
5：get和post区别？
	1：get请求的参数名字是params  post请求的参数的名字是data  
	2 请求资源路径后面可以不加?  
	3 不需要手动编解码  4 不需要做请求对象的定制
```

```
6：proxy定制
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
7:cookie定制
	应用案例：
            （1）笑话集
            		http://www.jokeji.cn/
            		账号密码	action   action123
            （2）全书网登陆
            		账号密码    action    action
            （3）chinaunix
            （4）古诗文网（需要验证）
            （5）云打码平台
            	用户登陆   actionuser  action
			   开发者登陆  actioncode  action
```

