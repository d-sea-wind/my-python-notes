# Javascript_3

## [1] 特殊运算符

## 1.new运算符

> 描述：创建一个对象的实例。



> 举例：创建一个Date对象的实例。



> Date对象是操作的东西。使用JS操作日期时间，就是创建一个Date副本。而不能直接对系统时间操作。



> 举例：var today = new Date();



> Date()是系统函数，代表日期时间对象。



> Today是日期对象的实例的名称。today变量类型是对象。

```
//创建一个Date对象的实例
var today = new Date();
document.write("类型是:"+typeof(today)+",值为"+today);
```

### 2.delete运算符

> 描述：删除对象的属性或数组中的元素。



> 举例：delete arr[0]  // 删除数组中索引为0的元素

### 3.typeof运算符

> 描述：判断一个变量的数据类型。



> 返回值：是一个字符串。六种字符串： “string” “number” “boolean” “undefined” “object” “function”



> “object”包括：null、array、object



> 语法：typeof name 或 typeof(name)

### 4.小数点(.)

> 描述：主要用来调用对象的属性或方法。



> 举例：window.prompt()、window.alert()、document.write()

### 5.小括号() 或 [ ] 运算符

> ()运算符：主要用优先级方面。也是方法参数的小括号，函数参数小括号。



> []运算符：主要用于存取数组中的元素。

```
 var arr = [10,20,30,40]

 arr[2] = 30  //读取数组arr中下标为2元素的值。

 arr[0] = 10  //读取数组arr中下标为0元素的值。
```



## [2] 运算符优先级

 ![image_1](images_js_1/image_4.png)

### if条件判断语句

### 1、只判断true

```
if(条件判断:结果是一个布尔值true false){
  条件为true,执行代码
}
var max;
if(max = (20 > 10 ? 0 :1) || (20 > 10 ? "abc" : "")){
  //条件为true,执行代码
  document.write("条件成立");
}
```



### 2.既判断true，也判断false

```
if(条件判断:结果是一个布尔值true或false){
  条件为true,执行的代码
}else{
  条件为false,执行的代码
}
```

```
if(条件一){
  代码一
}else if(条件二){
  代码二
}else if(条件三){
  代码三
}else{
  如过上面条件都不满足,则执行默认的代码
}
```

## 课堂实例:根据用户输入的不同分数给其下评语

```
//总分为100
//90以上优秀
//80-90之间为良好
//70-80为中等
//60及格

//(1)先写一个输入框
		var a = Number(window.prompt('请输入成绩'));
		console.log(a);
		//判断a的成绩范围
		if(String(a) === "NaN"){
			alert("请输入正确的成绩!");
		}else if(a > 100 || a < 0){
			alert("请输入正确的成绩!");
		}else if(a >= 90){
			alert("NB");
		}else if(a >= 80){
			alert("666");
		}else if(a >= 70){
			alert("还不错");
		}else if(a >= 60){
			alert("运气不错")
		}else{
			alert("退学吧!");
		}
```



### switch分支语句

```
switch(条件判断,是一个变量的不同取值){
  case 值1:
  	  代码1;
  	  break;
   case 值2:
  	  代码2;
  	  break;
   case 值3:
  	  代码2;
  	  break;
  	default:
  		如果以上条件都不满足,则默认执行的代码
}
```

```
switch语法说明：
  switch、case、break、default都是系统关键字。
  原理：如果switch中变量的取值，与每个case进行比对，如果匹配，则执行对应case中的代码。
  所有case都是并列关系，每时每刻只有一个case语句会运行。
  Break语句：用于中止代码继续向下运行。
  Default语句：如果以上条件都不满足，则执行的代码。
```

 ```
var a = window.prompt('输入一个字母')
		
		switch(a){
			case 'a':
				alert('a');
				break;
			case 'b':
				alert('b');
				break;
			case 'c':
				alert('c');
				break;
			default:
				alert('d')
		}
 ```



![image_2](images_js_1/image_2.png)

```
switch和if多条件的区别
  if是多条件判断，if的条件一般是一个范围。如：(a > 10)、 (a>10 && a <20 || a =30)
  switch的条件，一般来说，是一个变量，该变量会有不同的值。它不能用于一个范围。
  switch和if都是多选一。每时每刻只会有一个条件满足，有一个代码被执行。
```

## 课堂实例:输出中文的"今天是星期几"

```
1*
	1)创建一个Date对象的副本
	2)取出日期对象中的星期值
	3)星期值与switch中的每个case作个比较
*/
//创建一个Date对象的实例
var str;
var today = new Date();
//取出date对象的星期值(0-6),0代表星期日
var week = today.getDay();
//使用switch输出不同的结果
//条件只能是一个变量的不同取值
switch(week){
	case 1:
		str = "一";
		break;
	case 2:
		str = "二";
		break;
	case 3:
		str = "三";
		break;
	case 4:
		str = "四";
		break;
	case 5:
		str = "五";
		break;
	case 6:
		str = "六";
		break;
	default:
		str = "日";
}
document.write("今天是<font color='blue'>星期"+str+"</font>");
```



### while循环——重复执行

##### 1、while循环的语法结构

```
while(条件判断){
  	如果条件true,重复执行的代码
  	循环体代码,一般完成某项功能
}
```

##### 2、循环三要素

> 变量初始化。在循环开始前要进行变量初始化，只执行一次。



> 条件判断。如果条件为true，则执行循环体代码；如果条件为false，则退出循环(转到结束大括号之后)。



> 变量更新。变量更新，可以距离结束的条件越来越近。可以避免出现“死循环”。是放在循环体中的。



## 课堂实例:输出1-100之间所有的数

```
//(1)定义一个变量
var a = 1;
//(2)定义循环体和条件

while(a<=100){
document.write(a+"<br />")
//(2)变量的更新
a += 1;
}

作者:鸡哥    日期:2018/3/22.
```

## 课堂实例:输出1-100之间所有的偶数

```
//(1)定义一个变量
var a = 1;
//(2)定义循环体和条件

while(a<=100){
if(a % 2 == 0){
document.write(a+"<br />")
}
//(2)变量的更新
a += 1;
}

作者:黄咸鱼    日期:2018/3/22.
```



### for循环

```
for(变量初始值;条件判断;变量更新){
  	循环体的代码
}
```

 ![image_3](images_js_1/image_3.png)

```
//输出1-100之间能被7整除的数
for(var i=1;i<=100;++i){
    //如果能被7整除,则输出
    if(i % 7 == 0){
  		document.write(i + " ");
    }
}
```



### break语句--中断

break语句，用于无条件中断各种循环(while、for、for in)或switch语句。

一般情况下，需要在break语句之前加一个条件判断。如果条件为true，则退出循环。

break语句只能退出一层循环，不能直接跳出2层或多层循环。

```
//实例:输出1-100之间所有的数,但大于50不在输出
for(i > 50){
	//如果大于50,则退出循环
	if(i>50){
    	break; //中断循环,并跳到结束大括号之后
    }
}
```

### continue语句——继续

continue语句，用于结束本次循环，而开始下一次新的循环。也就是：本次循环的剩余代码不再执行。

一般情况下，需要加一个条件判断。

continue只能退出一层循环，也不能退出多层循环。

```
//实例:输出1-100间所有的偶数,使用continue实现
var i = 0; //变量初始化
while(i < 100){
  	i++; //变量更新
  	//如果是奇数,则继续
  	if(i%2!=0){
  		continue;//结束本次循环,剩余代码不执行
  				 //直接开始下一次新的循环
  				 //直接跳转到条件判断
	}
	document.write(i + " "); //2 4 ... ...100
}
```

### 课堂实例:九九乘法表

```
//(1)实现1行1列的表格
var str = " ";
str += "<table width='600' rules='all' align='center' border='1'>";
str += "    <tr>";
str += "		<td>&nbsp;</td>";
str += "	</tr>";
str += "</table>";

document.write(str);
```

```
//(2)实现9行1列的表格
var str = "";
str += "<table width='600px' rules='all' align='center' border='1'>";
//循环表格行
for(var i=1;i<=9;i++){
 	 str += "<tr>";
	 str += "   <td>&nbsp;</td>";
	 str += "</tr>";
}
str += "</table>";

document.write(str);
```

```
//(3)实现9行9列的表格
var str = "";
str += "<table width='600px' rules='all' align='center' border='1'>";
//循环表格行
for(var i=1;i<=9;i++){
  	str += "<tr>";
  	//循环表格列
  	for(var j=1;j<=9;j++){
  		str += "<td>&nbsp;</td>";
	}
	str += "</tr>";
}

str += "</table>";

document.write(str);
```

```javascript
//(4)实现梯形表格
var str = "";
str += "<table width='600px' rules='all' align='center' border='1'>";
for(var i=1;i<=9;i++){
  	str += "<tr>";
  	//循环表格列
  	for(var j=1;j<=i;j++){
  		/*                            \
  		第一行(i=1) 单元格循环1次(j<=1)  \
  		第二行(i=2) 单元格循环2次(j<=2)   \   j <= i
  		第三行(i=3) 单元格循3次(j<=3)     /
  		第四行(i=4) 单元格循环4次(j<=4)  /
  		*/                            /
  		str += "<td>&nbsp;</td>";
	}
	str += "</tr>";
}
str += "</table>";

document.write(str);
```

```
//(5)填入数据
var str = "";
str += "<table width='600px' rules='all' align='center' border='1'>";
for(var i=1;i<=9;i++){
  	str += "<tr>";
  	//循环表格列
  	for(var j=1;j<=i;j++){
  		str += "<td>"+j+"&times;"+i+"="+j*i+"</td>";
	}
	str += "</tr>";
}
str += "</table>";

document.write(str);
```



### [3] 数组

1、数组的概念

​	数组，就是一组数(值)的集合。

​	var arr = [10,20,30,40,50]

​	var arr = [“Mary”, “女”, 24 , “大专”, true , null]

2、数组元素

​	数组中的每个值，就称为“数组元素”。

​	数组的下标只能是从0开始的正整数，而数组的值可以是任何类型(字符串、数值、布尔型、未定义型、空型、数组、对象、函数)。

​	数组是复合数据类型。

3、数组索引(下标) 

​	var arr = [10,20,30,40,50]

​	数组的编号(下标)，是**从0开始的正整数**。

​	第1个元素的下标为0，第2个元素的下标为1，第3个元素的下标为2，依次类推。

```
var arr = [10,20,30,40,50];
document.write(arr[4]);
```

4.数组元素的访问

​	访问方法是：数组变量名，后跟一个中括号[]，中括号[]内是元素所在的下标值。

```
//创建一个数组
var arr = [10,20,30,40,50];
//将30的值给成Mary
arr[2] = "Mary";
//输出下标为2的元素的值

document.write(arr[2]);
```

5.数组的长度

​	数组中元素的总个数，就是数组长度。



### 数组的创建方法

1、使用new关键字和Array()来创建数组

```
//(1)使用new关键字,结合Array()构造函数,创建数组
var arr = new Array(); //创建一个空的数组
//添加数组元素
arr[0] = 10;
arr[1] = 20;
arr[2] = 30;
arr[3] = 40;
//输出结果
//使用document.write()输出数组
//将数组个元素用逗号连成一个字符串
//然后输出结果
document.write(arr);
```

2.使用[]来创建

```
//(2)使用[]来创建一个数组
var arr = ["Mary" , 24, true, "大专",undefined];
document.write(arr);
```



### 数组的操作

1、增加元素

​	只要是指定的数组下标不存在，则就是“添加元素”。

2、修改元素

​	只要指定的数组下标存在，就是“修改元素”。

3、删除元素

​	使用delete运算符，来删除数组元素。如：delete arr[2];

​	delete只能删除数组元素的值，而所占空间依然保留，也就是说下标还在，下标就是一个占位符。

​	删除数组元素后，数组的总长度不会改变。

```
//实例:数组操作
//创建一个空的数组
var arr = new Array();
//添加元素:指定下标不存在
arr[0] = "Mary";
arr[1] = "女";
arr[2] = 24;
arr[99] = 99; //数组长度是最大下标加1

document.write(arr + "<hr />");
//修改元素:对已存在的元素进行修改
arr[0] = "nono";
arr[1] = "不男不女";
arr[2] = 240;

document.write("数组长度:"+ arr.length+",数组的值:"+arr+"<hr />");
```





### 数组对象属性length

一个数组，就是一个Array对象。

一个字符串，就是一个String对象。

一个数值，就是一个Number对象。

……

length属性

> 描述：动态获取数组元素的个数。



> 语法：var len = arrObj.length



> 参数：arrObj代表数组变量。一个数组变量，就是一个Array对象。





















































