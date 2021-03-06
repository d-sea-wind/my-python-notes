# 1. Jupyter Notebook快捷键

> Jupyter Notebook 有两种键盘输入模式。编辑模式，允许你往单元中键入代码或文本；这时的单元框线是绿色的。命令模式，键盘输入运行程序命令；这时的单元框线是灰色。 

## 1. 命令模式——按键ESC开启

```python 
#**	Enter : 转入编辑模式
#  	Shift-Enter : 运行本单元，选中下个单元
#**	Ctrl-Enter : 运行本单元
#	Alt-Enter : 运行本单元，在其下插入新单元
#**	Y : 单元转入代码状态
#**	M :单元转入markdown状态
#	R : 单元转入raw状态
#	1 : 设定 1 级标题
#	2 : 设定 2 级标题
#	3 : 设定 3 级标题
#	4 : 设定 4 级标题
#	5 : 设定 5 级标题
#	6 : 设定 6 级标题
#	Up: 选中上方单元
#	K : 选中上方单元
#	Down : 选中下方单元
#	J : 选中下方单元
#	Shift-K : 扩大选中上方单元
#	Shift-J : 扩大选中下方单元
#	A : 在上方插入新单元
#	B : 在下方插入新单元
#	X : 剪切选中的单元
#	C : 复制选中的单元
#	Shift-V : 粘贴到上方单元
#	V : 粘贴到下方单元
#	Z : 恢复删除的最后一个单元
#	D,D : 删除选中的单元
#	Shift-M : 合并选中的单元
#	Ctrl-S : 文件存盘
#	S : 文件存盘
#	L : 转换行号
#	O : 转换输出
#	Shift-O : 转换输出滚动
#	Esc : 关闭页面
#	Q : 关闭页面
#	H : 显示快捷键帮助
#	I,I : 中断Notebook内核
#	0,0 : 重启Notebook内核
#	Shift : 忽略
#	Shift-Space : 向上滚动
#	Space : 向下滚动
```

## 2. 编辑模式——Enter键启动

```python 
#	Tab : 代码补全或缩进
#	Shift-Tab : 提示
#	Ctrl-] : 缩进
#	Ctrl-[ : 解除缩进
#	Ctrl-A : 全选
#	Ctrl-Z : 复原
#	Ctrl-Shift-Z : 再做
#	Ctrl-Y : 再做
#	Ctrl-Home : 跳到单元开头
#	Ctrl-Up : 跳到单元开头
#	Ctrl-End : 跳到单元末尾
#	Ctrl-Down : 跳到单元末尾
#	Ctrl-Left : 跳到左边一个字首
#	Ctrl-Right : 跳到右边一个字首
#	Ctrl-Backspace : 删除前面一个字
#	Ctrl-Delete : 删除后面一个字
#	Esc : 进入命令模式
#	Ctrl-M : 进入命令模式
#	Shift-Enter : 运行本单元，选中下一单元
#	Ctrl-Enter : 运行本单元
#	Alt-Enter : 运行本单元，在下面插入一单元
#	Ctrl-Shift-- : 分割单元
#	Ctrl-Shift-Subtract : 分割单元
#	Ctrl-S : 文件存盘
#	Shift : 忽略
#	Up : 光标上移或转入上一单元
#	Down :光标下移或转入下一单元
```

## 3. 魔法方法

```python
#	%run 	导入自定义的python文件 
#	%whos 	查看声明了那些变量和函数 
#	!ls 	查看当前目录下的子文件和子目录 
# 	!pwd 	当前所在路径
```



# 2.  Numpy

>numpy：数值化的python ndarray
>
>标量 : 0维 向量 : 1维 矩阵 : 2维 张量 : 3维 
>
>matplotlib：图形展示库
>
> pandas 数据分析库 

## 1. Numpy的数值类型

```python 
1.bool：布尔类型，1 个字节，值为 True 或 False。
2.int：整数类型，通常为 int64 或 int32 。
3.intc：与 C 里的 int 相同，通常为 int32 或 int64。
4.intp：用于索引，通常为 int32 或 int64。
5.int8：字节（从 -128 到 127） tinyint
（tinyint 1字节 -2 ^7 ~ 2^7-1 (-128~127)）
6.int16：整数（从 -32768 到 32767） smallint
(smallint 2字节 -2 ^15 ~ 2^15-1 (-32768~32765))
7.int32：整数（从 -2147483648 到 2147483647） int
（int 4字节 -2 ^31~ 2^31-1 (-2147483648~2147483647)）
8.int64：整数（从 -9223372036854775808 到 9223372036854775807） bigint
（bigint 8字节 -2 ^63 ~ 2^63-1）
9.uint8：无符号整数（从 0 到 255） unsigned
10.uint16：无符号整数（从 0 到 65535）
11.uint32：无符号整数（从 0 到 4294967295）
12.uint64：无符号整数（从 0 到 18446744073709551615）
13.float：float64 的简写。
14.float16：半精度浮点，5 位指数，10 位尾数
15.float32：单精度浮点，8 位指数，23 位尾数
16.float64：双精度浮点，11 位指数，52 位尾数
17.complex：complex128 的简写。
18.complex64：复数，由两个 32 位浮点表示。
19.complex128：复数，由两个 64 位浮点表示。
```

## 2. Numpy

### 1. 矩阵的基础

+ ndarray()方法——生成一个指定几行几列的矩阵

  ```
  1.参数
  	1.shape：数组的形状(几行几列)
  	2.dtype：数据类型
  	3.buffer：对象暴露缓冲区接口
  	4.offset：数组数据的偏移量。
  	5.strides：数据步长。
  	6.order：{'C'，'F'}，以行或列为主排列顺序。
  ```

  ```python
  import numpy as np
  a = np.ndarray(shape=(3,3),dtype=np.int8)
  # 生成一个指定几行几列的矩阵
  print(a)
  # 矩阵的数据类型
  print(a.dtype)
  ```

+ **array()**——把列表或元组转换成矩阵

  ```python
  numpy.array(object, dtype=None, copy=True, order=None, subok=False, ndmin=0) 
  参数
  	1.object：列表、元组等。
      2.dtype：数据类型。如果未给出，则类型为被保存对象所需的最小类型。
      3.copy：布尔来写，默认 True，表示复制对象。
  ```

  ```python
  import numpy as np
  array1 = np.array([[1,2,3],[1,2,3],[1,2,3]])
  # 输出矩阵
  print(array1) 
      #[[1 2 3]
      # [1 2 3]
      # [1 2 3]]
  # 矩阵的维数
  print(array1.ndim)	# 2
  # 矩阵的行和列(行,列)
  print(array1.shape)	# (3, 3)
  # 矩阵元素的个数
  print(array1.size)	# 9
  ```

+ arange()—— 在给定区间内创建一系列均匀间隔的值 

  ```python
  numpy.arange(start, stop, step, dtype=None)
  参数
  	1.start 开始值(包括在内)
      2.stop  结束值(不包括在内)
      3.step  步长(设置值之间的间隔)
      4.dtype 数据类型
  ```

  ```python
  import numpy as np
  a = np.arange(1,10)
  print(a)	# [1 2 3 4 5 6 7 8 9]
  ```

+  linspace ()—— 创建数值有规律的数组 

  ```
  numpy.linspace(start, stop, num=50, endpoint=True, retstep=False, dtype=None) 
  参数
  	1.start：序列的起始值。
      2.stop：序列的结束值
      3.num：生成的样本数。默认值为50。
      4.endpoint：布尔值,如果为真,最后一个样本包含在序列内
      5.retstep：布尔值，如果为真，返回间距。
      6.dtype：数组的类型。
  ```

  ```python 
  import numpy as np
  a = np.linspace(start=0,stop=10,num=100)  #闭区间
  print(a)
  ```

+ logspace()——以什么为底的对数

  ```
  logspace(start, stop, num=50, endpoint=True, base=10.0, dtype=None,axis=0)
  参数：
  	1.start：序列的起始值。
      2.stop：序列的结束值
      3.num：生成的样本数。默认值为50。
      4.endpoint：布尔值,如果为真,最后一个样本包含在序列内
      5.base：对数的底数
      6.dtype：数组的类型。
  ```

  ```python 
  import numpy as np
  a = np.logspace(start=1,stop=10,num=10)
  print(a)
  # [1.e+01 1.e+02 1.e+03 1.e+04 1.e+05 1.e+06 1.e+07 1.e+08 1.e+09 1.e+10]
  
  #默认的log是以e为底数的  2.718
  np.log(10)	# 2.302585092994046
  np.log2(256)# 8.0
  np.log10(0.01)# -2.0
  ```

+  ones()——快速创建数值全部为1的多维数组 

  ```
  numpy.ones(shape, dtype=None, order='C')
  参数：
  	1.shape：用于指定数组形状
  	2.dtype：数据类型
  	3.order：{'C'，'F'}，按行或列方式储存数组。
  ```

  ```python
  import numpy as np
  a = np.ones(shape=(5,5))
  print(a)
  '''
  [[1. 1. 1. 1. 1.]
   [1. 1. 1. 1. 1.]
   [1. 1. 1. 1. 1.]
   [1. 1. 1. 1. 1.]
   [1. 1. 1. 1. 1.]]
  '''
  ```

+  zeros()——快速创建数值全部为0的多维数组 

  ```
  numpy.zeros(shape, dtype=None, order='C')
  参数：
  	1.shape：用于指定数组形状
  	2.dtype：数据类型
  	3.order：{'C'，'F'}，按行或列方式储存数组。
  功能：零矩阵	相当于代数中的0
  ```

  ```python
  import numpy as np
  a = np.zeros(shape=(3,3))
  print(a)
  '''
  [[0. 0. 0.]
   [0. 0. 0.]
   [0. 0. 0.]]
  '''
  ```

+  full()——创建一个自定义形状的数组

  ```
  full(shape, fill_value, dtype=None, order='C')
  参数：
  	1.shape：用于指定数组形状
  	2.fill_value：指定填充的数
  	3.dtype：数据类型
  	4.order：{'C'，'F'}，按行或列方式储存数组
  ```

  ```python
  import numpy as np
  a = np.full(shape=(3,3),fill_value=np.e)
  print(a)
  '''
  [[2.71828183 2.71828183 2.71828183]
   [2.71828183 2.71828183 2.71828183]
   [2.71828183 2.71828183 2.71828183]]
  '''
  ```

+  eye()——创建一个二维数组,其对角线上的值为 1,其余值全部为0

  ```
  numpy.eye(N, M=None, k=0, dtype=float, order='C') 
  参数：
  	N：输出数组的行数
  	M：输出数组的列数
  	k：主对角线索引：0。正值是指上对角线，负值是指下对角线
  	dtype：数据类型
  	order：{'C'，'F'}，按行或列方式储存数组
  功能：I 单位矩阵  主对角线上的值都是1  ,其它的位置为0
  ```

  ```python
  import numpy as np
  a = np.eye(3)
  print(a)
  '''
  [[1. 0. 0.]
   [0. 1. 0.]
   [0. 0. 1.]]
  '''
  ```

+  逆矩阵 

  > 逆矩阵矩阵的倒数,必须是方阵,满秩矩阵->奇异矩阵 

  ```python
  import numpy as np
  # A矩阵
A = np.array([[1,7,3],[2,2,3],[1.1,2,3]])
  # A矩阵的逆矩阵
  inv = np.linalg.inv(A)
  print(inv)
  # A矩阵与A矩阵的逆矩阵乘积
  a = np.dot(A,inv)
  print(a)
  ```
  

### 2. 随机数组抽样

+ 随机整数型的矩阵

  ```
  np.random.randint(low, high=None, size=None, dtype='l')
  参数
  	1.low 表示的是最小值
      2.high 表示最大值
      3.size 是一个元祖类型,相当于shape数组的形状(几行几列)
      4.dtype：数据类型
  ```

  ```python
  import numpy as np
  A=np.random.randint(0,256,size=(5,3),dtype=np.uint8)
  #直接取出的数值是标量
  print(type(A[0, 0]))	# <class 'numpy.uint8'>
  a = np.random.randint(0,100)
  print(type(a))	# <class 'int'>
  ```

+ 正态分布

  ```
  np.random.randn(*dn)
  参数
  	没有固定的参数，每多加一个数字，代表多增加一个维度
  ```

  ```python
  import numpy as np
  #标准的高斯分布  均值为0 标准差为1的  
  A=np.random.randn(5,3)
  # 均值
  a = A.mean()
  # 标准差
  b = A.std()
  print(a,b)
  # -0.0849567375997762 0.7322884247298508
  ```

+ 随机抽样

  ```
  np.random.random(size=None)
  参数：
  	size 表示形状(维度) 
  功能：
  	random随即生产的范围是0-1之间
  ```

  ```python
  import numpy as np
  a=np.random.random(size=3)
  print(a)
  # [0.17676145 0.79083794 0.83280386]
  ```

+ 不稳定的正态分布

  ```
  np.random.normal(loc=0.0, scale=1.0, size=None)
  参数：
  	1.loc：定位的的值
  	2.scale：波动值
  	3.size：数据长度
  ```

  ```python
  import numpy as np
  # 标准差
  a=np.random.normal(loc=170,scale=10,size=10).std()
  print(a)	# 12.123934839656267
  ```

+ 随机数

  > rand 和 random 的区别：random 需要 size来描述形状，而rand只需要我们直接给值,通过值的数量来确定形状 

  ```
  np.random.rand(*dn)
  参数：
  	没有固定的参数，每多加一个数字，代表多增加一个维度
  ```

  ```python 
  import numpy as np
  a=np.random.rand(5,3)
  print(a)
  '''
  [[0.55643289 0.40928932 0.60286928]
   [0.28476106 0.38359988 0.4582132 ]
   [0.55149086 0.77343123 0.31589351]
   [0.62248225 0.81779743 0.81834014]
   [0.50964729 0.12367222 0.72065945]]
  '''
  ```

+ diag()——构建对角矩阵 np.diag(v,k=0)参数为列表

  ```
  np.diag(v, k=0)
  参数：
  	1.v可以是一维或二维的矩阵
  	2.k<0表示斜线在矩阵的下方
  	  k>0表示斜线在矩阵的上方
  ```

  ```python
  import numpy as np
  a=np.diag([1,2,1],k=-1)
  print(a)
  '''
  [[0 0 0 0]
   [1 0 0 0]
   [0 2 0 0]
   [0 0 1 0]]
  '''
  ```

### 3. 文件 I/O 创建数组

+ CSV

  > csv,dat是一种常用的数据格式化文件类型

  ```
  
  ```

  ```python
  
  ```

  