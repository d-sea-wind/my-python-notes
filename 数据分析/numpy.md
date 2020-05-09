# 1.`numpy`

## 1.创建数组

### 1.`numpy`数组

```python
import numpy as np

#使用numpy生成数组,得到ndarray的类型
t1 = np.array([1,2,3,])
print(t1)		# [1 2 3]
print(type(t1))	# <class 'numpy.ndarray'>

t3 = np.arange(4,10,2)
print(t3)		# [4 6 8]
print(type(t3))	# <class 'numpy.ndarray'>
```

### 2. 类型的查看和设置

```python
# 查看数组形状
print(t3.shape)	# (3,)
# 修改数组形状
t3.reshape(1,3)
# 查看数据类型
print(t3.dtype) # int64
#numpy中的数据类型
t4 = np.array(range(1,4),dtype="i1")
print(t4)
print(t4.dtype) # int8

#numpy中的bool类型
t5 = np.array([1,1,0,1,0,0],dtype=bool)
print(t5)
print(t5.dtype) # bool

#调整数据类型
t6 = t5.astype("int8")
print(t6)
print(t6.dtype)	# int8

#numpy中的小数
t7 = np.array([random.random() for i in range(10)])
print(t7)
print(t7.dtype)
# 保留小数位数
t8 = np.round(t7,2)
print(t8)
```

## 2.`numpy`读取本地数据

### 1.轴

#### 1.二维数组的轴

![二维数组的轴](.\img\二维数组的轴.png)

#### 2.三维数组的轴

![三维数组的轴](.\img\三维数组的轴.png)

### 2.转置

> `numpy`中的转置：转置是一种变换，对于`numpy`中的数组来说，就是在对角线方向交换数据，目的也是为了更方便的去处理数据

#### 1.`t.transpose()`

> 转置

#### 2.`t.T`

> T:表示转置属性

#### 3.`t.swapaaxes()`

> 交换轴：行和列交换

#### 4.案例

```python
import numpy as np

t2 = np.arange(24).reshape((4,6))
print(t2)
print(t2.transpose)
print(t2.T)
print(t2.s)
```



### 3.读取本地数据

#### 1.`loadtxt`

+ `np.loadtxt(fname,dtype=np.float,delimiter=None,skiprows=0,usecols=None,unpack=False)`

  > frame:文件路径
  >
  > dtype:数据类型
  >
  > delimter:用什么分隔开的，对csv用`，`分隔
  >
  > skiprows:跳过多少行数据
  >
  > usecols:取哪几列数据
  >
  > unpack:转置

+ 案例

  > `numpy`的索引操作
  
  ```python
  import numpy as np
  
  us_file_path = "./youtube_video_data/US_video_data_numbers.csv"
  uk_file_path = "./youtube_video_data/GB_video_data_numbers.csv"
  
  # t1 = np.loadtxt(us_file_path,delimiter=",",dtype="int",unpack=True)
  t2 = np.loadtxt(us_file_path,delimiter=",",dtype="int")
  
  # print(t1)
  print(t2)
  
  print("*"*100)
  
  #取行
  print(t2[2])
  #取连续的多行
  print(t2[2:])
  #取不连续的多行
  print(t2[[2,8,10]])
  
  # print(t2[1,:])
  # print(t2[2:,:])
  # print(t2[[2,10,3],:])
  
  #取列
  print(t2[:,0])
  #取连续的多列
  print(t2[:,2:])
  #取不连续的多列
  print(t2[:,[0,2]])
  
  #取行和列，取第3行，第四列的值
  a = t2[2,3]
  print(a)
  print(type(a))
  
  #取多行和多列，取第3行到第五行，第2列到第4列的结果
  #去的是行和列交叉点的位置
  b = t2[2:5,1:4]
  print(b)
  
  #取多个不相邻的点
  #选出来的结果是（0，0） （2，1） （2，3）
  c = t2[[0,2,2],[0,1,3]]
  print(c)
  ```

#### 2.`numpy`三元运算符

> `np.where`		# 	`numpy`中的三元运算符

```python
np.where(t2<=3,100,300)#t2数组中小于等于3的都替换成100，否则替换成300
```

#### 3.`numpy`中的`clip`

> `clip`裁剪

```python
t.clip(10,18)#t数组中小于10的替换成10，大于18的替换成18  
```

