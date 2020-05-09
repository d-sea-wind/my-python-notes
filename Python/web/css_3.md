# CSS Lesson 3

## [display属性] 


* 描述：控制元素显示方式。
* 取值：`none`(不显示)、`block`(块显示)、`inline`(以行内元素显示)
* 注意：元素隐藏不再占空间了。


```
h1{display:none}     /*隐藏属性*/
span{
	width:400px;
	height:100px;
	background-color:yellow;
	margin:5px 10px 0px;
	display:block;/*以块显示*/
}
div{
	width:200px;
	height:100px;
	background-color:#009966;
	margin:5px 10px 0px;
	display:inline;/*以行内样式显示*/
}
```
```
<h1>上海千锋py1905</h1>
<span>上海千锋py1905</span>
<div>上海千锋py1905<div>
<div>上海千锋py1905<div>
<div>上海千锋py1905<div>
```

## [overflow属性]


* 描述：当内容溢出如何处理。
* 取值：scroll(出现滚动条)、hidden(隐藏)、auto(自动)、visible(显示)


```
.news{
	width:500px;
	height:300px;
	border:1px solid red;
	margin:50px auto;
	paddig:30px;
	overflow:scroll;
}
```
```
<p class="news">[环球时报综合报道]香港《经济日报》5月31日报道称，一项调查发现，
超过九成的香港大学生对中国经济发展前景乐观；约八成香港大学生愿意到内地工作，
其中接近一半的人愿在内地工作超过3年或以上。报道称，
香港青联学生交流网络在今年2月至4月访问450名大学生，约八成受访者认为，
内地工作机会多、有较好发展前景，愿意到内地发展。也有近九成的学生说，
内地实习经验有助于提高自身竞争力。不过也有少部分受访学生称，
不熟悉内地生活文化和工作模式，令他们选择到内地工作时却步。（李进）
</p>
```



## [cursor光标类型]


* 描述：改变光标的显示类型。
* 取值：pointer(手形)、help(帮助)、text(文本)、wait(等待)等。


```
h1{
	color:blue;
	text-decoration:underline;
	cursor:pointer;/*手型*/
}
```
```
<h1 onclick="location.href='http://www.baidu.com'">goto baidu</h1>
```



## [CSS定位属性]

### 1.`position`：定位属性，取值static、fixed、relative、absolute
`static`：静态定位，不定位，默认值。
`fixed`：固定定位。
`relative`：相对定位。相对所有标记的高度和
`absolute`：绝对定位。 相对的浏览器的边框

### 2.定位坐标值
`left`：距离目标元素左边的距离。
`right`：距离目标元素右边的距离。
`top`：距离目标元素顶边的距离
`bottom`：距离目标元素底边的距离。
提示：如果不指定定位坐标值，定位元素在“原地不动”。

### 3.固定定位——position:fixed
固定定位元素，是相对于浏览器窗口，来进行的定位。
固定定位元素，不再占空间了。
固定定位元素层级高于普通元素。
固定定位元素，一定是块元素，不管原来是什么元素。
如果不指定定位坐标，则该元素“原地不动”，位置不会改变。



```
.box{
	width:600px;
	border:1px solid #ccc;
	padding:20px;
	margin:0px auto;
}
.qq{
	width:100px;
	height:200px;
	background-color:green;
	position:fixed; /*固定定位*/
	right:200px;/*元素右边距离窗口右边距离*/
	top:200px;/*元素上边距离窗口上边距离*/
}
```
```
<div class="qq"></div>
<div class="box">
<h1>中越联合公报：早日达成南海行为准则</h1>
<p>应中国共产党中央委员会总书记、中华人民共和国主席习近平的邀请，
越南共产党中央委员会总书记阮富仲于2015年4月7日至10日对中华人民共和国进行正式访问。
访问期间，中共中央总书记、国家主席习近平与阮富仲总书记举行会谈。
中共中央政治局常委、国务院总理李克强，中共中央政治局常委、全国人大常委会委员长张德江，
中共中央政治局常委、全国政协主席俞正声分别会见阮富仲总书记。在友好、坦诚的气氛中，
双方相互通报了各自党和国家的情况，就新形势下进一步加强两党两国关系及共同关心的国际和地区问题深入交换了意见，
达成广泛共识。也对促进本地区和世界的和平、稳定、合作与发展产生了积极影响。
续发挥好中越双边合作指导委员会等两党两国间交流合作机制的作用，
统筹推进合作，协调解决问题，服务于两国人民利益。
实施好《落实中越全面战略合作伙伴关系行动计划》，推动两国各领域务实合作取得新进展。
</p>
</div>
</div>
```

### 4.相对定位—— position:relative
相对定位，是相对于“原来的自己”进行的定位。
相对定位元素，所占的空间依然存在。
相对定位元素，层级要高于普通元素。
如果不指定定位坐标，该元素“原地不动”。
原来是什么元素，进行相对定位后，还是什么元素。
定位元素可以超出父元素的边界，而浮动元素，是不可以超出父元素的边界。

```
.box{width:600px;border:1px solid #444;margin:50px auto;}
.box .div1{
	width:100px;
	height:100px;
	background-color:red;
	position:relative;
	left:-200px;
	bottom:-20px;
	z-index:5; /*层叠顺序，值越大越靠上*/
}
.box .div2{
	width:100px;
	height:100px;
	background-color:green;
	position:relative; /*相对定位*/
	left:-200px;/*定位元素左边到原来自己的左边距离*/
	top:-50px;/*定位元素上边到原来自己的上边距离*/
}
.box .div3{width:100px;height:100px;background-color:blue;}
```
```
<div class="box">
	<div class="div1"></div>
	<div class="div2"></div>
	<div class="div3"></div>
</div>
```

###  5.绝对定位—— position:absolute

绝对定位元素，是相对于上层定位元素来进行定位的。如果父元素没有指定定位的话，继续向上查找定位元素。如果一直找到<body>都没有找到定位元素，则相对于<body>来定位。
绝对定位元素，不占空间。
绝对定位元素层级高于普通元素。
绝对定位元素的上层定位元素，一般会用相对定位。因为相对定位的空间还在。



```
.box{
	width:600px;
	border:1px solid #444;
	margin:50px auto;
	position:relative; /*相对定位*/
}
.box .div1{width:100px;height:100px;background-color:red;}
.box .div2{
	width:100px;
	height:100px;
	background-color:green;
	position:absolute; /*绝对定位元素*/
	left:50px;/*相对于box元素进行定位*/
	top:50px;/*相对于box元素进行定位*/
}
.box .div3{width:100px;height:100px;background-color:blue;}
```
```
<div class="box">
	<div class="div1"></div>
	<div class="div2"></div>
	<div class="div3"></div>
</div>
```

## [HTML引入CSS的方法]

### 1.嵌入式

描述：通过`<style>`标记来书写CSS代码。
格式：`<style  type = “text/css”>……</style>`
说明：这种方式只能在当前HTML文件中使用，不能被多个HTML文件共享。
说明：`<style>`标记可以在网页中多次出现，想写在什么地方，就写在什么地方。



```
<style type="text/css">
body{
	font-size:12px;
	color:#333;
	background-color:#fff;
}
</style>
```

### 2.外联式
描述：将外部的 `.css`文件引入到当前的HTML文件中。
说明：可以将公共的CSS代码放在外部的文件，通过`<link>`标记将其引入，可以实现多个网页共享同一个CSS文件。
格式：`<link href = “css/public.css” type = “text/css” rel = “stylesheet” />`
属性：
`href`：指定外部的CSS文件路径。
`type`：指链入文件的类型。
`rel`：链接入文件与当前HTML文件的关系。取值：`stylesheet`。
说明：`<link>`标记是`<head>`的子标记。一个网页中也可出现多个`<link>`。`<link>`标记可以放在HTML网页的任何地方。



```
<link href="css/my.css" type="text/css" rel="stylesheet"/>
```

### 3.行内式

描述：直接给HTML标记添加`style`属性。
每一个HTML标记，都有一些公共的属性：`id`、`class`、`style`、`title`等。
其中，`style`属性的值，就是CSS的代码。
行内样式的优先级最高。

```
<div style="width:400px;height:200px;"><div>
```

## [盒子模型]

可以把任何的HTML标记，都看成是一个`盒子`。
`盒子`包括哪些部分？内容的宽和高、边框线、内填充、外边距。

 ![![box](file:///C:/Users/ruidong/Desktop/%E7%AC%AC%E4%BA%8C%E9%98%B6%E6%AE%B5/web_3/images_css_3/box.png?lastModify=1521611802)](images_css_3\box.png)


`一个“盒子”的总宽度计算 ＝ width(内容宽度)  +  padding(内填充)  +  border(边框线)  +  margin(外边距)`


上下外边距合并问题
当上下两个普通的块元素(不是浮动元素，也不是定位元素)的上下外边距碰在一起时，会发生“外边距合并”的现象。
外边距合并后，外边距取其中较大的一个值。

 ![margin](images_css_3\margin.png)


如何实现上下两个块元素的距离为100px？
1.可以通过添加上元素的下外边距为100px，下元素的上外边距为0px，可以实现间隔100px

 ![margin_1](images_css_3\margin_1.png)

```
body{margin:0px;padding:0px;background-color:#ccc;}
.div1{width:100px;height:100px;background-color:red;margin:50px 0px 0px 50px;}
.div2{width:100px;height:100px;background-color:blue;margin:0px 0px 0px 50px;}
```
```
<div class="div1"></div>
<div class="blank"></div>
<div class="div2"></div>
```

2.上下两个块元素之间，再添加一个空的<div>，并且指定高度为100px



```
body{margin:0px;padding:0px;background-color:#ccc;}
.div1{width:100px;height:100px;background-color:red;margin:50px 0px 0px 50px;}
.div2{width:100px;height:100px;background-color:blue;margin:0px 0px 0px 50px;}
.blank{height:100px;}
```
```
<div class="div1"></div>
<div class="blank"></div>
<div class="div2"></div>
```

## [CSS表格属性]

`border-collapse`：合并表格边框线。取值：`collapse`(合并)
注意：不要再使用`rules`属性合并单元格边线了，因为兼容性不好。

```
<style type="text/css">
table{
	border:5px solid blue;
	border-collapse:collapse;
}
td{border:2px dotted red;}
</style>
```
```
<table width="500" align="center">
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>
```

# 网页兼容性，可以从以下几个方面来考滤

```
全局CSS设置

常用兼容性技巧

CSS HACK

```



### 全局CSS设置

1、所有HTML标记都要清除内外边距

```
html,body,ul,li,a,img,p,h1,h2,h3,h4,input{margin:0;padding:0;}

*{margin:0px;padding:0px;}
```

2、去除有序列列或无序列表前面的符号

```
	ul,li,ol{list-style:none;}
```

3、全局的链接样式

```
a:link , a:visited{color:#444;text-decoration:none;}

a:hover{color:red;}
```

4、网页中所有文字的大小及颜色

```
 body{ font-size:18px; color:#444; font-family:Arial , 楷体 , 宋体;}
```

5、去除图片的边框线

```
img{border:0;}
```

6、自定义样式

```
.red{color:red;}

.blue{color:blue;}

.floatL{float:left;}

.floatR{float:right;}

.clear{clear:both;}

.blank10{height:10px; clear:both;}

.left{}

.right{}

 ……
```

### 常用的兼容性技巧

将文本的行高，设置与容器的高度一样。













