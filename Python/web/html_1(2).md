# HTML Lesson 2

## [图片标记——行内元素]

语法格式:`<img  属性 = “属性值” />`
常用属性:

```html
src：指图片的路径，该路径可以是相对地址，也可以是绝对地址。
width：图片的宽度。
height：图片的高度。
alt：图片说明。当图片不存在时，显示一个提示信息。
border：图片边框的粗细。
left或right：可以实现图文混排。
left或right的功能相当于CSS中的“浮动”效果。
```

`小技巧:如何保证图片等比例缩放：只需要设置width和height其中一个值即可`。



```html
<img src='images_2/qf_01.jpg' width='40%' border='2' align='left'/>
```
![qf_01](images_2\qf_01.jpg)


如何实现图片在某个元素中居中对齐？

```
<p align='center' style='border:5px solid red;'><img src='images_2/qf_01.jpg' width='40%'/></p>
```

<p align='center' style='border:5px solid red;'><img src='images_2/qf_01.jpg' width='40%'/></p>
## [超级链接——行内元素]

语法格式：`<a  属性 = “属性值”>……</a>`
常用属性:

```
href：链接的地址。该地址可以是绝对路径，也可以是相对路径。
target：链接的目标文件在哪个窗口中来打开。
		_blank：弹出一个空白窗口来打开文件。
		_self：在当前窗口中来打开目标文件。
		_parent：在父窗口中来打开目标文件。(常用于框架网页中)
		_top：在最顶层窗口中来打开目标文件。(常用于框架网页中)
name：指定一个锚点名称。所谓“锚点”用于长网页当中。
```
### 1、绝对路径

#### （1）远程的绝对路径

以 `http://` 开头的网址，就是“绝对路径”。

```
<h2>远程绝对路径</h2>
<ul>
	<li><a href='http://www.baidu.com' target='_blank'>百度</a></li>
	<li><a href='http://www.taobao.com' target='_self'>淘宝</a></li>
	<li><a href='http://www.jd.com' target='_blank'>京东</a></li>
</ul>
```
#### （2）本地的绝对路径

以 file:/// 协议开头的网址，也是“绝对路径”

```
<h2>远程绝对路径</h2>
<ul>
	<li><a href='file:///E:/1000phone/demo.html' target='_blank'>练习</a></li>
	<li><a href='file:///E:/1000phone/marquee.html' target='_blank'>滚动字幕</a></li>
</ul>
```
### 2、相对路径

#### （1）当前文件和目标文件在同一个目录下

如果当前文件和目标文件在同一个目录下，是同一级情况下，链接地址：`直接写目标文件名即可`。

```
<a herf='demo.html' target='_blank'>文件</a>
```
#### （2）当前文件和目标文件所在的目录是同一级

链接地址：`先写目标文件夹名，再写目标文件名`。

```
<a herf='project/demo.html' target='_blank'>文件</a>
```
#### （3）目标文件位于上级目录中

链接地址：`先向上走一级(../)，再往上走一级(../../)，再找某个文件夹，再找文件夹下的文件`。

```
<a herf='../phphub/web.html' target='_blank'>文件</a>
```

### 什么样的链接，可以弹出下载对话框

浏览器可以直接识别的文件类型：.html   .jpg   .gif   .png   .htm  .jpeg
除以上的类型之外，其它链接的文件都会出现下载提示。

```
<h2>特殊链接<h2>
<ul>
	<li><a href='#'>普通的空链接</a></li>
	<li><a href='javascript:void(0)'>JS空链接</a></li>
	<li><a href='maito:thismy@163.com'>给我发送邮件</a></li>
	<li><a href='profile/win7.rar'>下载</a></li>
	<li><a href="javascript:alert('我是信息提示')">信息提示</a></li>
</ul>
```
## [html颜色表示]

用颜色单词表示：red、green、blue、white、black  rainbow
用10进制表示：rgb(255,0,0) 、rgb(0,255,0)、rgb(0,0,255)、rgb(255,255,255)、rgb(0,0,0)
用16进制表示：#FF0000、#00FF00、#0000FF
`提示：16进制是用2位表示一位基色`。
`注意：16进制颜色表示和颜色单词表示，兼容性较好。而10进制有的浏览器不支持`。
`RGB`色彩模式
自然界中有很多颜色，都可以使用红色(red)、绿色(green)、蓝色(blue)三原色的不同亮度混和而成。
在计算机中，`RGB`三原色可以用1个字节来表示，1个字节是8位二进制。如：0001 1001 可以表示一种颜色
`RGB`每一位的取值是0-255，这个是10进制的表示方法。`RGB`共可以表示：256*256*256约等于1670万色。



```
<ul>
	<li>颜色单词表示：
		<ol>
			<li><font color="red">红色</font></li>
			<li><font color="green">绿色</font></li>
			<li><font color="blue">蓝色</font></li>
		</ol>
	</li>
	<li>10进制表示：
		<ol type="A">
			<li><font color="rgb(255,0,0)">红色</font></li>
			<li><font color="rgb(0,255,0)">绿色</font></li>
			<li><font color="rgb(0,0,255)">蓝色</font></li>
		</ol>
	</li>
	<li>16进制表示：
		<ol type="i">
			<li><font color="#FF0000">红色</font></li>
			<li><font color="#00ff00">绿色</font></li>
			<li><font color="#0000ff">蓝色</font></li>
		</ol>
	</li>
</ul>
```

第一张图是`IE`的效果;第二张图是`Firefox`的效果;第三张图是`chrome`的效果;

 ![ie](images_2\ie.png)

 ![firefox](images_2\firefox.png)

 ![chrome](images_2\chrome.png)

结论:

```
在单词颜色表示和十进制颜色表示中,Firefox和chrome的内核颜色表示是一致的,按照W3C标准的;
IE的内核是不一样的;
但是在16进制中三个浏览器显示都一样;
所以颜色表示采用16进制是最好的方法;
在IE10以后也采用W3C标准;


#2019年 浏览器不再有IE内核,统一使用chrome内核
#QQ浏览器 IE内核也可以使用chrome
```
## [计算机进制(了解)]

计算机是信息处理工具，它只能识别`二进制`的数据。在内存中运行的数据、在磁盘上存储的数据、在网络中传输的数据，都是`二进制`数据,其它进制和字符.数字最终都会被转换成二进制。

```
10进制：有10个基本数，分别为0、1、2、3、4、5、6、7、8、9，十进制的运算规则“逢十进一”。如：9+1=10
2进制：有2个基本数，分别为0、1，运算规则“逢二进一”。如：(1101)2+1 = (1110)2
8进制：有8个基本数，分别为0、1、2、3、4、5、6、7，八进制运算规则“逢八进一”。如：(67)8+1 = (70)8
	因为二进制太长了，没有规律，不方便记忆，因此，小型机引用了八进制。
	也就是说：一个八进制字数，可以用3位二进制来表示。
	举例：(111010)2 转成 (72)8
16进制：有16个基本数，分别为0、1、2、3、4、5、6、7、8、9、A(10)、B(11)、C(12)、D(13)、E(14)、F(15)。运算规则“逢16进一”。如：(89)16+1 = (8A)16
	16进制和2进制之间也可以很好转换。
	转换规则：一个16进制的数，可以用4位二进制来表示。
	举例：(A23)16 转成二进制   (1010 0010 0011)2
```
 ![bin_table](images_2\bin_table.png)

## [锚点链接]

锚点链接：可以实现在一个网页的不同部分实现跳转，用在长网页当中(`一定要有滚动条`)。锚点可以理解为一个`记号`。
锚点的制作两个步骤。
定义锚点(记号):`<a  name = “top”></a>`
锚点的命名规则:

```
名称可以包含 a-z、A-Z、0-9、_这些符号。
不能以数字开头。
可以以字母或下划线开头。
```
跳转到锚点(记号)：
```
省略文件名：<a  href = “#top”>返回顶部</a>
不省略文件名：<a  href = “index.html#top”>返回顶部</a>
文件名可以省略。如果省略，跳转到当前网页的那个记号处。
```
```
<a name='top'>i'm top</a>
<a href='#top'>go back</a>
```

## [计算机编码(了解)]

计算机只能处理`二进制`数据，别的数据(a-z、A-Z、0-9、特殊符与、汉字等)计算机都不能直接识别。
将常用的字符，与计算机二进制作一个对应关系，这个对应关系称为`编码`.`字符集`。
常用的计算机编码或字符集有哪些？ASCII、GBK、GB2312、BIG5、JIS、UTF-8等
1、ASCII编码
ASCII是世界上第一个字符编码或字符集。是美国人开发的。用于显示美国的语言。
ASCII编码是用1个字节(8位二进制)来表示，共可以对 `2^8=256`个字符进行编码。

 ![ascii](images_2\ascii.png)


2、ANSI编码

```
	其它国家都想让计算机能处理本国语言，因此，都对ASCII编码进行扩展。扩展后的ASCII编码，统称为ANSI编码。ANSI编码是用2个字节(16位二进制)来表示一个字符。
	在中国，ANSI编码就是GB2312.
	在台湾，ANSI编码就是BIG5.
	在日本，ANSI编码就是JIS。
	……
```
3、GB2312和GBK
```
	GB2312是我国1980年由中国标准化局研制成功的。
	GB2312共对6763个汉字进行了编码。
	
	GBK是对GB2312的一个扩展，K是扩展的意思。
	GBK共收录了2.3万个字符。
```
4、unicode编码

```
	因为ANSI编码，不能在国家与国家之间交流，因此就有了unicode编码。
	Unicode编码，将世界上所有符号来一个统一编码。
	Unicode是用4个字节(32位二进制)来表示一个字符。
	Unicode现在容量，已经对100多万个字符进行了编码。
	如：A  ——> 0000 0000 0000 0000 0000 0000 0100 0000
```
5、utf-8编码——多国语言编码

```
	Utf-8统一格式转换编码。会根据不同的字符进行自由选择编码的长度。
	ASCII字符，一个字节能表示，就不需要用4个字节来表示。
	比如：A  0100 0001
```
## [meta标记]

`<meta>`标记，主要用来模拟HTTP协议的。换句话说：就是网页中的内容如何显示？
`<meta>`标记是单边标记。
`<meta>`标记的内容在网页中是看不见。

### <meta>标记的属性

```
http-equiv：模拟HTTP协议的文件头信息。一般要与content属性配合使用。
name：指定网页的描述信息。一般要与content属性配合使用。
content属性：指定参数的详细信息。
```
### http-equiv的应用
#### （1）设置网页的类型和字符集

```
#h4
<meta http-equiv='Content-Type' content='text/html;charset=utf-8'>
```
#### （2）网页自动刷新，以及延时跳转

```
<meta http-equiv="refresh" content="2">   //每隔2秒，刷新网页一次
<meta http-equiv="refresh" content="5;url=http://www.ifeng.com">  //5秒钟后，跳转到凤凰网
```
### name属性的应用
#### （1）设置网页关键字

```
<meta name="keywords" content="网站建设，企业网站建设，网站制作，网上商城，网站推广，域名注册，大把推，高端设计定制，企业邮箱，中企动力" />
```
#### （2）设置网页关键字

```
<meta name="description" content="网站建设、网站制作专家中企动力，为您提供专业的展示型网站建设、营销型网站建设、独立商城系统网站建设、汽车4S行业解决方案、社会化">
```

我搜索的关键字是`网站建设`



![meta_seo](images_2\meta_seo.png)


H5 meta设置;

```
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,maximum-scale=1.0,user-scalable=0"/>
```
这个是针对移动端浏览器写的一些页面属性，
`name="viewport"` --这就是针对移动端浏览器，
`width=device-width`--告诉浏览器页面的宽度应该等于设备的宽度，
`initial-scale=1.0`--页面将是原本尺寸展示，
如果后面是`2.0`的话，--就是是将页面放大两倍，
`maximum-scale=1.0`,--最大放大至原先大小，
`user-scalable=0` --是禁止缩放！



## [XHTML简介(了解)]
XHTML是可扩展的超文本标注语言。
XHTML是用来替换HTML4.01(1999开始使用)的。
XHTML是严格的纯净的HTML，可以实现结构和表现的分离。
HTML主要应用在PC端，而XHTML可以应用于手机、IPAD、电视等。



### XHTML编写规范

XHTML标记要求全小写。
XHTML所有标记都必须关闭。如：`<br />、<meta />、<input />`
XHTML所有属性都要有值。如：`<hr noshade = “noshade”  />`
XHTML所有的属性值都要加引号。
XHTML要求结构和表现分离。如：`<font>、<i>、<u>`等都不再用了，而使用CSS代替。
XHTML文档必须要有DTD文档类型定义。



### DTD文档类型定义
DTD文档类型定义，是XHTML的一套标记规则，来检验XHTML的语法是否合法。
### DTD共有三种类型：
#### （1）严格型的DTD

```
也就是在<body>中，不能再出现表现的标记。如：<font>、<b>、<i>、<u>、bgColor、background等。
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
```
#### （2）过渡型DTD

```
允许在<body>继续使用各种表现标记。
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
```
#### （3）框架型DTD

```
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
```
## [表格标签]
### 1.表格的结构


```
<table>
	<caption>我是一个表格</caption>
	<tr>
		<th>内容</th>
		<th>内容</th>
		<th>内容</th>
	</tr>
	<tr>
		<td>内容</td>
		<td>内容</td>
		<td>内容</td>
	</tr>
</table>
```

<table>
<caption>我是一个表格</caption>
<tr>
<td>内容</td>
<td>内容</td>
<td>内容</td>
</tr>
<tr>
<td>内容</td>
<td>内容</td>
<td>内容</td>
</tr>
</table>


`<table>`代表表格标记。`<tr>`代表行标记。`<td>`普通单元格。
餐后甜点:`<td>`可以理解为X轴,也就是一列;`<tr>`可以理解为Y轴,也就是一行;



### 2.table属性

```
border：边线粗细。
bordercolor：边线颜色。
width：表格宽度。
height：表格高度。
align：水平对齐方式，取值：left、center、right
bgColor：背景颜色
background：背景图片
rules：合并所有单元格边线。取值：all
cellpadding：内填充距离(单元格边线到内容间的距离)
cellspacing：单元格间距(两个单元格边线之间的距离)
```

### 3.tr属性

```
height：行高。
bgColor：背景色
background：背景图片
align：水平对齐方式，取值：left、center、right
valign：垂直对齐方式，取值：top、middle、bottom
```

### 4.td或th属性
`<th>`代表标题行，其中的内容居中加粗显示。`<td>`代表普通单元格。

```
width：单元格宽度。
height：单元格高度。
bgColor：背景色
background：背景图片
align：水平对齐方式
valign：垂直对齐方式
colspan：合并列的单元格。
rowspan：合并行的单元格。
```

### 5.caption表格标题

```
含义：给表格添加一个标题。
语法：<caption>……</caption>
说明：<caption>标记，放在<table>开始标记之后，所有的<tr>标记之前。一个表格只能有一个<caption>标记。
```

## [HTML中的音频和视频标签以及flash标签]

### 1.音频标签`<audio>`

`audio是H5的新标签`

```
<audio src="images_2/horse.ogg" controls="controls">
Your browser does not support the audio element.
</audio>
```
<audio src="images_2/horse.ogg" controls="controls">
Your browser does not support the audio element.
</audio>


audio的属性:

```
autoplay='autoplay'	如果出现该属性，则音频在就绪后马上播放.这个东西js控制了
controls='controls'	如果出现该属性，则向用户显示控件，比如播放按钮。
loop='loop'			如果出现该属性，则每当音频结束时重新开始播放。
preload='preload'	如果出现该属性，则音频在页面加载时进行加载，并预备播放。
					如果使用 "autoplay"，则忽略该属性。
src='url'			要播放的音频的 URL。
```

### 2.视频标签`<video>`
`video是H5的新标签`

```
<video src="images_2/movie.ogg" controls="controls">
your browser does not support the video tag
</video>
```
<video src="images_2/movie.ogg" controls="controls">
your browser does not support the video tag
</video>


video的属性:

```
autoplay='autoplay'	如果出现该属性，则视频在就绪后马上播放。
controls='controls'	如果出现该属性，则向用户显示控件，比如播放按钮。
height='pixels'		设置视频播放器的高度。
loop='loop'			如果出现该属性，则当媒介文件完成播放后再次开始播放。
preload='preload'	
					如果出现该属性，则视频在页面加载时进行加载，并预备播放。
					如果使用 "autoplay"，则忽略该属性。
src='url'			要播放的视频的 URL。
width='pixels'		设置视频播放器的宽度。
```

### 3.flash标签`<embed>`

```
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="778" height="202">
    <param name="movie" value="../../resource/banner.swf">
    <param name="quality" value="high">
    <param name="wmode" value="transparent">
    <embed src="images_2/banner.swf" width="100%"  quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent"></embed>
</object>
```
 <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="778" height="202">
    <param name="movie" value="../../resource/banner.swf">
    <param name="quality" value="high">
    <param name="wmode" value="transparent">
    <embed src="images_2/banner.swf" width="100%" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent"></embed>
</object>
embed的属性:

```
height='100'pixels	设置嵌入内容的高度。
src='url'	嵌入内容的 URL。
type='application/x-shockwave-flash'	定义嵌入内容的类型。
width='100'	设置嵌入内容的宽度。
```

