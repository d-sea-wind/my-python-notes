# JavaScript_2

### [1] 变量的数据类型

变量是没有类型，只有变量的值才有类型。

#### JS中变量的数据类型分类：

##### 基本数据类型(只有一个值)：字符型、数值型、布尔型、未定义型、空型

> 字符型：var str = “abc”;



> 数值型：var num = 100;

##### 复合数据类型(有多个值)：数组、对象、函数

> 数组：var arr = [10,20,30,40,50];



### 1、数值型

数值型包括：整型、浮点型、NaN。

```
var a = 100;
var a = -100;
var a = 0.98;
var a = -0.98;
var a = 0;
```

**数值型有一个特殊的类型NaN**

NaN`(Not a Number)`：它不是一个数值。NaN更加的精确的话是一个浮点型.

当其它数据类型转成数值型，转不过去，此时将返回NaN的值。

```
//将宽度变为原来的2倍
var width = "100px";
width = width * 2
document.write("现在的像素为" + width)
```

NaN和谁都不相等，和它自己也不相等。

```
//判断NaN和NaN是否相等
var a = "abc";
a = a * 2;
if(a == NaN){
  document.write("相等")
}else{
  document.write("不相等")
}
```

#### 2、字符型

##### （1）用单引号或双引号，引起来的一串字符，称为“字符型”数据。

```
//字符型数据表示
//同名变量将被覆盖,下面变量将覆盖上面的同名变量
//在JS中,字符串不能分多行写.

var str = "abc";
var str = "<h2>Python基础班</h2>";
document.write(str);
```



##### （2）一个字符串中，只要里外引号不一样，就可以直接使用

也就是说：字符串外面是双引号，里面可以嵌套单引号。外面是单引号，里面可以嵌套双引号。

```
//引号的嵌套
var str = "<font color='red'>上海py1905";
str += "</font>";
document.write(str);
```



##### （3）如果要在双引号使用双引号，或者单引号内使用单引号

```
	如果直接使用的话，会报“语法出错”的。

那么，如何使用呢？

也就是，将里面的双引号单引号，进行转义()。如：\”、\’、\n、\r

\” ：将“\”之后的字符，当成“普通字符”来看待。如：将 \”  当成普通字符 a 看待，不会看成“引号”。

\’  ：看成普通的字符。

\n  ：换行符，只能在弹框中看到效果。

\r  ：回车符
```

```
//在双引号内使用双引号,只能使用转义符(\)来实现
var str = "<h2 style=\"background-color:yellow;\">双引如何使用<h2/>";
document.write(str);
//\n换行符,只能在弹框中使用
window.alert("HTML\nCSS\nJavaScript");
```

### 3、布尔型

布尔型只有两种状态：true、false

布尔型只有两种状态：真假、是否。

```
//布尔值的表示
var a = true;
var b = false;
```

布尔值常用在条件判断中

```
//实例:判断一个人的婚否状态
var name = "李四五";
var isMarried = false;
if(isMarried){
  //如果条件为true,执行的代码
  document.write("<font color='red'>" + name + "的婚否状态为:已婚");
}else{
   //如果条件为false,执行的代码
  document.write("<font color='blue'>" + name + "的婚否状态为:未婚");
}
```

### 4、未定义型

当一个变量定义了，但未赋值，此时，该变量的类型是**未定义型**。

未定义型，只有一个值，就是undefined。

```
//变量声明
var a;//未复制,其值为undefined
document.write(a);
```

### 5、空型

当一个对象不存在，则为空型。空型只有一个值就是null。

null代表一个空对象，或者是对象的一个占位符。

---

# [2] 判断变量的数据类型：typeof()

##### typeof一元运算符，不是函数

```
描述：一元运算符typeof，是判断变量的数据类型的。

语法：typeof name  或  typeof(name)

返回值：它返回六种字符串型的数据类型。包括： “string”、“number”、“boolean”、“object”、“function”、“undefined”,'null','array'

```

```
//测试变量的数据类型
var a = 100;
var a = "abc";
var a = true;
var a = undefined;
var a = null;
//输出变量的类型和值
document.write("变量的类型为:"+typeof(a)+", 变量的值为:"+a);
```

---

### [3] 变量的数据类型转换

##### 描述：变量之间的运算，必须是同类型的；如果类型不同，要转成同类型，才能进行运算。

*变量类型之间的转换都是****自动转换****；但是有时候也需要****手动转换****，手动转换主要用来测试结果。

##### 1、其它类型转成布尔型

```javascript
//实例:其它类型转成布尔型
var a = 100;       //true
var a = 0;         //false
var a = 0.98;      //true
var a = NaN;       //false
var a = "abc";     //true
var a = "";        //false
var a = undefined; //false
var a = null;      //false
//使用系统函数Boolean()强制转换布尔值
var result = Boolean(a);
//输出转换后变量的类型和值
document.write("变量的类型:"+typeof(result)+"变量的值为:"+result);
```

##### 2、其它类型转成字符型

```javascript
//其它类型转成字符型
var a = 100;    // "100"
var a = 0;       // "0"
var a = NaN;     // "NaN"
var a = true;    // "true"
var a = false;   //  "false"
var a = undefined // "undefined"
var a = null;    //  "null"
//使用系统函数String()强制转换成字符型
var result = String(a);
//输出转换后变量的类型和值
document.write("变量的类型:"+typeof(result)+"变量的值为:"+result);
```

##### 3、其它类型转成数值型

```
//其它类型转成数值型
var a = 100;    // 100
var a = "100px"; // NaN
var a = "abc"    // NaN
var a = ""       // 0
var a = true;    // 1
var a = false;   // 0
var a = undefined // NaN
var a = null;    // 0
//使用系统函数Number()强制抓换数值型
var result = Number(a);
document.write("变量的类型:"+typeof(result)+"变量的值为:"+result);
```

---

# [4] 从字符串中提取整数或浮点数函数

### 1、系统函数 parseInt()

> 描述：在一个字符串，**从左往右**提取整型；如果遇到非整型的内容，则停止提取，并返回其值。



> 注意：如果第一个字符不是整型的话，则直接返回NaN。

```
//从字符串中提取整形
var a = "120px"; //120
var a = 120.98;  //120
var a = "a120";  //NaN
var a = 0.98;    //0
//使用系统函数parseInt()提取整型
var result = parseInt(a);
//输出结果
document.write("变量的类型:"+typeof(result)+"变量的值为:"+result);
document.write("<hr />")
//实例:将一个<div>的宽度变为原来的2倍
var width = "100px";
width = parseInt(width) * 2 + "px";
document.write("div的宽度为" + width);
```

### 2、系统函数 parseFloat()

>描述：在一个字符串中，从左往右提取浮点数；如果遇到非浮点数的字符，则停止提取，并返回提取的值。



>如果第一个字符是非浮点数字符，则直接返回NaN。

```
//从字符串中提取浮点数
var a = "100.98px";  //100.98
var a = ".98px";     //0.98
var a = "98px";      //98
var a = -98.09;      //-98.09
var a = .23;         //0.23
var a = 10 / 3;      //3.3333333
//使用系统函数parseFloat()提取浮点数
var result = parseFloat(a);
document.write("变量的类型:"+typeof(result)+"变量的值为:"+result);
```

---

## [5] JS运算符

##### 1、算术运算符：+、-、\*、/、%、++、--

“%”取余运算符。两个数相除取余数。可以判断两个数是否能除尽。如果余数为0，则表示能除尽。

```
//取余运算符(%)
//判断两个数能否除尽
//如果余数为0,则能除尽

var a = 10 % 2;  //a = 0
var a = 10 % 3;  //a = 1
var a = 20 % 7;  //a = 6
document.write(a);
```

##### “++”自加1。有两种用法：作前缀(++a)、作后缀(a++)。

（1）如果 ++a 和 a++ 单独使用，结果一样。

```
//(一)单独使用时,++a和a++结果一样
//(1)a++应用
var a = 10;
a++; //a = a + 1;
document.write(a + "<hr />");
//*********************************************
//(2)++a的应用
var a = 10;
++a; //a = a + 1;
document.write(a + "<hr />");
```

（2）如果 ++a 和 a++ 混在其它表达式当中，结果就不一样了。

```
//(二)将a++和++混在其它的表达式中,结果不一样
//(1)a++应用
var a = 10;
var b = a++; //先将a的值赋给变量b,然后a+1
			 //谁在前,先执行谁
			 //a在前,就先赋值,后加1
document.write("a="+a+",b="+b);
document.write("<br />");
//(2)++a应用
var a = 10;
var b = ++a; //现将a的值加1,在赋值给变量b
			 //谁在前,先执行谁
			 //++在前,就先加1,后赋值
document.write("a="+a+",b="+b);
document.write("<br />");

//以下也是一种应用
var c = 100;
window.alert(c++); //100
window.alert(a);   //101 
```

##### “--”自减1。有两种用法：作前缀(--a)、作后缀(a--)。

（1） 如果 --a 和 a-- 单独使用，结果一样。

（2） 如果 --a 和 a-- 混在其它表达式当中，结果就不一样了。

（3） 测试案例，参考“++”的案例。

---

##### 2、赋值运算符：=、+=、-=、\*=、/=、%=

```
“+＝”先加后等。如：a += 2 //展开后 a = a + 2

“-=”先减后等。如： a -= 2 //展开后 a = a – 2

“*=”先乘后等。如： a *= 2 //展开后 a = a * 2

……
```

---

##### 3、字符串运算符：+、+=

```
“+”用于连接左右两个字符串(或变量)。如： “abc” + 10 = “abc10”

“+=”用于连接上下两行的字符串或变量。

```

```
//"+="使上下两行字符串连在一起
var a = 100;
a += "abc"; //a = a + "abc" = "100" + "abc" = "100abc";
```

##### 4、比较运算符：>、>=、<、<=、==、!=、===、!==

比较运算符的运算结果是一个布尔值true、false。

```
10 > 20 //false
10 >= 20 //false
10 < 20 //true
10 <= 20 //true

'=' 赋值号
"==" 是比较号(松散).比较左右两个操作数的值是否一致。如果值一样，则结果为true，否则结果为false。
"==="全等于(严格)。比较左右两个操作数的值和类型是否都一致。如果都一致返回true，否则结果为false。
```

## 课堂实例：判断10和“10”是值相等，还是类型也一样

```
//课堂实例:判断10和"10"是值相等,还是类型也一样
var a = 10;
var b = "10";
if(a=b){
  document.write("a和b的值一样!");
  //比较类型是否一致
  if(a===b){
  	//如果类型一样,则执行
    document.write("a和b的类型一样!");
  }else{
  	//如果类型一样,则执行
  	document.write("a和b的类型不一样!");
  }
}else{
   document.write("a和b的值不一样!");
}
```



##### 5、逻辑运算符：&&、||、!

```
逻辑运处算符的运算结果，一定是一个布尔值。

逻辑运算符又称为“多条件比较”。

“&&”逻辑与(并且)。如果左右两个条件同时为true，则结果为true。反之，结果为false。

“||”逻辑或(或者)。如果左右有一个条件为true，则总结果为true。反之，结果为false。

“!”逻辑非(取反)。!true = false，!false = true。!100 = false，!null=true
```

## 课堂实例：当兵年龄的判断

```
var name = "张三";
var age = 98;
//条件判断
if(age>18 && age<=23){
  //条件为true,执行的代码
  document.write(name + "可以当兵啦!");
}else{
  //条件为false,执行的代码
  document.write(name + "该干嘛去干吗!");
}
```

## 课堂实例：根据用户输入的年份,来判断是否是闰年

```
//获取用户输入的年份
var year = window.prompt("请输入一个合法的年份");
//闰年判断
/*
	(1)能被4整除,且不能被100整除
	(2)能被400整除
	(3)条件(1)和(2)的关系是或关系
*/
if(year%4==0 && year%100!=0 || year%400==0){
  //如果条件为true,则执行代码
  document.write(year + "是闰年")
}else{
  //如果条件为false,则执行代码
  document.write(year + "是平年")
}
```



6、三元运算符

```
一元运算符：只有一个操作数。typeof name

二元运算符：有两个操作数。10 + 20

三元运算符：有三个操作数或表达式。
```

```
语法格式：条件判断 ? 结果1 : 结果2

语法格式：表达式1 ? 表达式2 : 表达式3

说明：如果条件为true，则执行“结果1”的代码；如果条件为false，则执行“结果2”代码。
```

```
//(1)使用if实现
var a = 10;
var b = 20;
var max;
if(a>b){
  max = a;
}else{
  max = b;
}
document.write("最大值为:" +max);

//(2)使用三元实现
var a = 100;
var b = 20;
var max = a > b ? a : b;
document.write("最大值为:" + max);
```

## 课堂实例：输出个人信息(含有婚否和毕业院校)

```
//(1)声明
var name = "张三";
var sex  = "男";
var age  = 22;
var isMarried = true;
var edu  = "本科";
var school = "哈工大";

//(2)构建输出的结果
var str = "";
str += "<h2 style=\"color:red;\">" + name + "的基本信息如下</h2>";
str += "姓名:" + name;
str += "<br />性别:" + sex;
str += "<br />年龄:" + age;
str += "<br />婚否:" + (isMarried ? "已婚" : "未婚");
str += "<br />学历:" + edu;
str += "<br />毕业院校:" + (school ? school : "未填写");
//(3)输出结果
document.write(str);
```





### [7] if条件判断

### 1、只判断true的情况

```
if(条件判断:判断的结果只有两个值true . false){
  	条件为true时执行;
}
```

```
//判断一个人是否成年
var name = "张三";
var age  = 24;
if(age>=18){
  //如果条件true,则执行
  document.write(name + "已成年了!");
}
```



### 2、既判断true，也判断false

```
if(条件判断:判断的结果只有两个值true . false){
  	条件为true时执行;
}else{
  条件为false,执行的代码
}
```

```
 //判断一个人是否成年
var name = "张三";
var age  = 24;
if(age>=18){
  //如果条件true,则执行
  document.write(name + "已成年了!");
}else{
  //如果条件为false,则执行
  document.write(name + "未成年!");
}
```



### window.prompt()

> 描述：用于显示可提示用户进行输入的对话框



> 语法：**window.prompt(text,defaultText)**



> 参数：

```
text可选。表示输入框的提示信息。

defaultText可选。表示输入框中的默认数据。
```

>返回值

```
单击“确定”返回一个字符串的数据。

单击“取消”返回null。
```

> 举例：var year = window.prompt("请输入一个年份")

 



































