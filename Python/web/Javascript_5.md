# Javascript_5

### JS内置对象

> String对象：提供了一些对字符串处理的属性和方法。



> Array对象：对数组操作的属性和方法。



> Date对象：提供了对系统时钟副本操作的属性和方法。



> Boolean对象：一个布尔值，就是一个Boolean对象。



> Number对象：一个数值就是一个Number对象。toFixed(2)



> Math对象：数学方面的属性和方法。



### [1] String对象——字符串对象

一个字符串的变量，就是一个String对象。

##### 1、length属性

> 描述：动态获取字符串的长度。



> 语法：var len = strObj.length

```javascript
var str = "上海py1905班";
var len = str.length;
document.write("长度为:"+len); //9
```

##### 2、toLowerCase()和toUpperCase()

> strObj.toLowerCase() 将字母转成全小写。



> strObj.toUpperCase() 将字母转成全大写。

```javascript
var str = "Welcome to ShangHai";
document.write(str.toLowerCase()); //全小写
document.write(str.toUpperCase); //全大写
```

**3、charAt(index)**

> 描述：返回字符串中指定下标处的**一个**字符。



> 说明：字符串的下标与数组下标一样，都是从0开始的正整数。第1个字符的下标为0，第2个字符的下标为1，第3个字符的下标为2，以此类推。



> 语法：**str**Obj.charAt(index)



> 参数：index是指字符的下标。strObj是原字符串。



> 返回值：字符型的数据。如果参数 index 不在 0 与 string.length 之间，该方法将返回一个空字符串。

```javascript
var str = "abcdefg";
str.charAt(0); //a
str.charAt(3); //d
str.charAt(str.length -1); //g
```



**4、indexOf()**

> 描述：在原始字符串，从左往右查找指定的字符串，如果找到，返回其下标值。如果没有找到，返回-1。



> 语法：**str**Obj****.indexOf(****substr**)**



> 参数：substr就是要查找的子字符串。



> 注意：只查找第一次出现的字符，第二个相同的不再查找。

```javascript
//实例:判断给定的邮箱地址是否合法
var str = "1000phone@aliyun.com";
//返回邮箱中是否含有@符号
var index = str.indexOf("@");
//条件判断
if(index == -1){
  document.write("邮箱不合法");
}else{
  document.write("邮箱合法");
}
```

**5、lastIndexOf()**

> 描述：在原始字符串，从右往左查找指定的字符。只查找第一次出现的字符，第二个相同的不再查找。



> 返回值：如果找到返回对应的索引值，如果没有找到，返回-1。



> 语法：**strObj.lastIndexOf(substr)**

```javascript
//判断上传文件是不是图片
var str = "12345.png";
var index = str.lastindexOf(".") //6
```

**6、substr()**

> 描述：从原始字符串，提取指定的子字符串。



> 语法：**strObj.substr(startIndex [ , length])**



> 参数：

```javascript
 startIndex是要查找的子字符串的开始位置(索引号)。

 length可选项。从startIndex处往后提取length个字符。如果length省略，则一直提取到结尾。
```

> 举例：

```javascript
var str = “abcdefgh”;str.substr(0,3);  // “abc”str.substr(0,5);  // “abcde”str.substr(3,3);  // “def”str.substr(5);   // “fgh”
```

**7、substring()**

> 描述：从原始字符串，提取指定的子字符串。



> 语法：**strObj.substring(startIndex [ , endIndex])**



> 参数：

```javascript
startIndex是要查找的子字符串的开始位置(索引号)。

endIndex可选项。从startIndex到endIndex处的所有字符。如果endIndex省略，则一直提取到结尾。

如果开始索引和结束索引都使用，则返回的字符应该包含开始索引处的字符，不包含结束索引处的字符(含前不含后)。
```

> 举例：

```javascript
var str = “abcdefgh”;

str.substring(0,3);  // “abc”

str.substring(0,5);  // “abcde”

str.substring(3,3);  // “”

str.substring(5);   // “fgh”
```

## 课堂实例：判断上传文件是不是图片

```javascript
/实例：判断上传文件是不是图片
/*
	(1)给一个已知文件名
	(2)查找扩展名点的位置
	(3)取出扩展名
	(4)图片扩展名：.jpg、.png、.gif
	(5)比对扩展名
*/
function showInfo()
{
	//图片扩展名的数组
	var arr = ["gif","png","jpg",'bmp'];
	//图片文件名
	var str = "123456.png";
	//获取扩展名点的位置
	var index = str.lastIndexOf(".");
	//取出扩展名(不含点)
	var ext = str.substr(index+1);
	//扩展名与数组中的每个元素进行比较
	for(var i=0;i<arr.length;i++)
	{
		if(ext==arr[i])
		{
			return true;
		}
	}
	return false;
}
//判断上传文件是否是图片
if(showInfo())
{
	document.write("上传图片合法！");
}else
{
	document.write("非法文件！");
}
```

 **8、split()——将字符串转成数组**

> 描述：将一个字符串切成若干段，将一个字符串分割成一个数组。



> 语法：**array strObj.split(separator)**



> 参数：separator是一个字符串的分割符，可以为空字符串。



> 返回值：是一个数组。

```javascript
//实例：输出今天是星期几
var str = "星期日,星期一,星期二,星期三,星期四,星期五,星期六";
//创建一个Date对象
var today = new Date();
//取出星期值(0-6)
var week = today.getDay();
//将字符串转成数组
var arr = str.split(",");
//输出结果
document.write("今天是："+arr[week]);
```

### **[2] Array对象**

一个数组量，就是一个Array对象。

**1、length属性**

> 描述：动态获取数组的长度，也就是元素的总个数。



> 语法：var len = arrObj.length

**2、join()**

> 描述：将一个数组各元素，用指定的连接号，连成一个字符串。



> 语法：string arrObj.join(separator)



> 参数：separator代表元素之间的连接号。

```javascript
var arr = ["千","锋","教","育"];
var str = arr.join("");
window.alert("类型为："+typeof(str)+"\n长度为："+str.length+"\n内容为："+str);
```

**3、添加和删除数组元素**

> delete删除元素的值，而下标还在(长度不会减少)。

> push从后面插入新的元素。

> shift()删除第1个数组元素，数组长度减1。并返回删除元素的值。

> pop()删除最后1个数组元素，数组长度减1。并返回删除元素的值。

```javascript
//实例：删除数组的元素
var arr = ["千","锋","教","育"];
document.write("长度为："+arr.length+", 值为："+arr+"<hr>");
//删除第1个元素和最后1个元素
//应该直接在原数组上操作
arr.shift();
arr.pop();
document.write("长度为："+arr.length+", 值为："+arr+"<hr>");
```

> unshift()在数组的开头添加一个或多个元素，数组长度会变化。



> push()在数组的结尾添加一个或多个元素，数组长度会变化。

## 课堂实例:**对数组元素进行倒序排列**

```javascript
//实例：对数组元素进行倒序排列
/*
	使用pop()方法来实现
	将最后删除的数组元素的值，作为新数组的元素的值
*/
var arr1 = [1,2,3,4,5,6,7,8];
var len = arr1.length;
var arr2 = new Array();
//循环删除
for(var i=0;i<len;i++)
{
	/*	第0次 i < 8
		第1次 i < 8
		第2次 i < 8
		第3次 i < 8
		第4次 i < 8
	*/	
	arr2[i] = arr1.pop();
}
document.write(arr2);
```

**4、reverse()**

> 描述：对数组中各元素进行反转顺序。



> 语法：arrObj.reverse()

```javascript
//（字符，偏难）利用var s1 = prompt("请输入一个英文单词","")可以获取用户输入的字符(输入一个单词)，试编程将用户输入的字符“反转顺序”并首尾字母转为大写，其他字母转为小写后alert出来。
//BEIJING  —— GnijieB
/*
	(1)获取用户输入的单词
	(2)将字符串转成全小写
	(3)将字符串转成数组
	(4)将数组首尾字母变大写
	(5)将数组元素反转
	(6)将数组转成字符串
*/
//（1）获取用户输入的单词 Bejing
var str = window.prompt("请输入一个单词");
//（2）转成全小写：beijing
str = str.toLowerCase();
//（3）将字符串转成数组：["b","e","i"]
var arr = str.split("");
//（4）将数组首尾字母变大写：["B","e","i"]
arr[0] = arr[0].toUpperCase();
arr[arr.length-1] = arr[arr.length-1].toUpperCase();
//（5）将数组元素反转
arr.reverse();
//（6）将数组转成字符串
str = arr.join(""); 
//输出结果
window.alert(str);
```



### [1] Date对象

**1、创建Date对象(实例、副本)的方法**

**（1）创建当前Date对象的副本**

```javascript
//创建当前Date对象副本
var today = new Date();
document.write(today);
```

**（2）创建指定时间戳的Date对象**

时间戳：就是指距离(格林威治)1970年1月1日0时0分0秒，过去了多少毫秒。1秒 = 1000毫秒

```javascript
//根据指定的时间戳的Date对象
//Date()的参数是一个毫秒值,而我们python的时间戳是秒值
var date2 = new Date("1990-10-12 10:09:34").getTime();
document.write(date2);
```

**（3）根据指定时间字符串的参数，来创建Date对象**

```javascript
//根据指定的时间字符串，来创建Date对象
//日期之间的分割号是(/)。日期和时间之间用空格隔开
var date2 = new Date("1990/10/12 10:09:34");
document.write(date2);
```

**（4）根据指定的年、月、日、时、分、秒的数值，来创建Date对象**

```javascript
var date2 = new Date(1990+100,10,12);
document.write(date2);
```

## 课堂实例：计算张三已经活了多少天了

```javascript
/实例：计算张三已经活了多少天了？
/*
	(1)出生日基距离1970年过去了多少毫秒
	(2)现在距离1970年过去了多少毫秒
*/
//（1）创建现在和过去的日期对象
var date1 = new Date();
var date2 = new Date("1990/01/01");
//（2）取出两个日期对应的毫秒值
var timer1 = date1.getTime();
var timer2 = date2.getTime();
//（3）计算天数
var num = (timer1-timer2)/1000/3600/24;
num = Math.ceil(num); //向上取整
//（4）输出结果
document.write("张三活了"+num+"天了！");
```

## 课堂实例：计算张三再活多少天能活到100岁

```javascript
//实例：张三再活多少天能活到100岁
var date1 = new Date();
var date2 = new Date(1990+100,10,12);
var timer1 = date1.getTime();
var timer2 = date2.getTime();
var num = (timer2-timer1)/1000/3600/24;
num = Math.ceil(num);
document.write("再活"+num+"天能活到100岁");
```

**2、Date对象的方法**

> getFullYear()：获得四位年份。如：2015



> getMonth()：月份，取值0-11。



> getDate()：天数。



> getHours()：小时数。



> getMinutes()：分钟数



> getSeconds()：秒数



> getMilliseconds()：毫秒数



> getDay()：星期值，0-6



> getTime()：总的毫秒值

## 课堂实例：输出今天的日期和时间

```css
<style type="text/css">
.box{
	width:400px;
	padding:20px;
	border:1px solid red;
	background-color:yellow;
	text-align:center;
	font-size:24px;
	font-family:微软雅黑;
	color:red;
	line-height:180%;
}
</style>
```



```javascript
<script type="text/javascript">
//实例：输出现在的日期时间信息
//（1）创建当前的Date对象
var today = new Date();
var arr = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"];
//（2）取出相关的信息
var year	= today.getFullYear();
var month	= today.getMonth()+1;
var date	= today.getDate();
var hours	= today.getHours();
var minutes = today.getMinutes();
var seconds = today.getSeconds();
var milliSec= today.getMilliseconds();
var week	= today.getDay();
var timer	= today.getTime();
//（3）如果不够两位，前面补0
month	= month < 10	? "0"+month : month;
date	= date	< 10	? "0"+date	: date;
hours	= hours	< 10	? "0"+hours	: hours;
minutes	= minutes<10	? "0"+minutes : minutes;
seconds = seconds<10	? "0"+seconds : seconds;
//（3）构建输出结果
var str = "<div class='box'>";
str += year+"年"+month+"月"+date+"日<br>";
str += hours+":"+minutes+":"+seconds+" "+milliSec+"ms<br>"
str += "总毫秒："+timer+"ms<br>"
str += arr[week];
str += "</div>";
//（4）输出结果
document.write(str);
</script>
```



### **Math数学对象**

> Math.PI：圆周率



> Math.abs()绝对值。如：Math.abs(-9) = 9



> ceil()向上取整(整数加1，舍去小数)。如：Math.ceil(9.23) = 10 、Math.ceil(9.98) = 10



> floor()向下取整(舍去小数)。如：Math.floor(9.87) = 9



> round()四舍五入。如：Math.round(9.8)=10  Math.round(9.4) = 9



> pow()幂次数。如：Math.pow(2,4) = 16



> sqrt()开方。如：Math.sqrt(9) = 3 



> random()返回0-1之间的随机小数。Math.random() = 0.9026920931341323



> toFixed(2) 属于数值对象，保留小数点后面的几位数

```javascript
document.write(Math.random()); //产生随机数
```



### 随机数的公式

| 原始值           | Math.random()               | 0.0  | 0.1  | 0.2  | 0.3  | 0.4  | 0.5  | ……   | 0.9  |
| ------------- | --------------------------- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| min=0,max=10  | 乘以10，再加0                    | 0    | 1    | 2    | 3    | 4    | 5    | ……   | 9    |
| min=10,max=20 | 乘以10，再加10                   | 10   | 11   | 12   | 13   | 14   | 15   | ……   | 19   |
| min=20,max=30 | 乘以10，再加20                   | 20   | 21   | 22   | 23   | 24   | 25   | ……   | 29   |
| 随机整数公式        | Math.random()*(max-min)+min |      |      |      |      |      |      |      |      |

#### 课堂实例：求0-10之间随机整数、求10-20之间随机整数、求20-30之间随机整数

```javascript
//课堂实例：求0-10之间随机整数、求10-20之间随机整数、求20-30之间随机整数
function getRandom(min,max)
{
	//定义随机数变量
	var random = Math.random()*(max-min)+min;
	//向下舍入(去掉小数部分)
	random = Math.floor(random);
	//输出结果
	document.write(random+"<br>");
}
//调用函数
getRandom(0,10);
getRandom(10,20);
getRandom(20,30);
```

#### 课堂实例：随机网页背景色

```javascript
//实例：随机显示网页背景色
/*
	(1)随机背景颜色值(6位)。最大值：999999，最小值：100000
	(2)将背景色值赋给<body>元素
	(3)自动刷新功能
*/
//当网页加载完成时，去调用一个匿名函数
//也就是指：<body>及<body>子标记全部出现以后
//onload事件才会发生。
window.onload = function()
{
	var min = 100000;
	var max = 999999;
	//求随机整数
	var random = Math.random()*(max-min)+min;
	//向下取整
	random = Math.floor(random);
	//将背景颜色值，赋给body元素的bgColor属性
	document.body.bgColor = "#"+random;
}
```























