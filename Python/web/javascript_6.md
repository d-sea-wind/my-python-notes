# javascript_6

### BOM和DOM简介

**1、BOM**

> BOM Browers Object Model ，浏览器对象模型。



> BOM它提供了访问或操作浏览器各组件的方法或途径。



> 浏览器各组件，以下对象都是浏览器对象，不是JS的对象。

```javascript
window浏览器窗口。

location地址栏对象。

history历史记录对象。

screen屏幕对象。

navigator浏览器软件对象。

document文档对象
```

> BOM只是一个标准，是一个模型，是一个概念。它不是真正能操作的对象。



> JavaScript是Netscape(网景)公司的产品。



> BOM是W3C制定的一种操作浏览器各组件的标准。



> W3C是制定互联网标准的。如：XHTML、CSS、XML、js、DOM、BOM、HTML5等。



> BOM或DOM**标准**，是在**浏览器**当中，**以对象的形式**，得以实现。

**2、DOM**

> DOM Document Object Model，文档对象模型。



> DOM主要用来：访问或操作网页中各元素(标记)对象的一种方法途径。



> DOM模型中，把网页中各标记，都看成是一个一个的对象。

```javascript
 <p>对象

 <a>对象

<html>对象

<body>对象

 ……
```



### **BOM对象结构图**

 ![images_3](images\images_3.png)

### for…in循环

for in 循环主要用来遍历数组下标，或对象属性。

```javascript
//遍历数组的语法
for(var index in arrObj){
  循环代码;
}
```

```javascript
//使用for循环求以下数组的和
var arr = [1,3,5,7,9,11];
var arr = [];
//定义一个和的初始值
var sum = 0;
for(var i = 0;i < arr.length;i++){
  if(!isNaN(arr[i])){
  	sum += arr[i];
  }
}

document.write(sum);
```

```javascript
//使用for in循环求以下数组的和
var arr = [1,3,5,7,9,11];
//定义一个和的初始值
var sum = 0;
var n = 0 //循环次数
//只查找有效数据的下标
//如果数组是undefined,则直接跳过
for(var index in arr){
  sum += arr[index];
  n++;
}
document.write("sum="+sum+",n="+n);
```

## 课堂实例：遍历window对象属性

```javascript
//遍历window对象所有属性
var n = 1;
for(var name in window)
{
	document.write(n+" "+name+"<br>");
	n++;
}
```



### **window对象——浏览器窗口对象**

**1、window对象属性**

> name：代表窗口的名称。用于<a>标记的taget属性。



> top：代表最顶层窗口，top也是window对象。常用在框架当中。



> parent：代表父窗口，也是window对象。常用在框架当中。



> self：代表当前窗口，也是window对象。常用在框架当中。如：self.alert()



> innerWidth：窗口的内宽，不含菜单栏、工具栏、滚动条、地址栏等。(Firefox支持)

```javascript
在IE中，使用 document.documentElement.clientWidth 来代替 。
```

> innerHeight：窗口的内高，不含菜单栏、工具栏、滚动条、地址栏等(Firefox支持)

```
在IE中，使用 document.documentElement.clientHeight 来代替。

documentElement指<html>元素对象。

document.body指<body>元素对象。
```

## 课堂实例：测试不同浏览器窗口的大小

```javascript
//实例：测试自己浏览器窗口的大小(考滤兼容性)
var _width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth;
var _height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight;
document.write("width="+_width+", height="+_height);
```

**2、window对象方法**

**（1）alert()方法**

弹出一个警告对话框，只有一个确定按钮。

**（2）prompt()方法**

弹出一个输入对话框，有确定和取消两个按钮。单“确定”返回字符串数据。单击“取消”返回null。

**（3）confirm()**

> 描述：弹出一个确认对话框。



> 语法：**window.confirm(msg)**



> 参数：msg是提示信息。



> 返回值：单击“确定”返回true，单击“取消”返回false。

 

**（4）close()**

> 描述：关闭window窗口。



> 语法：**window.close()**

**如何使用 window.close() 关闭窗口？**

修改Firefox浏览器的配置。

在Firefox浏览器的地址栏，输入：**about:config** 并回车。

 ![image4](images\image4.png)

Chrome默认就是支持的



### 课堂实例：删除提示

```javascript
<script type="text/javascript">
function confirmDel()
{
	if(window.confirm("你确定要删除吗？"))
	{
		//JS没有删除数据的能力，也没有操作文件能力
		//window.location.href 跳转页面
		window.location.href = "del.php";
	}
}
</script>


<html>
<a href="javascript:void(0)" onClick="confirmDel">删除</a>
</html>
```



### window.open()

> 描述：打开一个新的浏览器窗口。



> 语法：**var winObj = window.open(url,name,options)**



> 参数：

```javascript
url：在新窗口中打开的文件的URL地址，可以为空。

name：新窗口的名字。可以通过window.name属性来获取，用于<a>标记的target属性。

options：新窗口的规格。

menubar：是否显示菜单栏，取值：yes、no

toolbar：是否显示工具栏。

status：是否显示状态栏。

scrollbars：是否显示滚动条。

location：是否显示地址栏。

width：新窗口的宽度

height：新窗口的高度

left：新窗口距离屏幕左边距离。

top：新窗口距离屏幕顶边距离。

三个参数都可以为空，为空后打开一个空白窗口。
```



> 返回值：返回一个window对象。通过该winObj变量，可以跟踪新窗口。



> 举例：var winObj = window.open(“test.html” , “newWin” , “width=400,height=300,left=300,top=200”)

## 课堂实例：弹出窗口

```javascript
//实例：弹出一个新窗口
/*
	(1)当网页加载完成，弹出一个新窗口，新窗口名字叫“win2”
	(2)新窗口的尺寸：width=400，height=300
	(3)新窗口在显示屏幕中居中显示
	(4)单击原窗口中的链接，在新窗口中显示内容
	(5)新窗口10秒钟后，自动关闭
*/
//网页加载完成后，调用一个匿名函数
window.onload = function()
{
	//变量初始化
	var url2 = "";
	var name2 = "win2";
	var winWidth = 400;
	var winHeight = 300;
	var screenWidth = screen.width;
	var screenHeight = screen.height;
	var x = (screenWidth-winWidth)/2;
	var y = (screenHeight-winHeight)/2-100;
	var options2 = "width="+winWidth+",height="+winHeight+",left="+x+",top="+y;
	//打开一个新窗口
	var winObj = window.open(url2,name2,options2);
	//给新窗口添加背景色
	winObj.document.write("<h2>新窗口的标题</h2>");
	winObj.document.body.bgColor = "gray";
	//新窗口在5秒钟后，自动关闭
	winObj.setTimeout("window.close()",5000);
}
```



### 延时器：时间一到，执行一次

**1、setTimeout()——设定延时器**

> 描述：在指定的毫秒时间后，执行JS代码**一次**。



> 语法：var timer = window.setTimeout(code,millisec)



> 参数

```javascript
code是合法的JS代码，一般是JS函数或对象方法。如果是函数的话，必须加引号。加引号相当于“传地址”。

millisec是毫秒值。1秒＝1000毫秒

返回值：返回延时器的变量id，是一个整型。用来被 clearTimeout() 清除。

举例：

var timer = window.setTimeout(“func()” , 1000)  //1秒后调用func()函数，带引号，带括号，是传地址。

var timer = window.setTimeout( func , 1000)  // 1秒后调用func()函数，不带引号不带括号，是传地址。
```



**2、clearTimeout()——清除延时器变量**

> 描述：清除由setTimeout()设置的延时器变量。



> 语法：window.clearTimeout(timer)

 

### **定时器——周期性执行**

**1、setInterval()**

> 描述：每隔指定的毫秒值，执行JS程序一次(周期性执行)。



> 语法：var timer = window.setInterval(code,millisec)



> 参数

```javascript
code是合法的JS代码，一般是JS函数或对象方法。如果是函数的话，必须加引号。加引号相当于“传地址”。

millisec是毫秒值。1秒＝1000毫秒
```

> 返回值：返回定时器的变量id，是一个整型。用来被 clearInterval() 清除。



> 举例：

```javascript
var timer = window.setInterval(“func()” , 1000)  //每隔1秒调func()函数。

var timer = window.setInterval( func , 1000)  // 每隔1秒调用func()函数。
```



**2、clearInterval()——清除定时器变量**

> 描述：清除由setInterval()设置的定时器变量。



> 语法：window.clearInterval(timer)

```javascript
var i = 1;
var timer;
function init()
{
	window.clearInterval(timer);
	//定时器开关：每隔1秒，调用start2()函数一次
	timer = window.setInterval("start2()",100);
}
function start2()
{
	//获取id=result的网页元素对象
	var inputObj = document.getElementById("result");
	//给inputObj对象value属性赋值
	inputObj.value = "该程序已经运行了"+i+"秒！";
	i++;
}
function stop2()
{
	//清除定时器变量
	window.clearInterval(timer);
}
```

```javascript
<input id="result" type="button" value="该程序已经运行了4秒！"><br>
<input type="button" value="开始" onClick="init()">
<input type="button" value="停止" onClick="stop2()">
```

## 课堂实例：简单计数器

```javascript
var i = 1;//全局变量
var timer = 0;
function start2()
{

  //获取id=result的元素对象
  var inputObj = document.getElementById("result");
  //修改inputObj元素的value属性的值
  inputObj.value = "该程序已经运行了"+i+"秒！"+timer;
  //变量更新
  i ++;
  //使用延时器函数，实现重复调用自己(递归调用)
  //延时器函数，时间一到，执行JS代码一次。
  //在某个函数中，重复不断调用当前函数，实现重复执行。
  timer = window.setTimeout("start2()",1000);

  document.getElementById("start").disabled=true;
  document.getElementById("stop").disabled=false;
}
function stop2()
{
  //清除由setTimeout()设定的变量
  window.clearTimeout(timer);
  document.getElementById("start").disabled=false;
  document.getElementById("stop").disabled=true;
}
```

```javascript
<input id="result" type="button" value="该程序已经运行了4秒！"><br>
<input id="start" type="button" value="开始" onClick="start2()">
<input id="stop" type="button" value="停止" onClick="stop2()" disabled>
```

### screen屏幕对象

> Width：屏幕总宽度，包括任务栏。



> Height：屏幕总高度，包括任务栏。



> availWidth：屏幕有效宽度，不含任务栏。



> availHeight：屏幕有效高度，不含任务栏。

```javascript
//实例：测试自己显示屏幕的分辨率
var str = "<h2>当前显示器屏幕分辨率</h2>";
str += "总宽度："+screen.width;
str += "<br>总高度："+screen.height;
str += "<br>有效宽度："+screen.availWidth;
str += "<br>有效高度："+screen.availHeight;
document.write(str);
```

### navigator对象

> appName：浏览器软件名称。如果是Firefox显示 “Netscape”。如果是IE的话，显示“Microsoft Internet Explore”



> appVersion：浏览器软件的版本号，是核心版本号。



> systemLanguage：系统语言。



> userLanguage：用户语言。



> platform：平台。

```javascript
//实例：测试不同浏览器的相关信息
var str = "<h2>当前浏览器的相关信息</h2>";
str += "浏览器软件名称："+navigator.appName;
str += "<br>浏览器版本号："+navigator.appVersion;
str += "<br>系统语言："+navigator.systemLanguage;
str += "<br>用户语言："+navigator.userLanguage;
str += "<br>平台："+navigator.platform;
document.write(str);
//*******************兼容性判断*******************
var width,height;
if(navigator.appName=="Netscape")
{
	width = window.innerWidth;
	height = window.innerHeight;
}else
{
	width = document.documentElement.clientWidth;
	height = document.documentElement.clientHeight;
}
document.write("<hr>窗口内宽："+width+", 窗口内高："+height);
```



### location地址栏对象

hrml的跳转:

<meta http-equiv="refresh" content="2;url=http://www.baidu.com">

js跳转:

location.href = “http://www.sina.com.cn”;

注意：以下所有属性，重新赋值后，将重新刷新网页。

> href：获取或设置地址栏中的地址。如：location.href = “http://www.sina.com.cn”



> host：获取或设置主机名。



> hostname：主机名。



> pathname：文件及路径。



> search：查询字符串。指地址栏中“?”之后的字符。如：**?**name=yao&password=123456



> protocol：协议。如：http://、ftp://、file:///



> hash：锚点名称。如：#top



> reload()：刷新网页，相当于工具栏中“刷新”按钮。

```javascript
//实例：location对象应用
var str = "<h2 style='color:red;background-color:yellow'>获取当前地址栏中的相关信息</h2>";
str += "完整的地址信息："+location.href;
str += "<br>主机名："+location.host;
str += "<br>主机名："+location.hostname;
str += "<br>文件及路径："+location.pathname;
str += "<br>查询字符串："+location.search;
str += "<br>协议："+location.protocol;
str += "<br>锚点名称："+location.hash;
document.write(str);
```



### history对象

> go(n)：既可以前进，也可以后退。

```javascript
history.go(0)  //刷新当前网页

history.go(1)  //前进一步

history.go(2)  //前进二步

history.go(-1)  //后退一步

history.go(-2)  //后退二步
```

> forward()：相当于“前进”按钮。



> back()：相当于“后退”按钮。

```html
<a href="test.html">新闻内容</a><br>
<input type="button" value="前进" onClick="history.go(1)">

<a href="test.html">新闻内容</a><br>
<input type="button" value="后退" onClick="history.go(-1)">
```



### 课堂实例：图片自动切换

```javascript
//实例：图片切换效果
/*
	(1)当网页加载完成时，开始图片切换。
	(2)给<img>指定id。
	(3)获取id=img01的元素的对象
	(4)使用延时器或定时器实现。
*/
//(1)当网页加载完成时，调用一个普通函数。
window.onload = init;//将函数地址传给事件
                     //函数传地址，不带括号
					 //带括号，是将函数的执行结果传事件。
					 //函数结果，就是返回值，默认返回undefined
//定义函数
function init()
{
	//定时器开关
	window.setInterval("start2()",1000);
}
//动画主函数
var i = 1;
function start2()
{
	if(i>6)
	{
		i = 1;
	}
	//获取id=img01的图片对象
	var imgObj = document.getElementById("img01");
	//给imgObj对象src属性重新赋值
	imgObj.src = "images/image_"+i+".jpg";
	i++;
}
```



```javascript
//实例：图片切换效果
/*
	(1)当网页加载完成时，开始图片切换。
	(2)给<img>指定id。
	(3)获取id=img01的元素的对象
	(4)使用延时器或定时器实现。
*/
//(1)当网页加载完成时，调用一个普通函数。
window.onload = init;//将函数地址传给事件
                     //函数传地址，不带括号
					 //带括号，是将函数的执行结果传事件。
					 //函数结果，就是返回值，默认返回undefined
var i = 1;
//定义函数
function init()
{
	if(i>6)
	{
		i = 1;
	}
	//获取id=img01的图片对象
	var imgObj = document.getElementById("img01");
	//给imgObj对象src属性重新赋值
	imgObj.src = "images/image_"+i+".jpg";
	i++;
	//延时器开关
	window.setTimeout("init()",1000);
}
```

```html
<img id="img01" src="images/image_1.jpg" />
```





