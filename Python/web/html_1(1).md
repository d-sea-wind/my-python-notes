# HTML Lesson 1
```
1.html 
2.css
3.js基础
4.jquery
5.vue
```

```html
C/S  终端：移动终端 手机  平板  手表(C)  
     服务器：web服务器(nginx)

cenlit  终端  需要下载   ios文件  下载了人物的模型  其它图片  计算

server  蓝洞服务器
```

```html
B/S

Browser  让体验性变得更加好,浏览器就是一个翻译器

server   服务器的压力会大一些,会把html,css,js,img,ico...文件传输给请求者的浏览器
```



## [B/S网络结构]

B Browser / S Server 浏览器/服务器，是当前最流行的网络模式。所有的功能软件都安装在服务器端，客户端相对来说，压力更小了。

 DNS:网络服务的数据库![bs](images_1\bs.png)

## [初识HTML]
HTML Hyptertext Markup Language `超文本标注语言`。

HTML的主要功能：是`控制网页结构的`。如：什么地方是标题、什么地方是段落、什么是链接等。
超文本：除了文本以外，还可能有图片、音乐、视频、链接等。
标注：可以理解为一种“标记”“记号”“标志”。如：交通标志。如：`<font>Python</font>`
语言：这里的语言与程序半点关系都没有。

### 1.html文件结构
`HTML结构树`

 ![tree](images_1\tree.png)0

`结构`

```
<!DOCTYPE html>    <---不是HTML标签；它告诉浏览器页面使用的是HTML什么版本。
<html>                    <--HTML标签
<head>                    <--HTML的头部标签
<meta charset="utf-8" />    <--设置字符集
<title>网页的标题</title>  <--网页的标题
</head>

<body>                    <--网页的正文内容,排版就是进行在body中的
	网页的正文内容
</body>
</html>
```
```
<html></html>：表示一个网页。或者告诉浏览器是什么类型的文件。<html>有两个子标记<head>和<body>。
	<head></head>：称为文件头标记。这里的内容一般是一些控制信息，其中的信息在浏览器中是看不见的。
	<title></title>:表示网页的标题，其内容只能是纯文本。
		<meta />标记，告诉浏览器，这个网页中的汉字用什么编码解析。
			默认编码是GB2312(简体中文编码)   一共对6763个汉字进行了编码。
			GBK简体中文编码，一共对9万个汉字进行编码。
			BIG5繁体中文编码。
			JIS日文编码。
			UTF-8多国语言编码，每个国家的语言都能正常显示。
	<body></body>表示网页的正文内容。正文内容在浏览器中是可见的。
```
`这是HTML4的meta的写法`

```
<meta http-equiv='content-type' content='text/html;charset=utf-8'>
```
`这是HTML5的meta的写法`

```
<meta charset="utf-8" /> 
```

`以上<meta>标记含义：告诉浏览器当前文件是什么类型的，汉字用UTF-8编码来显示。`

### 2.html标签格式

HTML标签分两类：一是`双边标记(常规标签)`，二是`单边标记(空标签)`。
格式一：`<标签 属性 = “属性值” 属性 = “属性值” >`内容`</标签>`
格式二：`<标签 属性 = “属性值” />`

```
<font color='red' face='楷体' size='6'>上海Python</font>
```
<font color='red' face='楷体' size='6'>上海Python</font>

### 3."属性"的理解
一个人可以看成一个“对象”，人有什么样的特性呢？
`姓名 = “刘晓庆” 、性别 = “女”、学历 = “大专”、工资、家庭等`。
通过这些特征，可以更详细的了解一个人。这个“特征”就是HTML中所说的“属性”。

### 4.html标签编写规范

HTML标记不区分大小写。如：`<font>`、`<Font>`、`<fOnt>`、`<FONT>`
HTML标记可能有属性，也可能没有属性。如：`<br/>`换行、`<html>`、`<head>`
HTML标记和属性间用空格隔开，各属性也用空格隔开。
HTML标记只能顺序`嵌套`，`不能交叉嵌套`。`标记`只能是`一层套一层`，`外层套里层`。

```
<font color='blue' face='楷体' size='7'><i>上海Python</i></font>
```
<font color='blue' face='楷体' size='7'><i>上海Python</i></font>

## [HTML文本修饰标记]

`和word的功能非常相似`

`<b></b>`文本加粗(bold)。`<b>Python基础班课程体系</b>`
`<i></i>`文本斜体(italic)。`<i>Python基础班课程体系</i>`
`<u></u>`下划线(underline)。`<u>Python基础班课程体系</u>`
`<s></s>`删除线(strike)。`<s>Python基础班课程体系</s>`
`<sup></sup>`上标。`a<sup>2</sup>`
`<sub></sub>`下标。`B<sub>2</sub>`
`<font></font>`文本字体。
`color`：文本颜色。
`size`：文字大小，取值1-7。1小，7大。
`face`：字体样式。取值：黑体、楷体、Arial、……



```html
正常文本  :<诗经><br/>
加粗文本  :<b>关关雎鸠，在河之洲。</b><br/>
斜体文本  :<i>窈窕淑女，君子好逑。</i><br/>
下划线文本:<u>参差荇菜，左右流之。</u></br>
删除线文本:<s>窈窕淑女， 寤寐求之。</s></br>
上标线文本:<sup>求之不得， 寤寐思服。</sup><br>
下标线文本:<sub>悠哉悠哉， 辗转反侧。<sub><br/>
字体文本  :<font color='blue' face='黑体'>
参差荇菜， 左右采之。<br/>
窈窕淑女， 琴瑟友之。<br/>
参差荇菜， 左右芼之。<br/>
窈窕淑女， 钟鼓乐之。<br/>
</font>
```
## [代码编辑器简介]

代码编辑器分两大类：(1)IDE集成开发环境 (2)增强的文本编辑器

增强的文本编辑器
相对记事本的功能强大、程序较小、语法颜色、自动缩进等。
缺点：没有代码提示功能。
有哪些软件？Editplus、Notepad++

IDE集成的开发环境
软件较大、收费软件、语法高亮、自动缩进、代码提示功能、SVN、连接MySQL功能、错误调试等。
缺点：收费。(`但是我们中国人最擅长破解,也就是搞盗版`)
有哪些软件？Dreamweaver、Zend Studio、Pycharm、sublime等。



## [使用记事本来编辑网页]

静态网页的扩展名：.html   .htm
`(在很久很久一起,windows32位操作系统不支持 大于 3个字符以上的尾缀名 所以以前是 .htmml 例如以前word文档是 .doc 现在是 .docx)`
动态网页的扩展名：.py  .jsp   .asp   .aspx

记事本的默认字符集是ansi编码，在中文操作系统下，ANSI编码就是GBK。



## [如何保证网页中的汉字不出现乱码？]

主要是两个方面，要保证`字符集是`一致的。
一方面就是`编辑环境的字符集`。
二方面就是`<meta>`标记字符集。



## [HTML排版标记]
1、`<p>`段落
格式：`<p>……</p>`
常用属性
align：文本的水平对齐方式，取值：left(左)、center(居中)、right(右)
特点：在段前或段后，会有一个空行。



```
<p align='center'>我在中间</p>
```
<p align='center'>我在中间</p>
2、换行标记`<br />`
换段标记，在段落前后会多一个空行。
换行标记，行间距不会发生任何改变。

3、水平线标记`<hr />`
语法：`<hr  属性 = “属性值”/>`
属性:

```
color：线条颜色。
size：线的粗细
width：线的宽度
align：线的水平对齐方式，取值：left、center、right
noshade：是否要去阴影。该属性没有值。
```


```
<hr noshade size='1'/>
<hr color='red' size='1' />
<hr color='blue' size='5' width='50%' align='center'/>
```

4、预排版标记：`<pre></pre>`
描述：可以保留所有的空白字符(换行、空行、空格)，换句句说：原封不动的输出。
语法：`<pre 属性 = “属性值”>……</pre>`
属性：`width`，元素的宽度。

5、标题标记`<h1>…<h1>`
描述：一共有六个标题标记，分别为`<h1>`、`<h2>`、`<h3>`、`<h4>`、`<h5>`、`<h6>`，其中`<h1>最大`，`<h6>最小`。
语法：`<h1 属性 = “属性值”>`……</h1>
属性：`align`，水平对齐方式，取值：`left、center、right`

```
<h1 align='center'><font color='red'>千锋Python学院</font></h1>
<h1 align='left'><font color='green'>千锋Python学院</font></h1>
<h1 align='right'><font color='blue'>千锋Python学院</font></h1>
```
<h1 align='center'><font color='red'>千锋Python学院</font></h1>
<h1 align='left'><font color='green'>千锋Python学院</font></h1>
<h1 align='right'><font color='blue'>千锋Python学院</font></h1>




## [块元素和行内元素(div和span)]

`<div>`和`<span>`是两个最没有意义的标记，但是，又是使用最多的标记。

1、块元素
特点：
块元素的宽度`撑满整个网页`(父元素)。
块元素一定要`另起一行`排版。
块元素`单独占一行`，不管有多少内容。
常用的块元素有哪些？`<p>、<h1>、<h2>、<h3>、<pre>、<div>、<table>`等。

2.行内元素
特点：
行内元素`没有宽度`，行内元素的宽度主要由`内容`决定。
行内元素`不会另起一行`排版。
多个行内元素排在同一行。
常用的行内元素有哪些？`<font>、<b>、<i>、<u>、<sup>、<sub>、<span>`等
注意事项：行内元素和块元素，`相互嵌套时，块元素中嵌套行内元素`。



## [HTML字符实体]



```
空格：&nbsp;     (一个汉字占用两个空格的空间)
<：&lt;
>：&gt;
&：&amp;
版权号：&copy;
￥：&yen;
×：&times;
÷：&divide;
```
```python
import html
print(html.escape('<div>'))
```

```
<font size='5'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;昨天我去图书馆买了一本书书名叫&ltDIV&CSS;&gt;,书的价格为&yen;98.00元。<br/>
&copy;青花大学出版社<br />
a &times; b &divide; c = z
```
## [HTML中的列表——块元素]

### 1.html项目符号(无序列表)

```
<ul>
	<li>内容</li>
	<li>内容</li>
	<li>内容</li>
	<li>内容</li>
	<li>内容</li>
</ul>
```

`<ul>`和`<li>`的公共属性
`type`：项目符号的类型，取值：`disc`(小黑点)、`circle`(圆圈)、`square`(小方块)

```
<ul type='square'>
	<li>内容</li>
	<li type='disc'>内容</li>
	<li>内容</li>
	<li type='circle'>内容</li>
	<li>内容</li>
</ul>
```
<ul type='square'>
	<li>内容</li>
	<li type='disc'>内容</li>
	<li>内容</li>
	<li type='circle'>内容</li>
	<li>内容</li>
</ul>


标记嵌套的原则：一定是在`最底层标记中`，来嵌套一个完整的其它标记。

```
<h1>省份城市列表<h1>
<ul>
	<li>安徽
		<ul>
			<li>合肥</li>
			<li>芜湖</li>
			<li>黄山</li>
		</ul>
	</li>
	<li>江苏
		<ul>
			<li>苏州</li>
			<li>无锡</li>
			<li>常州</li>
		</ul>
	</li>
</ul>
```



### 2.htmML编号列表(有序列表)

```
<ol>
	<li>内容</li>
	<li>内容</li>
	<li>内容</li>
	<li>内容</li>
	<li>内容</li>
</ol>
```



`<ol>`和`<li>`的公共属性
type：编号的类型。取值：a、A、1、i、I
start：从第几个开始。该值一定是正整数。

```
<h1>省份城市列表<h1>
<ol>
	<li>安徽
		<ol type='a' start='2'>
			<li>合肥</li>
			<li>芜湖</li>
			<li>黄山</li>
		</ol>
	</li>
	<li>江苏
		<ol type='I' start='2'>
			<li>苏州</li>
			<li>无锡</li>
			<li>常州</li>
		</ol>
	</li>
</ol>
```





### 3.htmML自定义列表

```
<dl>
	<dt>标题1</dt>
	<dd>内容1</dd>
	<dt>标题2</dt>
	<dd>内容2</dd>
</dl>
```
<dl>
	<dt>标题1</dt>
	<dd>内容1</dd>
	<dt>标题2</dt>
	<dd>内容2</dd>
</dl>


`<dl>` 标签用于结合 `<dt>` （定义列表中的项目）和 `<dd>` （描述列表中的项目）。

```
<dl>
	<dt>省份</dt>
		<dd>上海</dd>
		<dd>福建</dd>
		<dd>浙江</dd>
	<dt>货币</dt>
		<dd>人民币</dd>
		<dd>美元</dd>
		<dd>英镑</dd>
</dl>
```
<dl>
	<dt>省份</dt>
		<dd>上海</dd>
		<dd>福建</dd>
		<dd>浙江</dd>
	<dt>货币</dt>
		<dd>人民币</dd>
		<dd>美元</dd>
		<dd>英镑</dd>
</dl>



## [滚动字幕标记]

语法：`<marquee 属性 = “属性值”>……</marquee>`
属性:

```
Direction：滚动的方向，取值：left、right、up、down
Width：宽度
Height：高度
bgColor：背景色
scrollAmount：滚动步长值。值越大滚动的越快。默认值为6px。
scrollDelay：延时时间，两步之间停留的时间，以毫秒为单位。1秒＝1000毫秒
```
```
<marquee direction='left' width='400px' height='300px' bgcolor='#ffff66' scrollAmount='100' scrollDelay='40'>
<p>我是漂浮物</p>
</marquee>
```
<marquee direction='left' width='400' height='300' bgcolor='#ffff66' scrollAmount='12' scrollDelay='40'>
<p>我是漂浮物</p>
</marquee>

