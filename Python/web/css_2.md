# CSS Lesson 2

## [CSS列表属性]
`list-style`：列表样式，指定样式的符号。取值：none(无符号)

```
.ul{list-style:none;}
```
```
	<ul>
		<li>你好</li>
		<li>干嘛</li>
	</ul>
	<ul class='ul'>
		<li>再见</li>
		<li>拜拜</li>
	</ul>
```
## [CSS边框属性]

```
border-left：左边框线。
	格式：border-left: 粗细 线型 颜色;(px)
	线型：none(无线)、solid(实线)、dotted(点状线)、dashed(虚线)、double(双线)
	颜色:十进制  十六  单词
	注意：多个参数值之间用空格隔开。
	举例：div{border-left:5px solid red;}
border-right：右边框线。
border-top：上边框线。
border-bottom：下边框线。
简写方式：
	border：四个边框都加同一种边线。
	举例：div{border:2px solid blue;}
```
比如:

```
.box{
		border-left:5px solid blue;
		border-right:5px dotted red;
		border-top:5px dashed black;
		border-bottom:5px double green;
		width:200px;
		height:200px;
	}
```
```
<div class="box"></div>
```
## [CSS填充属性]
### 一.内边距-边线到内容间的距离

```
padding-left：左内填充距离(左边线到内容之间的距离)。
padding-right：右内填充距离。
padding-top：上内填充距离。
padding-bottom：下内填充距离。
简写方式:
	padding:10px; //四个内填充都是10px
	padding:10px 20px; //上下内填充为10px，左右内填充为20px
	padding:5px 10px 15px; //上填充为5px，左右为10px，下为15px
	padding:5px 10px 15px 20px;  //顺序一定为：上右下左
```
### 二.外边距：边框线往外的距离

```
margin-left：左外边距(左边框线再往外的距离)
margin-right：右外边距。
margin-top：上外边距。
margin-bottom：下外边距。
简写方式:
	margin:10px;   //四个外边距分别为10px
	margin:10px 20px;  //上下外边距10px，左右外边距20px
	margin:5px 10px 15px;  //上外边距5px，左右外边距10px，下外边距15px
	margin:5px 10px 15px 20px;  //顺序一定是：上右下左
```
## [CSS背景属性]

```
background-color：背景颜色
background-image：图片的路径(相对路径或绝对路径)。如：background-image:url(images/bg.gif);
background-repeat：控制图片的平铺方式。
	no-repeat：不平铺。
	repeat-x：水平方向平铺。
	repeat-y：垂直方向平铺。
repeat：水平和垂直都平铺(默认)。
background-position：背景图片的定位方式。
	格式：background-position：水平方向定位 垂直方向定位
	定位的单词：left、center、right、top、bottom
	举例：background-position:center center; //图片居中容器的正中
	定位也可以使用百分比值。如：background-position:0% 50%;
	定位也可以使用固定像素值。如：background-position:5px 5px; //背景图距离容器左边和上边都是5px
```
注意事项：`要想使用图片定位功能，该图片不能进行平铺`。
```
简写方式:
	格式：background：背景色 图片的路径 平铺方式 定位方式
	举例：background:red url(images/bg.gif) no-repeat center center;
	举例：background:url(images/bg.gif) no-repeat center 50%;
	举例：background:url(images/bg.gif) repeat-y;
```
例题:
```
/*全局样式设置*/
body,h2,p{margin:0px;padding:0px;}
body{font-size:14px;color:#333;background-color:#ccc;}
/*局部样式设置*/
.box{
	width:600px;
	margin:30px auto;
	padding:10px 10px 130px;
	background:white url(images/02.gif) no-repeat 480px bottom;

}
.box h2{
	text-align:center;
	padding:10px 0px;
	color:red;
}
.box p{
	line-height:160%;
	text-indent:28px;
	color:blue;
}
```
```
<div class="box">
<h2>一带一路</h2>
<p>“一带一路”（英文：The Belt and Road，缩写B&R）是“丝绸之路经济带”和“21世纪海上丝绸之路”的简称。它将充分依靠中国与有关国家既有的双多边机制，借助既有的、行之有效的区域合作平台，一带一路旨在借用古代丝绸之路的历史符号，高举和平发展的旗帜，积极发展与沿线国家的经济合作伙伴关系，共同打造政治互信、经济融合、文化包容的利益共同体、命运共同体和责任共同体。
2015年3月28日，国家发展改革委、外交部、商务部联合发布了《推动共建丝绸之路经济带和21世纪海上丝绸之路的愿景与行动》。</p>
</div>
```
## [CSS浮动和清除]
###  1.CSS浮动(飘起来)

* float：浮动属性，取值：left或right。
* CSS浮动可以使元素向左或向右浮动。浮动到父元素的边上或者上一个浮动元素的边上。
* 浮动的元素不再占空间了。
* 浮动的元素层级高于普通元素(没有浮动)。
* 浮动的元素一定是块元素，不管以前是什么元素。换句话：行内元素浮动以后，也变成了块元素。


```
.box {border:5px solid black; width:400px;}
.box .box1{width:100px;height:100px;float:left;background-color:red;}
.box .box2{width:100px;height:100px;float:left;background-color:blue;}
.box .box3{width:100px;height:100px;float:left;background-color:green;}
```
```
<div class='box'>
	<div class="box1"></div>
	<div class="box2"></div>
	<div class="box3"></div>
</div>
```
### 2.清除浮动

* clear：清除浮动，取值：left、right、both(两者)`clear:both;`
* 一般情况下，上面有浮动，下面就得清除浮动
* 先浮动，后清除；有浮动，必须要有清除浮动
* 清除浮动后，可以让父元素在“视觉”上包含浮动元素
* 清除浮动后，清除浮动之后的其它元素，将恢复默认排版(不再继承上面的浮动特性)

```
.box {border:5px solid black; width:400px;}
.box .box1{width:100px;height:100px;float:left;background-color:red;}
.box .box2{width:100px;height:100px;float:left;background-color:blue;}
.box .box3{width:100px;height:100px;float:left;background-color:green;}
.box p{clear:both;}
```
```
<div class='box'>
	<div class="box1"></div>
	<div class="box2"></div>
	<div class="box3"></div>
	<p>你在哪里</p>
</div>
```
## [CSS继承性和优先级]
###  1、CSS继承性

多个外层元素的样式，最终都要叠加到内层元素上。
内层元素的样式，可以从多个外层元素上去继承。
哪些`CSS`属性会被`继承`呢？
主要是文本和字体方面的样式。如：font-size、font-weight、font-style、font-family、line-height、text-indent、text-align、color、text-decoration、letter-spacing、word-spacing等。


`左边是Firefox_F12查看的结果,右边是Chrome_F12查看的结果`

 ![upToLong](images_css_2\upToLong.png)

 ![upTochrome](images_css_2\upTochrome.png)

### 2、CSS选择器优先级

（1）单个选择器优先级
行内样式 > Id选择器 > 类选择器 > 标签选择器>通配符


(2）组合选择器的优先级
`组合选择器`如何确定优先级？
基本思路：`指向越精确，优先级越高`。
平常把不同的选择器假设不同的值：

```
标签选择器，看成1；
类选择器，看成10；
ID选择器，看成100；
行内样式，看成1000。
```
例如：`div.news .title{color:red;}`  优先级为21
例如：`.news .title{color:blue;} `   优先级为20
例如：`#title{color:green;}  `      优先级为100