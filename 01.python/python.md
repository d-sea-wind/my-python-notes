# 1. python基础

## 1.python编程环境搭建

+ 官网

  ```python
  https://www.python.org/downloads/
  ```

+ 安装教程

  ```python
  http://c.biancheng.net/view/4161.html	# python中文学习教程
  ```

+ pip

  > [豆瓣源](https://pypi.douban.com/simple/)

  ```python
  # 1.查看项目用了哪些包
  pip freeze 
  pip list
  # 2.将项目用到的包输出到requirements.txt中
  pip freeze > requirements.txt
  # 3.安装requirements.txt中的包
  pip install -r requirements.txt
  # 4. 升级pip
  python -m pip install --upgrade pip
  ```

+ 目录

  ![python](.\img\python.png)

## 2.python注释

### 1. 单行注释(‘#’)

```python
# 这是单行注释，编译器直接跳过，给程序员看的 
```

### 2. 多行注释('''内容''')

```python
'''这是多行注释，编译器直接跳过，给程序员看的'''
"""这是多行注释，编译器直接跳过，给程序员看的"""
```

## 3.PEP8

> python 编码规范

+ 每个 import 语句只导入一个模块，尽量避免一次导入多个模块

  ```python
  #推荐
  import os
  import sys
  #不推荐
  import os,sys
  ```

+ 不要在行尾添加分号，也不要用分号将两条命令放在同一行

  ```python
  #不推荐
  height=float(input("输入身高：")) ; weight=fioat(input("输入体重：")) 
  ```

+ 建议每行不超过 80 个字符，如果超过，建议使用小括号将多行内容隐式的连接起来，而不推荐使用反斜杠 \ 进行连接。

  > 注意，此编程规范适用于绝对大多数情况，但以下 2 种情况除外：
  >
  > - 导入模块的语句过长。
  > - 注释里的 URL。

  ```python
  #推荐
  s=("C语言中文网是中国领先的C语言程序设计专业网站，"
  "提供C语言入门经典教程、C语言编译器、C语言函数手册等。")
  #不推荐
  s="C语言中文网是中国领先的C语言程序设计专业网站，\
  提供C语言入门经典教程、C语言编译器、C语言函数手册等。"
  ```

+ 使用必要的空行可以增加代码的可读性，通常在顶级定义（如函数或类的定义）之间空两行，而方法定义之间空一行，另外在用于分隔某些功能的位置也可以空一行。

+ 通常情况下，在运算符两侧、函数参数之间以及逗号两侧，都建议使用空格进行分隔。

## 4.标识符

> python 中是区分大小写的

+ 命名规则

  > 1.标识符是由字符（A~Z 和 a~z）、下划线和数字组成，但第一个字符不能是数字。
  >
  > 2.标识符不能和 Python 中的保留字相同。
  >
  > 3.Python中的标识符中，不能包含空格、@、% 以及 $ 等特殊字符。

+ 特殊含义

  > 1.以单下划线开头的标识符（如 _width），表示不能直接访问的类属性，其无法通过 from...import* 的方式导入；
  >
  > 2.以双下划线开头的标识符（如__add）表示类的私有成员；
  >
  > 3.以双下划线作为开头和结尾的标识符（如 `__init__`），是专用标识符。
  >
  > 4.我们应尽量避免使用汉字作为标识符，这会避免遇到很多奇葩的错误。

+ 规范

  > 1.当标识符用作模块名时，应尽量短小，并且全部使用小写字母，可以使用下划线分割多个字母，例如 game_mian、game_register 等。
  >
  > 2.当标识符用作包的名称时，应尽量短小，也全部使用小写字母，不推荐使用下划线，例如 com.mr、com.mr.book 等。
  >
  > 3.当标识符用作类名时，应采用单词首字母大写的形式。例如，定义一个图书类，可以命名为 Book。
  >
  > 4.模块内部的类名，可以采用 "下划线+首字母大写" 的形式，如 _Book;
  >
  > 5.函数名、类中的属性名和方法名，应全部使用小写字母，多个单词之间可以用下划线分割 ；
  >
  > 6.常量命名应全部使用大写字母，单词之间可以用下划线分割；

## 5.关键字

> Python 是严格区分大小写的，保留字也不例外

```python
import keyword
print(keyword.kwlist)
##########结果##########
['False', 'None', 'True', 'and', 'as', 'assert', 'break', 'class', 'continue', 'def', 'del', 'elif', 'else', 'except', 'finally', 'for', 'from', 'global', 'if', 'import', 'in', 'is', 'lambda', 'nonlocal', 'not', 'or', 'pass', 'raise', 'return', 'try', 'while', 'with', 'yield']
```

## 6.内置函数

+ 参考文档

  [内置函数](https://docs.python.org/zh-cn/3/library/functions.html)
  
+ 展示

  ![内置函数](.\img\内置函数.png)

+ 注意

  > 不要使用内置函数的名字作为标识符使用（例如变量名、函数名、类名、模板名、对象名等），虽然这样做 Python 解释器不会报错，但这会导致同名的内置函数被覆盖，从而无法使用。

## 7.变量和常量

### 1. 变量

> 在编程语言中，将数据放入变量的过程叫做赋值（Assignment）。Python 使用等号`=`作为赋值运算符

+ 格式

  > name 表示变量名；value 表示值，也就是要存储的数据。

  ```python
  name = value
  ```

  > 注意：变量是标识符的一种，它的名字不能随便起，要遵守 [Python 标识符命名规范](http://c.biancheng.net/view/4186.html)，还要避免和 [Python 内置函数](http://c.biancheng.net/view/4208.html)以及 [Python 保留字](http://c.biancheng.net/view/4188.html)重名。

### 2.常量

> 常量就是不变的量，一旦保存就不能修改，常量大写

```python
NAME = "小米"
```

##  8.输入、输出、占位符

### 1. 输入——input()函数

+ 定义：           输入：从外部获取变量的值

+ 输入函数：   input()：阻塞，等待输入

  > num表示接收值，input输入的类型是字符串

  ```python
  num = input("请输入您要输入的：")
  ```

+ 注意：           input()函数返回的是一个字符串类型

### 2. 输出——print()函数

+ 定义：         

  ​	 输出：打印到屏幕上一些信息,可以接受多个字符串，用逗号分隔,在写python程序时切记不要使用中文字符

+ 输出函数

  ```python
  print(value,....,sep=' ',end='\n')
  ```

### 3. 占位符

```python
%s		# 字符串的占位符
%d 		# 整数int的占位符
%f		# 浮点数的占位符，默认保留小数后面6位
%m.nf
	# m表示数占位的位数
		# m为正数，在前面填空格
		# m为负数，在后面填空格
	# n表示指定保留到小数点后n位
%%		# 表示%
%c		# 找到指定数字对应的编码
%o		# 以八进制的形式输出
%x		# 以十六进制的形式输出
```



# 2.表达式

## 1. 概述

> 定义：由变量、常量和运算符组成的式子称为表达式

## 2. 算术

### 1. 算术运算符

```python
 +    -     *     /      %    **      //
 加   减    乘     除    取模   求幂    取整
```

### 2. 算术表达式

+ 功能：进行符号对应的算术运算，不会修改变量的值

+ 值：相关算术运算的结果

+ 示例

  ```python
  num1 = 10
  num2 = 3
  print(num1 + num2)		#13
  print(num1 - num2)		#7
  print(num1 * num2)		#30
  print(num1 / num2)		#3.3333333333333335
  print(num1 % num2)		#1
  print(num1 ** num2)		#1000
  print(num1 // num2)		#3
  ```

## 3. 赋值

### 1. 赋值运算符（=）

```python
 =      #赋值运算符
```

### 2. 赋值运算表达式

+ 格式：变量 = 表达式

+ 功能：计算右侧表达式的值，并赋值给等号左侧的变量

+ 值：赋值结束后的值

+ 示例

  ```python
  num3 = 10
  num4 = num3 + 2
  ```

### 3. 复合运算符

```python
+= 		a += b  --> a = a + b
-= 		a -= b  --> a = a - b
*=		a *= b  --> a = a * b
/=	 	a /= b  --> a = a / b
%=		a %= b  --> a = a % b
**=		a **= b  --> a = a ** b
//=		a //= b  --> a = a // b
```

## 4. 位运算符

### 1. 位运算符

```
&   按位与运算符：
     参与运算两个值，如果两个相应位都为1，
     则该位结果为1，否则为0
|   按位或运算符：
    参与运算两个值，如果两个相应位有一个1，
    则该位结果为1，否则为0
^   按位异或运算符
     参与运算两个值，如果两个相应位不同时，
     则该位结果为1，否则为0
~   按位取反运算符：
     对数据的每个二进制位进行取反操作，
     把1变为0，把0变成1
     ~n====>-(n+1)
<<  左移运算符：
       运算数的各二进制全部左移若干位，由<<
       右侧数字指定移动位数，高位丢弃，低位补0
>>  右移运算符：
       运算数的各二进制全部右移若干位，由>>
       右侧数字指定移动位数
	左移运算：n<<m ==>n*2^m
	右移运算：n>>m ==>n*2^(-m)(结果取整数)
```

### 2. 示例

```python
print(5 & 7)     #5
print(5 | 7)     #7
print(5 ^ 7)     #2
print(~5)        #-6
```

## 5. 关系运算

### 1. 关系运算符

```python
==     !=       >       <     >=       <=
等于   不等于    大于    小于   大于等于  小于等于
```

### 2. 关系运算表达式

+ 格式：表达式1  关系运算符  表达式2
+ 功能：计算表达式1和表达式2的值
+ 值：如果关系成立，则整个关系表达式的值为真，如果关系不成立，则整个关系表达式的值为假

## 6. 逻辑运算

### 1. 逻辑与运算 and

+ 格式：表达式1 and 表达式2
+ 功能：首先计算“表达式1”的值，若表达式1的值为真，则计算“表达式2”的值
+ 值：如果表达式1的值为真，表达式2的值为真，则逻辑表达式的值为真
      如果表达式1的值为真，表达式2的值为假，则逻辑表达式的值为假
      如果表达式1的值为假，表达式2的值为真，则逻辑表达式的值为假
      如果表达式1的值为假，表达式2的值为假，则逻辑表达式的值为假
      总结：有一个为假就为假 

### 2. 逻辑或运算 or

+ 格式：表达式1 or 表达式2
+ 功能：首先计算“表达式1”的值，若表达式1的值为假，则计算“表达式2”的值
+ 值：如果表达式1的值为真，表达式2的值为真，则逻辑表达式的值为真
      如果表达式1的值为真，表达式2的值为假，则逻辑表达式的值为真
      如果表达式1的值为假，表达式2的值为真，则逻辑表达式的值为真
      如果表达式1的值为假，表达式2的值为假，则逻辑表达式的值为假
      总结：有一个为真就为真

### 3. 逻辑非  not

+  格式：not  表达式
+  值：如果“表达式”的值为真，则逻辑非运算表达式的值为假
       如果“表达式”的值为假，则逻辑非运算表达式的值为真
       总结：颠倒黑白

### 4. 逻辑与、逻辑或的短路

+ 短路原则：
      表达式1 and 表达式 and 表达式3 ..... and 表达式n
      从左至右依次计算表达式的值，直到遇到某个表达式的值为假就停止计算
      表达式1 or 表达式 or 表达式3 ..... or 表达式n
      从左至右依次计算表达式的值，直到遇到某个表达式的值为真就停止计算

## 7. 成员运算符

### 1. 格式

```python
x in seq         x not in seq
```

### 2. in

>in：如果在指定的序列中找到值则返回真，否则返回假

### 3. not in

> not in：如果在指定的序列中没有找到值则返回真，否则返回假

## 8. 身份运算符

### 1. 格式

```python
obj1 is obj2         obj1 is not obj2
```

### 2. is

> is：判断两个标识符是否引用同一个对象，相同返回真，否则返回假

### 3. is not

> is not：判断两个标识符是否引用同一个对象，不同返回真，否则返回假

## 9. 运算符的优先级

```python
**   指数									    
~    +    -  按位取反 加 减（一元或者称为单目运算）		
*    /    %    //    乘 除 取模  取整
+    - 加减法
<<   >>
&
^   |
<   >    <=   >=
==  != 
*=  /=   %=   //=    +=    -=
is      is not
in      not in
and >  or >  not(这里的>表示优先级)

# 提示：忘记了可以用小括号来替代
```



# 3. 语句

## 1. 判断语句

### 1. `if`语句

+ 格式

  ```python
  if 表达式:
  	语句
  ```

+ 逻辑

  ```python
  逻辑：当程序运行到if语句时，首先计算“表达式”的值，如果表达式的值为真，则执行“语句”，如果表达式的值为假，则结束if语句，继续向下执行
  ```

### 2. `if-else`语句

+ 格式

  ```python
  if 表达式:
      语句1
  else:
      语句2
  ```

+ 逻辑

  ```python
  逻辑：当程序运行到if-else语句时，首先计算“表达式” 的值，如果表达式的值为真，则执行“语句1”，如果表达式的值为假，则执行“语句2”
  ```

### 3. `if-elif-else`语句

+ 格式

  ```python
  if 表达式1:
      语句1
  elif 表达式2:
      语句2
  ……
  elif 表达式n:
      语句n
  else:
      语句e
  ```

+ 逻辑

  ```python
  逻辑：当程序执行到if-elif-else语句时，首先计算“表达式1”的值，如果“表达式1”的值为真，则执行“语句1”，执行完“语句1”则结束整个if-elif-else语句继续向下执行。如果“表达式1”的值为假，则计算“表达式2”的值，如果“表达式2”的值为真，则执行“语句2”，执行完“语句2”则结束整个if-elif-else语句继续向下执行。如果“表达式2”的值为假，则计算“表达式3”的值。如此进行下去，直到某个表达式的值为真为止。如果所有的表达式都为假，且有else语句则执行“语句e”
  ```

### 4. `if`补充内容

+ if补充

  ```python
  在Python中允许类似于 5<a<10 的写法         
  a = 10
  1<a<20  # True
  11<a<20  # False
  ```

+ 三元运算符

  + 格式

    ```python
    变量 = 值1 if 条件 else 值2
    ```

  + 逻辑

    ```python
    当条件成立时把值1赋值给变量，条件不成立时把值2赋值给变量，其实就是对if...else 语句的一种简写。
    ```

  + 示例

    ```python
    a = 10
    b = 30
    c = a if a>b else b
    print('a和b两个数的较大值是%d'%c) #c=30
    ```

## 2. 循环语句

### 1. while语句

+ 格式

  ```python
  while 表达式:
      语句
  ```

+ 逻辑

  ```python
  当程序执行到while语句时，首先计算表达式的值，如果表达式的值为假，则跳过整个while语句继续向下执行。如果表达式的值为真，则执行语句，执行完语句再计算表达式的值。如果表达式的值为假，则跳过整个while语句继续向下执行。如果表达式的值为真，则执行语句，执行完语句在计算表达式的值，如此循环往复直到表达式的值为假才停止。
  ```

### 2. while-else语句

+ 格式

  ```python
  while 表达式:
      语句1
  else:
      语句2 
  ```

+ 逻辑

  ```python
  在表达式的值为False时执行else语句中的语句2
  ```

+ 注意

  ```python
  循环语句可以有else子句，表达式错误导致循环终止时被执行，但循环被break终止时else语句不执行
  ```

+ 示例

  ```python
  index = 0
  while index < 3:
      print("index = %d"%index)	# index = 0
      index += 1
      if index == 1:
          break
  else:
      print("循环结束了")	# 循环结束了
  ```

### 3. for语句

+ 格式

  ```python
  for 变量 in 集合:
      语句
  ```

+ 逻辑

  ```python
  当程序执行到for语句时，按顺序取“集合”中的每个元素赋值给“变量”，在执行“语句”。如此循环往复，直到取完集合中的元素为止。
  ```

+ 示例

  ```python
  range([startNum,]endNum[, step])
  # 列表生成器
  # startNum：开始的数字，默认为0
  # endNum：结束的数字，不包含在内
  # step: 步长，默认为1
  ----------------------------------
  # 同时遍历下标和元素
  #enumerate()返回一个元组（由下标和数值组成）
  for index, x in enumerate([1,2,3,4,5]):
      print(index, x)
  # --------------结果------------------
  # 0 1
  # 1 2
  # 2 3
  # 3 4
  # 4 5
  ```

## 3. break语句

### 1. 作用：跳出循环

### 2. 注意：只能跳出距离最近的for或者while

### 3. 示例

```python 
for x in [1,2,3,4,5]:
    if x == 3:
        break
    print("x = %d"%x)
# -----------结果----------------
# x = 1
# x = 2
```

## 4. continue语句

### 1. 作用

>  跳过本次循环块中的剩余语句，然后继续下一次循环

### 2. 注意

> 只能跳过距离最近的for或者while

### 3. 示例

```python
for x in [1,2,3,4,5]:
    if x == 3:
        continue
    print("x = %d"%x)
# ---------结果-------------
# x = 1
# x = 2
# x = 4
# x = 5
```

## 5. pass语句

### 1. 作用

> 当语句要求不希望任何命令或代码来执行

### 2. 说明

```python
pass语句时一个空操作，在执行时没有任何响应。pass也是代码最终会用的，但是暂时写不出来，使用在 if语句、while语句、for语句、函数、类等位置
```

### 3. 示例

```python
if 1:
    pass
for x in [1,2,3]:
    pass
```



# 4.数据类型

## 1.Number

### 1.整形int

> python可以处理任意大小的整数，包含负数

```python
num1 = 10
```

### 2.浮点型

> 浮点数：由整数部分和小数部分组成的
>
> 注意：运算可能有四舍五入的误差

```python
num1 = 0.1
```

### 3.复数类型

```python
num1 = 12 + 4j
```

### 4.方法

+ 基本常用的方法

  ```python
  abs()		# 求绝对值
  max()		# 求最大值
  min()		# 求最小值
  pow()		# 求x的n次方
  round()		# 四舍五入
  ```

+ math模块

  ```python
  math.ceil()		# 向上取整
  math.floor()	# 向下取整
  math.modf()		# 得到浮点数的小数部分和整数部分
  math.factorial()# 求一个数阶乘
  math.pi    		# 圆周率
  # ----------三角函数----------
  sin(x)		# 正弦值
  cos(x)		# 余弦值
  tan(x)		# 正切值
  asin(x)		# 反正弦弧度值
  acos(x)		# 反余弦弧度值
  atan(x)		# 反正切弧度值
  radians(x)	# 角度转为弧度
  ```

+ random模块

  ```python
  #1.random.randrange()
  	# 作用：从指定范围内，按照指定基数递增的集合中获取一个随机数，基数默认为1
  	# start指定范围的开始值，包含在范围内，默认从0开始
  	# stop指定范围的结束值，不包含范围内
  	# step指定基数（步长）
      
  #2.random.random()
  	# 随机生成一个实数，范围在[0,1)之间，得到浮点数
                                 
  #3.random.uniform()
  	# 随机生成一个实数，范围在[x,y]之间，得到浮点数，
  	# x为随机数的最小值，y为随机数的最大值
                                
  #4.random.shuffle(arr)
  	# 将序列的元素随机值排列	
                                 
  #5.random.randint()
  	# 在指定范围内获得一个整数[start,stop]
                                 
  #6.random.choice()
  	# 从序列(集合)中随机获取一个元素
  ```

+ 数字类型转换

  ```python
  #1.int(x,[base])
  	# 将x转为一个整数（base表示x从几进制转换成十进制）
      
  #2.float(x)
  	# 将x转为一个浮点数
  ```

## 2.bool

### 1. 定义

> 表示真假的值：Ture或Flase

### 2. 转换成布尔型 bool(x)

```
将x转换成布尔值
	1.None会转换成Flase
	2.数字：非零都是Ture
	3.字符串：除空字符串都是Ture
	4.列表：除空列表都是Ture
	5.字典：除字典都是Ture
	元组：除空元组都是Ture
```

## 3.None

### 1. 定义

> 是python里一个特殊的值，用None表示。None不能理解为0，因为0是有意义的，而None是一个特殊的控制，没有实际意义。

### 2. 作用

> 定义个变量时，不知道初始值要赋值成什么，那么就赋值为None，当有确定值在进行赋值操作。

## 4.str

### 1. 定义——字符串不可修改

> 字符串是单引号或者双引号括起来的任意文本。
> 但是注意引号本身是一种表现形式，不属于字符串一部分
> 注意：如果字符串本身带引号，'sunck is a "very" good man'

### 2. 形式

```python
"sunck is a good man"
'sunck is a mice man'
'''sunck is a good man''' 	# 这种常用于注释
```

### 3. 转义字符

+ 常用转义字符

  ```
  常用转义字符   \
  反斜杠     \\
  单引号     \'
  双引号     \"
  换行       \n
  跨平台换行   \r\n
  回车(清除前面的数据)   \r
  Tab（横向制表符）       \t
  ```

+ 特殊

  > 为了简化python允许使用'r'表示，''内部的字符串默认不转义

  ```python
  print(r'\\\t\\')     #原生字符串
  ```

+ 示例

  ```python
  # 如果字符串里面有很多个字符需要转义，就需要加入很多,
  print('\\\t\\')
  ```

### 4. 字符串运算

+ 字符串拼接

  ```python
  str3 = 'sunck is a good man'
  str4 = "sunck is a nice man"
  print(str3 + str4)
  # -------------结果---------------------
  # sunck is a good mansunck is a nice man
  ```

+ 重复输出字符串

  ```python
  str3 = 'sunck is a good man'
  print(str3 * 3)
  # -----------------结果---------------------------
  # sunck is a good mansunck is a good mansunck is a good man
  ```

+ 查找下标字符串

  > 注意：下标不要越界，否则会报错

  ```python
  str3 = 'sunck is a good man'
  print(str3[1])		# u
  ```

+ 切片

  > 切片是指对操作的对象截取其中一部分的操作。**字符串、列表、元组**都支持切片操作。
  >
  > 语法：[起始:结束:步长]，也可以简化使用 [起始:结束]
  >
  > 注意：选取的区间从"起始"位开始，到"结束"位的前一位结束（不包含结束位本身)，步长表示选取间隔。

  ```python
  str3 = 'sunck is a good man'
  print("*"+str3[11:15]+"*")	# *good*
  ```

  ```python
  str3 = 'sunck is a good man'
  print(11:-1:-1)
  ```

+ 是否存在

  ```python
  str3 = 'sunck is a good man'
  print("sunck" in str3)		# True
  print("kaige" in str3)		# False
  ```

### 5. 内置方法

#### 1. 最基础的方法

```python
# 1.eval()
	# 功能：将字符串当成有效的表达式来求值并返回计算结果
	# 原型：eval(*args,**kwargs)
	print(eval("12+3"))      #15
    
# 2.ord()
	# 功能：获取字符的ASCII整数表示
	print(ord("A"))     #65
    
# 3.chr()
	# 功能：把数字编码转换为对应的字符
	print(chr(65))       #A
    
# 4.str()
	# 功能：转成字符串
	print(str(123))     #"123"
    
# 5.max(str)
	# 功能：返回字符串中最大的字母
	str32 = "sunck is a good man"
	print(max(str32)) 	# u
    
# 6.min(str)
	# 功能：返回字符串中最小的字母
```

#### 2. 获取长度

```python
len(string)
	# 功能：返回字符串的长度（按字符个数计算）
	# 原型：len(*args, **kwargs)
print(len("sunck is a good man"))	 # 19
print(len("sunck is a good man凯"))	# 20 
```

#### 3. 查找内容

```python
# 1.find(str[,beg= 0,end=len(string)])
	# 功能：检测str是否包含在string中，如果指定beg和end，则检测指定范围内是否包含。如果包含返回第一个开始的索引值， 否则返回-1
	# 原型：find(self, sub, start=None, end=None)
	str17 = "sunck"
	str18 = "cool"
	str19 = "aaasunck is a good man! sunck is a nice man"
	res = str19.find(str18)
	print(res)		# -1
    
# 2.rfind(str,beg= 0,end=len(string))
	# 功能：类似于find()，只不过从右边开始查找
	# 原型：rfind(self, sub, start=None, end=None)
    
# 3.index(str,beg= 0,end=len(string))
	# 功能：跟find()一样，区别在于如果str不存在会报异常
	# 原型：index(self, sub, start=None, end=None)
	str20 = "sunck"
	str21 = "cool"
	str22 = "aaasunck is a good man! sunck is a nice man"
	res = str22.index(str20)
	print(res)		# 3
    
# 4.rindex(str,beg= 0,end=len(string))
	# 功能：类似于index()，只不过从右边开始查找
	# 原型：rindex(self, sub, start=None, end=None)
```

#### 4. 判断

```python
# 1.startswith(str[,beg=0,end=len(string)])
	# 功能：检查字符串是否以str开头， 是返回True，否则返回Flase。如果指定beg和end，则在指定范围内检查
	# 原型：startswith(self, prefix, start=None, end=None)
	str40 = "sunck is a good man"
	print(str40.startswith("sunck"))	# True
	print(str40.startswith("good"))		# False
    
# 2.endswith(suffix[,beg=0,end=len(string)])
	# 功能：检查字符串是否以str结尾，是返回True，否则返回Flase。 如果指定beg和end，则在指定范围内检查
	# 原型：endswith(self, suffix, start=None, end=None)
    
# 3.isalpha()
	# 功能：如果字符串至少有一个字符并且所有的字符都是字母返回True，否则返回Flase（判断全是字母）
	# 原型：isalpha(self)
	print("".isalpha())			# False
	print("abc".isalpha())		# True
	print("abc12".isalpha())	# False
    
# 4.isdigit()
	# 功能：如果字符串只包含数字返回True，否则返回Flase（判断全是数字的）
	# 原型： isdigit(self)
	print("".isdigit())			# False
	print("123".isdigit())		# True
	print("abc123".isdigit())	# False
    
# 5.isalnum()
	# 功能：如果字符串至少有一个字符并且所有的字符，都是字母或数字返回True，否则返回Flase（判断全是子母河数字组成）
	# 原型：isalnum(self)
	print("".isalnum())			# False
	print("abc".isalnum())		# True
	print("abc12".isalnum())	# True
    
# 6.isspace()
	# 功能：如果字符串中只含有空格则返回True。否则返回False（判断全是空格）
	# 原型：isspace(self)
	print("".isspace())		# False
	print("  ".isspace())	# True
	print(" a".isspace())	# False
	print("\t".isspace())	# True
	print("\n".isspace())	# True
    
# 7.isupper()
	# 功能：如果字符串至少有一个字符并且所有的字母,都是大写字母返回True，否则返回Flase（判断全是大写字母和数字组成或特殊符号）
	# 原型：isupper(self)
	print("sunck".isupper())		# False
	print("SUNCK".isupper())		# True
	print("SUNCK#$%".isupper())		# True
	print("SUNCK123".isupper())		# True
    
# 8.islower()
	# 功能：如果字符串至少有一个字符并且所有的字母,都是小写字母返回True，否则返回Flase（判断全是小写字母和数字或特殊字符）
    
# 9.istitle()
	# 功能：如果字符串是标题化的返回True，否则返回Flase
    
# 10.isnumeric()
	# 功能：如果字符串只包含数字返回True，否则返回Flase（判断全是数字）
    
# 11.isdecimal()
	# 功能：检测字符串只包含十进制数字
```

#### 5. 计算出现次数

```python
# count(str[,beg= 0,end=len(string)])
	# 功能：返回str在string里面出现的次数，如果beg或者end指定则返回指定范围内 str出现的次数
	# 原型：count(self, sub, start=None, end=None)
str15 = "sunck"
str16 = "sunck is a good man! sunck is a nice man"
print(str16.count(str15))		# 2 
```

#### 6. 替换内容

```python
# 1.replace(old,new[,max])
	# 功能：将字符串中的old替换成new，如果max指定， 则不超过max次 
	# 原型：replace(self, old, new, count=None)
str33 = "sunck is a good man, " \
   		"sunck is a nice man, " \
        "sunck is a cool man, " \
        "sunck is a handsome man"
str34 = str33.replace("sunck", "kaige",2)
print(str34)
# ------------------结果----------------------------
# kaige is a good man, kaige is a nice man, sunck is a cool man, sunck is a handsome man

# 2.两个函数一起用
# 2.1 maketrans()
	# 原型：maketrans(self, *args, **kwargs)
	# 功能：创建字符映射的转换表，对于接受两个参数的，第一个是字符串，表示要转换的字符, 第二个也是字符串表示转换的目标
t = str.maketrans("ag", "12")
# 2.2 translate(table)
	# 原型：translate(self, table)
	# 功能：根据str给出的表转换字符串
str35 = "sunck is a good man"
print(str35.translate(t))	# sunck is 1 2ood m1n
```

#### 7. 切割字符串

```python
# 1.split(str="",num=string.count(str))
	# 功能:按照str进行切割
	# 原型：split(self, sep=None, maxsplit=-1)
str29 = "sunck#is#a#good#man#!"
wordList = str29.split("#")
print(wordList)	# ['sunck', 'is', 'a', 'good', 'man', '!']
print(type(wordList)) 	# <class 'list'>
# 2.rsplit(self, sep=None, maxsplit=-1)
	# 从右往左切割字符串
    
# 3.splitlines([keepends])
	# 功能：按照行('\r', '\r\n', '\n'),如果keepends为Flase，不包含换行符
	# 原型：splitlines(self, keepends=None)
str30 = '''good 
nice
cool
handsome
'''
wordList2 = str30.splitlines()
print(wordList2)	# ['good ', 'nice', 'cool', 'handsome']
# 4.partition()
	# print("hello".partition("e"))  # ('h', 'e', 'llo')
    
# 5.rpartition()
	# 从右往左，跟partition用法一样
```

#### 8. 修改大小写

```python
# 1.capitalize()
	# 原型：capitalize(self)
	# 功能：将字符串中的第一个字符转为大写,其余转为小写
str5 = "sunck Is A Good Man"
str6 = str5.capitalize()
print(str5,str6)	# sunck Is A Good Man Sunck is a good man
# 2.title()
	# 原型：title(self)
	# 功能：得到“标题化”的字符串，每个单词的首字符大写，其余的小写
str7 = "sunck Is A Good MaN"
str8 = str7.title()
print(str7,str8)	# sunck Is A Good MaN Sunck Is A Good Man
# 3.upper()
	# 原型： upper(self)
	# 功能：转换字符串中所有的小写字母为大写
    
# 4.lower()
	# 原型：lower(self)
	# 功能：转换字符串中所有的大写字母为小写
str1 = "Sunck Is A Good Man"
str2 = str1.lower()    
print(str1,str2)	#Sunck Is A Good Man sunck is a good man
# 5.swapcase()
	# 原型：swapcase(self)
	# 功能：将字符串中小写转为大写，大写转为小写
str3 = "Sunck Is A Good Man"
str4 = str3.swapcase()
print(str3,str4)	# Sunck Is A Good Man sUNCK iS a gOOD mAN
```

#### 9. 空格处理

```python
# 1.ljust(width[,fillchar])
	# 原型： ljust(self, width, fillchar=None)
	# 功能：返回一个指定宽度width的左对齐字符串,fillchar为填充字符，默认为空格
str11 = "good"
str12 =str11.ljust(20, "#")
print("*"+str12+"*")	# *good################*
# 2.rjust(width[,fillchar])
	# 原型：rjust(self, width, fillchar=None)
	# 功能：返回一个指定宽度width的右对齐字符串,fillchar为填充字符，默认为空格
        
# 3.center(width[,fillchar])
	# 原型：center(self, width, fillchar=None)
	# 功能：返回一个指定宽度width的居中字符串,fillchar为填充字符，默认为空格
str9 = "good"
str10 =str9.center(20, "#")
print("*"+str10+"*")	# *########good########*
# 4.lstrip()
	# 原型：lstrip(self, chars=None)
	# 功能：截掉字符串左边指定的字符，默认为空格
str23 = "        sunck is a good man"
str24 = str23.lstrip()
print(str23)	#         sunck is a good man
print(str24)	# sunck is a good man
str25 = "********sunck is a good man"
str26 = str25.lstrip("*")
print(str25)	# ********sunck is a good man
print(str26)	# sunck is a good man
# 5.rstrip()
	# 原型：rstrip(self, chars=None)
	# 功能：截掉字符串右边指定的字符，默认为空格
    
# 6.strip([chars])
	# 原型：strip(self, chars=None)
	# 功能：在字符串上执行lstrip和rstrip
str27 = "********sunck is a good man**"
str28 = str27.strip("*")
print(str27)	# ********sunck is a good man**
print(str28)	# sunck is a good man
# 7.zfill(width)
	# 原型：zfill(self, width)
	# 功能：返回指定宽度width的右对齐字符串，填充0
str13 = "good"
str14 =str13.zfill(20)
print("*"+str14+"*")	# *0000000000000000good*
```

#### 10. 字符串拼接

```python
# 1.join(seq)
	# 原型：join(self, iterable)
str31 = " ".join(wordList)
print(str31)	# sunck is a good man !
```

#### 11. 编码与解码

+ 编码

  ```python
  # encode(encoding="UTF-8",errors="strict")
  	# 原型：encode(self, encoding='utf-8',errors='strict')
  	# 功能：以encoding指定的编码格式进行编码，
      # 如果出错默认报一个ValueError异常，
      # 除非errors指定的是igonre或者replace
  str41 = "凯哥是一个好男人"
  str42 = str41.encode()
  str43 = str41.encode("GBK")#gb2312
  print(str41)	# 凯哥是一个好男人
  print(str42)	# b'\xe5\x87\xaf\xe5\x93\xa5\xe6\x98\xaf\xe4\xb8\x80\xe4\xb8\xaa\xe5\xa5\xbd\xe7\x94\xb7\xe4\xba\xba'
  print(str43)	# b'\xbf\xad\xb8\xe7\xca\xc7\xd2\xbb\xb8\xf6\xba\xc3\xc4\xd0\xc8\xcb'
  ```

+ 解码

  ```python
  # decode(encoding="UTF-8",errors="strict")
  	# 原型：decode(self, *args, **kwargs)
  print(str42.decode("UTF-8"))	# 凯哥是一个好男人
  print(str43.decode("GBK"))		# 凯哥是一个好男人
  ```

## 5.bytes

>  bytes 类型用来表示一个字节串。“字节串“不是编程术语，是我自己“捏造”的一个词，用来和字符串相呼应。
>
> bytes 是 Python 3.x 新增的类型，在 Python 2.x 中是不存在的。

### 1.bytes和str区别

+ 字符串由若干个字符组成，以字符为单位进行操作；字节串由若干个字节组成，以字节为单位进行操作。
+ 字节串和字符串除了操作的数据单元不同之外，它们支持的所有方法都基本相同。
+ 字节串和字符串都是不可变序列，不能随意增加和删除数据。

### 2. 创建bytes对象

+ 通过构造函数创建空bytes

  ```python
  b1 = bytes()
  ```

+ 通过空字符串创建空bytes

  ```python
  b2 = b''
  ```

+ 通过b前缀将字符串转换成 bytes

  ```python
  b3 = b'http://c.biancheng.net/python/'
  print("b3: ", b3)	# b3:  b'http://c.biancheng.net/python/'
  print(b3[3])		# 112
  print(b3[7:22])		# b'c.biancheng.net'
  ```

+ 为 bytes() 方法指定字符集

  ```python
  b4 = bytes('C语言中文网8岁了', encoding='UTF-8')
  print("b4: ", b4)	# b4:  b'C\xe8\xaf\xad\xe8\xa8\x80\xe4\xb8\xad\xe6\x96\x87\xe7\xbd\x918\xe5\xb2\x81\xe4\xba\x86'
  ```

+ 通过 encode() 方法将字符串转换成 bytes

  ```python
  b5 = "C语言中文网8岁了".encode('UTF-8')
  print("b5: ", b5)	# b5:  b'C\xe8\xaf\xad\xe8\xa8\x80\xe4\xb8\xad\xe6\x96\x87\xe7\xbd\x918\xe5\xb2\x81\xe4\xba\x86'
  ```

### 3.将 bytes 对象转换为字符串

```python
#通过 decode() 方法将 bytes 转换成字符串
str1 = b5.decode('UTF-8')
print("str1: ", str1)	# str1:  C语言中文网8岁了
```

## 6.list

### 1. 列表格式

```python
格式： 列表名 = [列表选项1，列表选项2，......，列表选项n]
```

### 2. 创建列表

+ 创建空列表

  ```python
  list1 = []
  print(list1)		# []
  print(list())		# []
  ```

+ 创建带有元素的列表

  ```python
  list2 = [18,19,20,"good",True,None]
  ```

### 3. 列表的操作——列表可修改

+ 查找

  ```python
  list3 = [18,19,20,21,22]	#取值：列表名[下标]
  print(list3[2])			# 20
  ```

+ 修改(替换)

  ```python
  list3 = [18,19,20,21,22]    #替换：列表名[下标] = 新值
  list3[2] = 200
  print(list3)			# [18, 19, 200, 21, 22]
  # 注意：下标不要越界
  ```

+ 组合

  ```python
  list4 = [1,2,3]
  list5 = [4,5,6]
  print(list4,list5)	# [1, 2, 3] [4, 5, 6]
  print(list4 + list5)# [1, 2, 3, 4, 5, 6]
  ```

+ 重复

  ```python
  list6 = [7,8,9]
  print(list6 * 3)	# [7, 8, 9, 7, 8, 9, 7, 8, 9]
  ```

+ in        not in

  ```python
  print(1 in [1,2,3]) # True
  ```

+ 截取

  ```python
  list7 = [1,2,3,4,5,6,7,8,9,0]
  print(list7[2])			# 3
  print(list7[1:4])		# [2, 3, 4]
  # -1表示的是最后一个元素的下标
  # -2表示倒数第二个元素的下标
  print(list7[1:-1])		# [2, 3, 4, 5, 6, 7, 8, 9]
  print(list7[4:])		# [5, 6, 7, 8, 9, 0]
  print(list7[:4])		# [1, 2, 3, 4]
  ```

>二维列表：列表中的元数是一维列表 
>本质：一维列表

### 4. 列表的方法

#### 1. 最基础的方法

```python
# 1.len(list)
	# 返回列表中元素的个数
list8 = [1,2,3,4,5]
print(len(list8))	# 5

# 2.max(list)
	# 返回列表中元素的最大值
    
# 3.min(list)
	# 返回列表中元素的最小值
    
# 4.list(seq)
	# 转为列表,seq为字符串、元组、集合
```

#### 2. 添加元素

> append		extend		insert

```python
# 1.list.append(obj)
	# 在列表的末尾添加一个新的元素
list1 = [1,2,3,4,5]
list1.append(6)
list1.append([9,8,7])
print(list1)	# [1, 2, 3, 4, 5, 6, [9, 8, 7]]
# 2.list.extend(seq)
	# 在列表末尾一次性追加多个元素
list2 = [1,2,3,4,5]
list2.extend([9,8,7])
print(list2)	# [1, 2, 3, 4, 5, 9, 8, 7]
# 3.list.insert(index,obj)
	# 将元数插入列表,不会覆盖原元数，原元数按顺序后移
list3 = [1,2,3,4,5]
list3.insert(2,100)
print(list3)	# [1, 2, 100, 3, 4, 5]
```

#### 3. 查找元素

> index		count		

```python
# 1.list.index(obj)
	# 从列表中找出某个值第一个匹配项的下标
list7 = [1,2,3,4,5]
print(list7.index(2))	# 1
# 2.list.count(obj)
	# 统计某个元数在列表中出现的次数
list7 = [1,2,3,4,5,2]
print(list7.count(2))	# 2
```

#### 4. 删除元素

> pop		remove		clear

```python
# 1.list.pop(obj=list[-1])
	# 移除列表中指定下标的元素，默认删除最后一个元素
list4 = [1,2,3,4,5]
list4.pop()
print(list4)	# [1, 2, 3, 4]
# 2.list.remove(obj)
	# 移除列表中的某个值的第一个匹配项
list5 = [1,2,3,4,5,3]
list5.remove(3)
print(list5)	# [1, 2, 4, 5, 3]
# 3.list.clear()
	# 清空列表
list6 = [1,2,3,4,5]
list6.clear()
print(list6)	# []
```

#### 5. 正序和倒序

+ 正序

  ```python
  # list.sort([func])
  	# 将列表中的元素从小到大排序
  list9 = [4,7,1,3,9,6,5]
  list9.sort()
  list9.reverse()
  print(list9)	# [9, 7, 6, 5, 4, 3, 1]
  ```

+ 倒序

  ```python
  # list.reverse()
  	# 倒序列表中元素
  list8 = [1,2,3,4,5]
  list8.reverse()
  print(list8)	# [5, 4, 3, 2, 1]
  ```

#### 6. 拷贝

+ == 和 is

  ```python
  # ==：判断的是数值
  # is：判断的是内存地址
  --------------------------------------
  num1 = -6
  num2 = -6
  print(id(num1),id(num2))# 2900494760784 2900494760880
  print(num1 == num2)		# True
  print(num1 is num2)		# False
  ```

+ 小整数对象

  ```python
  # 范围：[-5:256]最好在python环境中演示，pycharm进行了其他的优化
  
  a = [1,2,3,4,5,[7,8,9]]
  b = a
  print(a,b)# [1, 2, 3, 4, 5, [7, 8, 9]] [1, 2, 3, 4, 5, [7, 8, 9]]
  print(b == a)# True
  print(b is a)# True
  a[5][1] = 100
  print(a,b)# [1, 2, 3, 4, 5, [7, 100, 9]] [1, 2, 3, 4, 5, [7, 100, 9]]
  print(id(a),id(b))# 2900492517640 2900492517640
  print(id(a[5]),id(b[5]))# 2900495531208 2900495531208
  ```

+ 浅拷贝与深拷贝

  ```
  copy()浅拷贝：只拷贝表层元素(数值)
  deepcopy()深拷贝：在内存中重新创建所有子元素,深拷贝的区分的前提是列表中要有其他列表
  ```



## 7.tuple

## 8.dict

## 9.set







