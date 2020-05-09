# javascript_4

## [1] 函数

### 1.函数的概念

​	将一段公共的代码，起个名字，就叫“函数”。

​	函数的特点：减少代码量、提高工作效率、后期维护十分方面。

```
//上使用函数实现
function getMax(a,b){
  var min;
  if(a>b){
  	min = b; 
  }else{
  	min = a;
  }
  document.write(a+"和"+b+"的最小值是:" + min + "<hr />");
}
getMax(10.20);
getMax(5,8)
```

### 2.函数的定义格式

```
function functionA(形参1,形参2,形参3...){  
  函数的功能;
  [return  返回值]
}
```

##### 函数的语法说明

> function关键字，必须的。



> functionName函数名称，命名与变量一样。



> ()函数的形参(形式参数)。
>
>```
> 多个形参之间用英文下逗号隔开。
>
> 形参可有有无，如果没有形参，小括号不能省略。
>
> 形参不能是具体的值，只能是一个变量。
>
> 形参主要用来接收调用函数者，传递过来的数据。
>```



> {}中存放函数的功能代码。如：求最大值、验证用户名是否含有特殊符号、邮箱格式是否正确等。



> return语句：向调用函数者，返回一个值。

```
 return语句一旦执行，函数剩余的代码不再执行。

 return语句结束函数运行。
```

> **注意：函数只定义是没有任何效果的，函数必须被调用，才能看到效果。**



> 函数只定义是不会执行的。

---

##### 函数的调用

​	函数只定义是不会执行的，函数必须调用才会有效果。

​	函数定义一次，可以多次调用。

​	函数调用方法：函数名，后跟一个小括号()，小括号内是实参。如：**showInfo()**

```
function showInfo(){
  document.write("张三正在打游戏!<br />");
}
//调用函数
showInfo();
```

### 4、函数参数

> 形参(形式参数)：定义函数时的参数，叫形参。主要用来接收调用函数者传递的一个值。



> 实参(实际数据)：调用函数时的参数，叫实参。主要用来向定义函数传值。



> 形参与实参个数必须一样。

```
function showInfo(name,action) //<---这里的是形参
{
  //代码体
}
showInfo("tom","吃饭"); //<---实参
```

### 5、return语句

> return语句，只能用于函数中。



> return语句中止函数执行，也就是 return语句之后的其它代码不再执行。



> return语句，用于向调用函数者返回一个值。

如果不使用return语句返回的话，则函数返回undefined值。

```
//定义函数
function showInfo(name,action){
  var str = name + "在" + action + "!<br />";
  return str;
}
//调用函数
var str2 = showInfo("张三","打游戏");
//输出结果
document.write(str2);
```



### 全局变量和局部变量：用在函数中。

##### 1、全局变量

​	可以在网页的任何地方(函数内和函数外)，都能使用的变量，称为“全局变量”。

​	全局变量，是在网页关闭时，自动消失。

##### 2、局部变量

​	只能在函数内部使用的变量，称为“局部变量”。

​	局部变量不能在函数外部使用。

​	局部变量，是在函数执行完毕，就消失了。

```
var name = "张三";  //全局变量
function showInfo(){
  var action = "打游戏" ;//局部变量
  document.write(name + "正在" + action + "!<br />");
}
//下面输出,因为局部变量会报错
 document.write(name + "正在" + action + "!<br />");
```



### 拷贝传值和引用传址

##### 1、拷贝传值

​	拷贝传值：将一个变量的值，“复制”一份，传给另一个变量。这两个变量没有任何关系。

​	这两个变量是相互独立的，修改其中一个，另一个不会受影响。

##### 	哪些数据类型是“拷贝传值”？基本数据类型都是拷贝传值：字符型、数值型、布尔型、undefined、null。

​	

##### 	基本数据类型在内存中是如何存在？

​	基本数据类型：将变量名和变量值，存在“栈内存”“快速内存”当中。

 ![images](images\images.png)



2、引用传地址

​	引用传地址：将一个变量的“数据地址”，“复制”一份，传给了另一个变量。

​	那么，这样来，两个变量指向了“同一物”“同一空间”。

​	这两个变量之间是有联系的，修改其中一个，另一个也会变。

哪些数据类型是引用传地址？复合数据类型：数组、对象、函数。

​	

复合数据类型在内存中如何存在？

​	复合数据类型的数据存储分两部分。将变量名和变量的数据地址，存在“栈内存”中。将具体的数据存在“堆内存”“慢速内存”当中。

![images](images\image2.png)

```
//引用传地址
var arr1 = [10,20,30];
var arr2 = arr1; //将arr1的地址,复制一份,传给arr2
arr1[0] = 100; //将arr1[0]进行了修改
document.write(arr2[0]);
```

## 课堂实例:在函数内增加一个数组元素

```
//实例:在函数内部来添加一个数组元素
var arr = ['tom','男','24'];
var school = "上海第二工业大学";
//函数定义
function addElement(arr2,school2){
  arr2[arr2.length] = school2;
}
//调用函数
addElement(arr,school);
//输出数组内容
document.write(arr);
```

### 匿名函数

匿名函数，就是没有名字的函数。

```
//定义匿名函数
function() {
  document.write("ok");
}
//怎么调用????
```

### 匿名函数如何使用呢？

匿名函数，一般是用来给其它变量赋值用的。

将匿名函数的定义，作为一个数据，赋给另一个变量。

这样一来，该变量就是函数型了。

```
var a = function(){
  document.write("ok");
}
//调用函数
var b = a; //引用地址:将变量a的地址给b
b(); //调用函数
```



### 二维数组

1、二维数组的定义

​	数组元素的值，可以是任何类型。也可以是数组，那就变成了“二维数组”。

​	二维数组：就是数组套数组。

```javascript
//(1)使用[]来定义二维数组
var arr = [            
  [10,11,12,13],
  [20,21,22],
  [30,31],
  [40]
]
//(2)是i用new关键字,结合Array()构造函数
var arr = new Array(); 
arr[0] = "Mary";
arr[1] = "女";
//JS中,必须先创建一个空的🔢,然后再添加元素
//数组在python中说它想list不如说更加的像dict,也需要先定义,然后可以自由的添加元素
```



二维数组的访问

​	一维数组，数组变量名，后跟一个中括号[]，[]中是元素所在的下标值。如：arr[9]

​	二维数组，数组变量名，后跟两个连续的[]，[]中是元素所在的下标值。如：arr[2][2]

​	三维数组，数组变量名，后跟三个连续的[]，[]中是元素所在的下标值。如：arr[2][2][2]



```
//实例:二维数组的访问(矩阵)
var arr = [
  [10,11,12,13],
  [20,21,22,23],
  [30,31,32,33],
  [40,41,42,43],
]
//添加元素
arr[0][4] = 14;
arr[1][4] = 24;
//修改元素
arr[0][0] = 100;
arr[1][0] = 200;
//删除数组的元素
delete arr[0][4];
delete arr[1][4];
document.write(arr + "<hr />");
```

##### 3、对二维数组进行求平均值

```
//实例：二维数组求平均值
//length只能一层一层的统计个数，
//它不能一起统计所有层数组的个数
var arr = [
			  [10,11,12,13,14],
			  [20,21,22,23],
			  [30,31,32],
			  [40,41],
			  [50]
		  ];
var sum = 0;
var len = 0;
//循环数组的行(一维数组)
for(var i=0;i<arr.length;i++)
{
	//循环数组的列(二维数组)
	for(var j=0;j<arr[i].length;j++)
	{
		sum += arr[i][j];
		len++;
	}
}
document.write("二维数组平均值："+(sum/len).toFixed(2));
```



### 对象

##### 1、对象的概念

​	对象是由属性和方法构成的。

​	学习对象，就是学习对象的属性和方法。

##### 2、JS中对象分类

> String对象：一个字符就是一个String对象。如：var str = “12345678”;  var len = str.length;



> Number对象：一个数值数据就是一个Number对象。如：var a = 100.9888;  a.toFixed(2)



> Boolean对象：一个布尔值就是一个Boolean对象。



> Math对象：数学对象。如：Math.PI、Math.abs()、Math.random()



> Function对象：一个函数就是一个function对象。



> Array对象：一个数组变量，就是一个Array对象。如：var len = arr.length



> BOM对象：window、location、history、screen、document



> DOM对象：a对象、p对象、html对象等。CSS对象。



### 自定义对象的创建方法

##### 1、使用new关键字，结合Object()

```
//（1）使用new关键字，结合Object()构造函数，创建一个自定义对象
//创建一个空的对象
var obj = new Object();
//添加属性
obj.name = "周润发";
obj.sex  = "男";
obj.age  = 24;
obj.isMarried = true;
obj.edu  = "小学";
obj.school;
//添加方法：方法就是函数
//将一个函数定义赋给了对象属性，因此该属性变成了方法。
obj.showInfo = function()
{
	var str = "";
	str += "<h2>"+obj.name+"的基本信息如下</h2>";
	str += "姓名："+obj.name;
	str += "<br>性别："+obj.sex;
	str += "<br>年龄："+obj.age;
	str += "<br>婚否："+(obj.isMarried ? "已婚" : "未婚");
	str += "<br>学历："+obj.edu;
	str += "<br>毕业院校："+(obj.school ? obj.school : "未填写");
	document.write(str);
};
//重新赋值
obj.name = "吴亦凡";
obj.school = "装B大学";
//调用方法
obj.showInfo();
```

##### 2、使用{ }来创建一个对象

```
//（2）使用{}创建一个对象
var obj = {
			   name		: "周更生",
			   sex		: "男",
			   age		: 24,
			   isMarried: true,
			   edu		: "大专",
			   showInfo : function(){
					//this是系统关键字，代表当前对象
					//this应用于对象内部。
					var str = "<h2>"+this.name+"的基本信息如下</h2>";
					str += "姓名："+this.name;
					str += "<br>性别："+this.sex;
					str += "<br>年龄："+this.age;
					str += "<br>婚否："+(this.isMarried ? "已婚" : "未婚");
					str += "<br>学历："+this.edu;
					str += "<br>毕业院校："+(this.school ? this.school : "未填写");
					document.write(str);
			   },
			   school	: ""

		  };
//对象赋值
obj.name = "马化腾";
obj.isMarried = false;
obj.school = "互联网抄袭大学";
//调用对象方法
obj.showInfo();
```





































