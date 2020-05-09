# CSS Lesson 1

## [初识CSS]


```
1990年，Tim Berners-Lee和Robert Cailliau共同发明了Web。1994年，Web真正走出实验室。

从HTML被发明开始，样式就以各种形式存在。不同的浏览器结合它们各自的样式语言为用户提供页面效果的控制。最初的HTML只包含很少的显示属性。

随着HTML的成长，为了满足页面设计者的要求，HTML添加了很多显示功能。但是随着这些功能的增加，HTML变的越来越杂乱，而且HTML页面也越来越臃肿。于是CSS便诞生了。

1994年哈坤·利提出了CSS的最初建议。而当时伯特·波斯（Bert Bos）正在设计一个名为Argo的浏览器，于是他们决定一起设计CSS。

其实当时在互联网界已经有过一些统一样式表语言的建议了，但CSS是第一个含有“层叠”丰意的样式表语言。在CSS中，一个文件的样式可以从其他的样式表中继承。读者在有些地方可以使用他自己更喜欢的样式，在其他地方则继承或“层叠”作者的样式。这种层叠的方式使作者和读者都可以灵活地加入自己的设计，混合每个人的爱好。

哈坤于1994年在芝加哥的一次会议上第一次提出了CSS的建议，1995年的www网络会议上CSS又一次被提出，博斯演示了Argo浏览器支持CSS的例子，哈肯也展示了支持CSS的Arena浏览器。

同年，W3C组织（World WideWeb Consortium）成立，CSS的创作成员全部成为了W3C的工作小组并且全力以赴负责研发CSS标准，层叠样式表的开发终于走上正轨。有越来越多的成员参与其中，例如微软公司的托马斯·莱尔顿(Thomas Reaxdon)，他的努力最终令Internet Explorer浏览器支持CSS标准。哈坤、波斯和其他一些人是这个项目的主要技术负责人。1996年底，CSS初稿已经完成，同年12月，层叠样式表的第一份正式标准（Cascading style Sheets Level 1）完成，成为w3c的推荐标准。

1997年初，W3C组织负责CSS的工作组开始讨论第一版中没有涉及到的问题。其讨论结果组成了1998年5月出版的CSS规范第二版。

CSS3 计划将 CSS 划分为更小的模块。起草时间是2001 年 5 月 23 日.以前的规范作为一个模块实在是太庞大而且比较复杂，所以，把它分解为一些小的模块，更多新的模块也被加入进来。这些模块包括： 盒子模型、列表模块、超链接方式 、语言模块 、背景和边框 、文字特效 、多栏布局等。
```
然而到现在我们W3C推荐的依然是CSS2



* CSS Cascading style sheet   层叠 样式 表
* HTML 控制网页的结构;
* CSS控制结构中的元素的样式或者说,控制网页的外观;
* JS是控制网页的动作的;
* "层叠"是指多个外层元素的样式,会被内层去继承
* "样式"主要指的是外观,包括'字体,文本,背景图,定位,浮动等等'


## [CSS 语法格式]
```
<style type="text/css">
	h1 {color:red;font-size:12px;}
</style>
```

* 一个CSS规则,由`选择器`和CSS格式构成的.
* "选择器"选择了一个HTML标记,并给其加上样式.
* "CSS"格式是放在`{}`中.CSS格式是有多条语句构成.
* 每一条CSS格式语句必须以`英文格式`下的`;`结束,最后一条可以不加;
* 每一条CSS格式语句是由`属性名:属性值`构成
* "属性名"是CSS中规定的,不能自己定义.


## [CSS 选择器]

###  一.基本选择器

#### (1)通配符`*`

* 描述:将代表HTML所有的标签
* 注意:通配符的兼容性不是太好,`IE6不支持的`
* 举例:`*{color:red;font-size:12px;text-align:center;}`

#### (2)标签选择器

* 描述:标签选择器于HTML标签一一对应,但是不加`</>`

比如:

```

<style type="text/css">
div{color:blue;font-size:12px;background-color:yellow;}
</style>

```
```
<div class="div">
你好
</div>

```

#### (3)类选择器(类样式)

* 描述:给一类的HTML标记添加样式.只要HTML标记的`class`属性是一样的,浏览器就认为是一类.
* HTML里的公共属性,就是每个标签都可以拥有的属性;比如`id`,`name`,`class`,`style`,`title`等.
* 说明:类选择器,是以小数点开头的`.`,比如`.div{color:red;}`.
* 同一个类样式可以给不同的HTML,一个HTML`class`属性可以包含多个类样式;


比如:

```
.style_1{color:blue;}
.style_2{font-size:12px};
.style_3{border:1px solid red};
```
```
<p class='style_1 style_2 style_3'>样式1</p>
<p class='style_1 style_2'>样式2</p>
<p class='style_1'>样式3</p>
```

#### (4)id选择器

* 描述:给网页中指定id属性的HTML样式.
* 要求:在一个网页中，不能有多个相同id值的元素。id相当于身份证号码，只能使用一次(具有唯一性)。
* 说明：`class属性用来给元素添加CSS的，而id属性一般是用来加JS的`
* id选择器命名：必须以“#”开头命名。

比如:
```
#idCard{color:red;}
```
```
<span id='idCard'></span>
```

### 二、组合选择器

#### （1）多元素选择器

* 描述：同时给多个元素，加同一种样式。多个元素之间用英文下的逗号隔开.

比如:

```
ul,ol,li,dl,dt,dd{margin:0px;padding:0px;}
```

#### (2)后代元素选择器

* 描述:给某个元素的所有后代元素，添加样式。两个选择器之间用空格隔开.

`<div><sapn></span></div>`这里面的`span`就是`div`的后代元素.
比如:

```
#div h2{color:blue;border:1px solid blue;background-color:yellow;}
```
```
<div id='div'>
	<h2>新闻标题1</h2>
	<div>
		<h2>新闻标题2</h2>
	</div>
</div>
```

#### （3）子元素选择器

* 描述：给当前元素的子元素添加样式。两个选择器之间用大于号(>)隔开。

（3）子元素选择器
比如:

```
#div>h2{color:blue;border:1px solid blue;background-color:yellow;}
```
```
<div id='div'>
	<h2>新闻标题1</h2>
	<div>
		<h2>新闻标题2</h2>
	</div>
</div>
```

###  (4) 后代元素

```
#div h2{color:blue;border:1px solid blue;background-color:yellow;}
```



### 二、伪类选择器

* 伪类选择器，一般是用来选择`<a>`元素的。
* 超级链接有四种状态：正常状态、放上状态、访问过状态、激活状态。
* 四种状态正好对应四种选择器。
  * `:link` 正常链接效果。
  * `:visited` 访问过的效果
  * `:hover` 鼠标放上的效果
  * `:active` 激活状态(鼠标点击的一瞬间出现一般不用)
  * `这4个的顺序一定不能弄错,弄错了就没有效果`
* `text-decoration`属性
  * `none`     默认。定义标准的文本。
    * `underline`定义文本下的一条线。
    * `overline`定义文本上的一条线。
    * `line-through`定义穿过文本下的一条线。
    * `blink`定义闪烁的文本。

```
/*全局的链接样式,所有的样式都会改变*/
	a:link{color:gray;text-decoration:none;}
	a:visited{color:green;text-decoration:underline;}
	a:hover{color:red;}
	a:active{color:yellow;}
/*局部的链接样式,只有对应的几个类才有样式*/
	a.a1:link{color:black;text-decoration:none;}
	a.a1:visited{color:gray;text-decoration:underline;}
	a.a1:hover{color:blue;}
	a.a2:link{color:red;text-decoration:none;}
	a.a2:visited{color:black;text-decoration:underline;}
	a.a2:hover{color:green;}
```
```
<a href="#">在吗</a>
<a href="#">干嘛</a>
<a href="#" class='a1'>借钱</a>
<a href="#" class='a2'>不在</a>
```

## [CSS尺寸属性]

* width：元素的宽度。
* height：元素的高度。

比如:
```
img{width:100px;height:100px;}
img{width:50%;height:50%;}
```

## [CSS字体属性]

* font-size：文字大小。
* font-weight：加粗效果。取值：bold
* font-style：斜体效果。取值：italic
* font-family：字体。

## [CSS文本属性]

* color：文本颜色。
* line-height：行高，可以是百分比，也可以是固定值。
* text-align：文本的水平对齐方式，取值：left、center、right
* letter-spacing：字间距。
* text-decoration：文本修饰线，取值：underline(下划线)、none、overline(上划线)、line-through(删除线)
* text-indent：首行缩进。

## [px和em以及rem]

* px像素（Pixel）。相对长度单位。像素px是相对于显示器屏幕分辨率而言的。
* em是相对长度单位。相对于当前对象内文本的字体尺寸。如当前对行内文本的字体尺寸未被人为设置，则相对于浏览器的默认字体尺寸。em是根据父类的变化而变化的
* rem和em类似,`rem:root em`;相对于根的比较;
* 默认的大小是16px

比如:
`需要在css中的body选择器中声明font-size=80%`才能使用
```
body{font-size:100%;}
div{font-size:1.5em;}
span{font-size:2rem;}
```
```
<body>
	<p>你好</p>
	<div>你好<br/>
	<span>你好</span>
	</div>
</body>
```
