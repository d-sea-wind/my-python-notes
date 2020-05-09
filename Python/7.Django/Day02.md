# 				Day02

## 学习目标

- 修改数据库
- Django shell
- 数据级联（一对多）
- 元信息
- 定义字段
- 模型过滤
- 创建对象4种方式
- 查询集
  - 过滤器
  - 获取单个对象
  - 字段查询
  - 时间
  - 聚合函数
  - 跨关系查询
  - F对象
  - Q对象

## 学习课程

### 1.修改数据库

##### 	① 在settings中的DATABASES中进行修改

> - 'ENGINE': 'django.db.backends.mysql',
>
> - ’NAME‘ ：        数据库名字
>
> - ’USER‘：           用户名字
>
> - ’PASSWORD‘：密码
>
> - ’HOST‘：           主机
>
> - ’PORT‘：            端口号    注意：引号加不加“”都可以
>
>   
>
>   ```python
>   注意迁移时驱动问题：
>   1.mysqlclient：python2,3都能直接使用，致命缺点-对mysql安装有要求，必须指定位置存在配置文件
>    2.mysql-python：- python2 支持很好，- python3 不支持。
>    3.pymysql：会伪装成mysqlclient和mysql-python，
>    	-python2，python3都支持init中 
> 		import  pymysql      																	pymysql.install_as_mysqldb()
>   ```

### 2.DML

```
数据操作
	(1)迁移
		生成迁移
			python manage.py makemigrations
		执行迁移
			python manage.py migrate
			才会真正在数据库产生表
	(2)ORM
		Object Relational Mapping 对象关系映射
		将业务逻辑和sql进行了一个解耦合
		通过models定义实现  数据库表的定义
	(3)模型定义
		（1）继承models.Model
		（2）会自动添加主键列
		（3）必须指定字符串类型属性的长度
			class Student(models.Model):
                 name = modes.CharField(max_length=16)
                 age = models.IntegerField(default=1)
	存储数据
		创建对象进行save()
	数据查询
		模型.objects.all()
		模型.objects.get(pk=2)
	更新
		基于查询
		save()
	删除
		基于查询
		delete()
```

### 3.Django Shell

```python
使用：django 终端，python manager.py shell
集成了django环境的python 终端
通常用来调试

from Two.models import Student
students = Student.objects.all()
for student in students:
         print(students.name)
```

### 4.数据级联

```python
一对多模型关系：
	class Grade(models.Model):
      g_name = models.CharField(max_length=32)

    class Student(models.Model):
          s_name =models.CharField(max_length=16)
          s_grade=models.ForeignKey(Grade) 
案例：(1).多方获取一方，根据学生找班级名字
	  显性属性：就是你可以在中直接观察到的属性---》通过多方获取一方  那么可以使用多方调用显性属性直接获取一方数据
      student = Student.objects.get(pk=2)
	  grade = student.s_grade
	  return HttpResponse(grade.g_name)
	 (2).一方获取多方，根据班级  找所有的学生
      隐性属性：就是我们在类中观察不到的，但是可以使用的属性---》通过一方获取多方 那么可以使用一方数据的隐性属性 获取多方数据
	  grade = Grade.objects.get(pk=2)
	  students = grade.sutdent_set.all()
	  content = {
			'students':students
			}
	  return render(request,'students_list.html',content)
	  
```

### 5.元信息

```
class Meta：指定表名和字段名字
     db_table = '表名'
     注意：表的字段一般都是下划线  eg：s_name
           类的属性一般都是驼峰式  eg: sName
```

### 6.定义字段

```
字段类型：CharField，TextField，IntegerField，FloatField，BooleanField，DecimalField，NullBooleanrField，AutoField，FileField，ImageField
字段约束：max_length，default，unique，index，primary_key，db_column
```

### 7.模型过滤（查询）

```python
Django默认通过模型的objects对象实现模型数据查询。
Django有两种过滤器用于筛选记录：
	filter:返回符合筛选条件的数据集
	exclude	:返回不符合筛选条件的数据集
链式调用：
	多个filter和exclude可以连接在一起查询
	Person.objects.filter().filter().xxxx.exclude().exclude().yyyy
	Person.objects.filter(p_age__gt=50).filter(p_age__lt=80)注意数据类型
	Person.objects.exclude(p_age__gt=50)
	Person.objects.filter(p_age__in=[50,60,61])
```

### 8.创建对象的方式

```
创建对象的方式
	（1）创建对象1   常用
		person = Person（）   person.p_name='zs'  person.p_age=18
	（2）创建对象2
		直接实例化对象，设置属性
		创建对象，传入属性
		使用person =  Model.objects.create(p_name='zs',p_age=18)
			person.save()
		自己封装类方法创建
		在Manager中封装方法创建
	（3）创建对象3
		person = Person(p_age=18)
	（4）创建对象4
		注意:__init__已经在父类models.Model中使用，在自定义的模型中无法使用
		在模型类中增加类方法去创建对象
		@classmethod  
        def create(cls,p_name,p_age=100):
                  return cls(p_name=p_name,p_age=p_age)
        person = Person.create('zs')
```

### 9.查询集

```python
概念：查询集表示从数据库获取的对象集合，查询集可以有多个过滤器。
```

```
过滤器：过滤器就是一个函数，基于所给的参数限制查询集结果，返回查询集的方法称为过滤器。
       查询经过过滤器筛选后返回新的查询集，所以可以写成链式调用。
       获取查询结果集  QuerySet
	all
		模型.objects.all()
	filter
		模型.objects.filter()
	exclude
		模型.objects.exclude()
	order_by
		persons= Person.objects.order_by('id')
			默认是根据id排序
			注意要写的是模型的属性
	values
		persons= Person.objects.order_by('id') persons.values()
		注意方法的返回值类型   
	切片
		限制查询集，可以使用下标的方法进行限制
			左闭右开区间
		不支持负数
			下标没有负数
		实际上相当于 limit  offset
		studentList = Student.objects.all()[0:5]  
			第一个参数是offset  第二个参数是limit
	懒查询/缓存集
		查询集的缓存：每个查询集都包含一个缓存，来最小化对数据库的访问
		在新建的查询集中，缓存首次为空，第一次对查询集求值，会发生数据缓存，django会将查询出来的数据做	一个缓存，并返回查询结果，以后的查询直接使用查询集的缓存。
		- 都不会真正的去查询数据库
		
		- 懒查询
        - 只有我们在迭代结果集，或者获取单个对象属性的时候，它才会去查询数据
        - 为了优化我们结果和查询
```

```
获取单个对象：
	get
		不存在会抛异常  DoesNotExist
		存在多于一个 MultipleObjectsReturned
		使用这个函数 记得捕获异常
	last
		返回查询集种的最后一个对象
	first
		需要主动进行排序
		persons=Person.objects.all().first()
	内置函数：框架自己封装得方法 帮助我们来处理业务逻辑
		count
			返回当前查询集中的对象个数
				eg：登陆
		exists
			判断查询集中是否有数据，如果有数据返回True没有反之
```

```
字段查询：
	对sql中where的实现，作为方法filter(),exclude(),get()的参数
	语法:属性名称__比较运算符=值
		Person.objects.filter(p_age__gt=18)
	条件
		属性__操作符=临界值
		gt
			great than
		gte
			great than equals
		lt
			less than
		lte
			less than equals
		gt,gte,lt,lte：大于，大于等于，小于，小于等于filter(sage__gt=30)
		in
			in：是否包含在范围内,filter(pk__in=[2,4,6,8])
				单引号可以使用
		exact*******
			exact：判断，大小写不敏感，filter(isDelete = False)
		startswtith
			类似于 模糊查询 like
		endswith
			以 xx 结束  也是like
		contains
			contains：是否包含，大小写敏感，filter(sname__contains='赵')
		isnull,isnotnull
			isnull,isnotnull：是否为空，filter(sname__isnull=False)
		ignore 忽略大小写
			iexact********************
			icontains
			istartswith
			iendswith
			以上四个在运算符前加上 i(ignore)就不区分大小写了 iexact...
```

```
时间
	models.DateTimeField(auto_now_add=True)
	year
	month 会出现时区问题  需要在settings中的USE-TZ中设置为 False
	day
	week_day
	hour
	minute
	second
	orders = Order.objects.filter(o_time__month=9)
		有坑：时区问题
			关闭django中自定义的时区
				USE-TZ=False
			在数据库中创建对应的时区表
```

```
注意：mysql oracle中所说的聚合函数 多行函数  组函数 都是一个东西  max min avg sum count
聚合函数/组函数/多行函数/高级函数
	模型：
      class Customer(models.Model):
          c_name = models.CharField(max_length=16)
          c_cost = models.IntegerField(default=10)
	使用：
      使用aggregate()函数返回聚合函数的值
      Avg：平均值
      Count：数量
      Max：最大
      Min：最小
      Sum：求和
      eg:Student.objects.aggregate(Max('age'))
```

```
跨关系查询:
	模型：
		class Grade(models.Model):
    		g_name = models.CharField(max_length=16)
        class Student(models.Model):
            s_name = models.CharField(max_length=16)
            s_grade = models.ForeignKey(Grade)
    使用：
        模型类名__属性名__比较运算符，实际上就是处理的数据库中的join
        Grade  ---g_name      Student---》s_name  s_grade（外键)
        gf = Student.objects.filter(name='凤姐')
        print(gf[0].s_grade.name)
        grades = Grade.objects.filter(student__s_name='Jack')
        查询jack所在的班级
```

```
F对象 eg：常适用于表内属性的值的比较
	模型：
		class Company(models.Model):
              c_name = models.CharField(max_length=16)
              c_gril_num = models.IntegerField(default=5)
              c_boy_num = models.IntegerField(default=3)
	F：
		获取字段信息，通常用在模型的自我属性比较，支持算术运算
	eg:男生比女生少的公司
	companies = Company.objects.filter(c_boy_num__lt=F('c_gril_num'))
	eg:女生比男生多15个人
	companies = Company.objects.filter(c_boy_num__lt=F('c_gril_num')-15)
```

```
Q对象 eg：常适用于逻辑运算 与或或
		年龄小于25：
            Student.objects.filter(Q(sage__lt=25))
        eg:男生人数多余5 女生人数多于10个：
             companies = Company.objects.filter(c_boy_num__gt=1).filter(c_gril_num__gt=5)
             companies = Company.objects.filter(Q(c_boy_num__gt=5)|Q(c_gril_num__gt=10))
        支持逻辑运算：
                    与或非
                    &
                    |
                    ~
        年龄大于等于的：
					Student.objects.filter(~Q(sage__lt=25))
```

