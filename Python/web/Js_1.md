# JavaScript_1



### JavaScript是什么？

一个网页的前端由三个部分构成：

```
HTML：超文本标注语言，主要用来控制内容的结构的。

CSS：层叠样式表，主要用来控制HTML标签的格式的。

JavaScript：客户端的脚本程序，主要用来控制HTML标签的行为的。
```



#### JavaScript是一种小型的、轻量级的、面向对象的、跨平台的客户端脚本语言。

```
JavaScript是集成在浏览器当中的，只要安装了浏览器，JavaScript就有了。

JavaScript是面向对象的一种编程语言。可以把网页中的任何元素都看成是一个“对象”。

如：<b>、<a>、<p>、浏览器窗口、网页文档、历史记录、CSS等。

什么是对象？就是指现实中的“东西”。现实中的“东西”看得见，摸得着。

如：人、动画、桌子、电脑、房子、汽车、飞机等。

一个“对象”应该由“属性”和“方法”构成。

>张三是一个“对象”。

张三的“特征”“属性”有哪些？姓名、性别、年龄、学历、身高、体重等。属性是对象具有普遍性。

张三的“方法”就是指他的行为(动作)，指有哪些技能(本事)。如：开飞机、打游戏、骑自行车等。
```

```
跨平台：可以运行在多种平台上。如：windows、linux、unix、mac os等。

客户端脚本程序：JS只能运行客户端(浏览器)。

服务端的脚本程序：PHP、ASP.NET、ASP、JSP、Python、Ruby等。
```

### JavaScript能干什么？

> 表单验证是JS的最基本功能。



> DHTML动态的HTML。自动完成的动画效果。



> 交互式的功能。二级联动菜单、滚动文字。

 

### JavaScript名称的由来？

```
最初的名称叫LiveScript。是由Netscape公司(网景公司)为自己的浏览器Navigator2.0开发的客户端的脚本程序。

因为中当时Java比较火，想借助Java快速流行起来，因此改名为“JavaScript”。

JavaScript与Java一点关系都没有。
 
```

### <script></script>标记

js程序代码，也是嵌入到HTML当中去的。

```
<script type="text/javascript">
/*
	这里写JS的代码
*/
</script>
```

---

### [1]常用的两个客户端输出方法

#### 1、document.write(str)

> 描述：在网页中输出一个字符串的内容。



>document文档对象，一个网页看成是一个document对象。



> document对象的属性和方法有很多。



>write()是document对象的一个方法。



>方法是带小括号的。属性不带小括号。



>小数点“.”是document对象和write()之间的连接号,和我们python非常相似。通过“.”去访问或调用对象的属性或方法。



>str代表要在<body>中输出的内容。字符串内容要加引号。



>注意：JS是区分大小写的。

```
<script type="text/javascript">
	document.write("<h2>上海py1905</h2>")
	document.write("<h2>我是被输出来的</h2>")
</script>
```

---

#### 2、window.alert(str)

>描述：弹出一个警告对话框，警告对话框的信息是str。



>window浏览器窗口对象，代表一个浏览器窗口。



>alert()是window对象的一个方法。alert()的主要功能就是弹出一个警告对话框。



>window对象和alert()方法之间用小数点“.”连接。



> str表示显示的提示信息。字符串的内容要加引号。

```
<script type="text/javascript">
	alert("我是被弹出来的!")
	alert("<h2>上海你好!</h2>")
	document.write("<h2>上海py1905</h2>")
	document.write("<p>我是被踹出来的</p>")
	console.log('123');
    console.info('name','234');
</script>
```

### [2] JS中的注释

> HTML的注释：<!--注释内容-->



> CSS注释：/*  注释内容 */



> JS的单行注释：//



> JS的多行注释：/*  多行注释 */

```
<script type="text/javascript">
	//控制台输出信息
	console.log('123');
	console.info('name','234');
	//弹出警告对话
	alert("我是被弹出来的!")
	alert("<h2>上海你好!</h2>")
	/*在body中输出内容*/
	document.write("<h2>上海py1905</h2>")
	document.write("<p>我是被踹出来的</p>")
</script>
```

### [3] JS中的变量

#### 1、变量的概念

l 变量是**临时**存储数据的容器。如：一个瓶子。

l 变量是在**内存中**存在和运行的。如：name = 100

l 变量相当于宾馆的房间号。变量就是一个代号。代一个值或一个数据。

l 变量的值，在程序运行过程中，是可以变化的。

l 计算机内存，可以看成是由若干个“**小格子**”构成。每个小格子可以存放一个变量。

 ![image_1](images_js_1\image_1.png)



#### 2、变量的声明(预订房间号)

​	变量在使用之前，必须先声明(先预订)。

​	声明变量，就是在内存中，给某个值开个空间。

​	语法：`var 变量名;`

​	其中，var是系统关键字，不能挪位它用。var和变量名之间用空格隔开。

```
//变量的声明
var name;//一次声明一个
var name,sex,age;//一次声明多个
var name = "Jack" //边声明变赋值
```



#### 3、变量的命名规则

>变量名只能包含a-z、A-Z、0-9、_符号。



>变量名只能以字母或下划线开头。如：n123(合法)  2a(非法)



>变量名不能以数字开头。



>变量名是区分大小写。如：Name和name和NamE是三个变量。



>变量名不能是系统关键字。如：var var;



>对于由多个单词构成的变量名，该如何处理？

```
“匈牙利”命名方式：getUserName、setUserName

“蛇形”命名方式：get_user_name、set_user_name  

```

#### 4、给变量赋值(装东西)

>使用“=”给变量赋值。如：name = “Mary” //装 “Mary”数据装到变量name中



>“=”左边只能是一个**变量名称**，左边不能作计算。

```
var name + 10 = 100; 这是错误的
var name = 100 + 100;  这是正确的
```

> “=”右边是一个值，也可以是一个计算表达式。右边运算完毕后，一定有一个**具体的值**。

```
var name = a > b ? 10 : 20;  //这是合法的
//python的三元运算符
name = 10 if a > b else 20
```

> “=”与学校的“=”形式是一样的，但含义不一样。如：x=3

---



### [4] 变量的数据类型

变量中存储的都是各种各样的数据，数据是有类型的。

变量本身没有类型，是变量的值或数据有类型。

#### JS中数据类型分类：

>基本数据类型：字符型、数值型、布尔型、未定义型、空型(null)



> 复合数据类型：数组型、对象型、函数型。



#### 1、数值型(能进行加减乘除的)

​	数值型分为整型和浮点型(小数)。

```
var a = 100;
var a = -100;
var a = 0.98;
var a = -0.98;
var a = 0;
```

#### 2、字符型(不能进行加减乘除的)

​	用单引号或双引号，引起来的一串字符。

```
var str = "abc";
var str = 'abc';
var str = "<h2>你好</h2>";
```

---

### JS中的运算符

#### 1、算术运算符：+、-、\*、/、%、++、--

```
var a = 10; 
var b = 20;
var c = a + b;
var d = a - b;
var e = a * b;
var f = a / b; 
var g = b % a; 
var h = a++;
var i = b--;
document.write(c+"<br />");
document.write(d+"<br />");
document.write(e+"<br />");
document.write(f+"<br />");
document.write(g+"<br />");
document.write(h+"<br />");
document.write(i+"<br />");
```



#### 2、字符串连接符：+

```
var a = "罗密欧"; 
var b = "朱丽叶";
var c = a + b;
document.write(c);
```

#### 3、+和+=的两种用法

##### （1）“+”的两种用法

​	（A）“+”如果左右两个操作数，都是数值的话，将执行“加法”运算。

```
var a = 10 + 20;
var b = a + 20;
```

​	（B）如果左右有一个操作数是字符串的话，将执行字符串“连接”运算。

```
var a = 10;
var b = a + "100" //b = 10 + "100" = "10100" 
document.write(b)
```

##### （2）“+=”的两种用法：先加后等。

​	（A）如果左右两个操作数，都是数值的话，则执行“加法”运算。

```
//"+="先加后等
var a = 10;
a += 20;
document.write(a)
```

​	（B）如果左右两个操作数，有一个是字符串的话，则执行字符串“连接”运算。

```
//"+="先连后等.
var a = 10;
a += "20";
document.write(a)
```



### 编写程序的一般步骤

> 变量初始化：声明变量，并赋值。



> 程序的运算过程。



> 最后输出结果。



# 课堂实例:输出个人信息

```
//实例:输出个人信息

//(1)变量初始化
var name = "张三";
var sex  = "男";
var age  = 24;
var edu  = "本科";
var salary = 2000;
var bonus = 500;
var city  = "上海";

//(2)构建输出的结果
var str = "";
str += "<h2>" + name + "的基本信息"+"</h2>";
str += "姓名:" + name;
str += "<br />性别:" + sex;
str += "<br />年龄:" + age;
str += "<br />学历:" + edu;
str += "<br />工资"  + salary;
str += "<br />奖金"  + bonus;
str += "<br />籍贯"  + city;
str += "<br />实发工资:" + (salary + bonus)
```











