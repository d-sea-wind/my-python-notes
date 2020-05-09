 

# Day05

## 学习目标

- 模型迁移问题
- 模型一对一
  - 添加
  - 删除
  - 查询
- 模型一对多
  - 添加
  - 删除
  - 查询
- 模型多对多
  - 添加
  - 删除
  - 查询

## 学习课程

#### 1.Model--》DB

```python
Model -> DB
          迁移步骤
              生成迁移文件  python manage.py makemigrations
              执行迁移文件  python manage.py migrate
            
          迁移文件的生成
              根据models文件生成对应的迁移文件
              根据models和已有迁移文件差别 生成新的迁移文件
                
          迁移原理  了解
              先去迁移记录查找，哪些文件未迁移过
                  app_label + 迁移文件名字
              执行未迁移的文件
              执行完毕，记录执行过的迁移文件
                
          可以指定迁移的app  python manage.py makemigrations app
                            python manage.py migrate    
          重新迁移
              删除迁移文件
                  migrations所涉及的迁移文件
              删除迁移文件产生的表
              删除迁移记录
                  django-migrations
```

#### 2.DB --》 Model

```
DB -> Model
	反向生成到指定得app下 --》  python manager.py inspectdb > App/models.py
	元信息中包含一个属性  managed=False   不支持迁移
	- 如果自己的模型不想被迁移系统管理，也可以使用 managed=False进行声明
```

#### 3.模型关系

##### （1）一对一

```
应用场景
	用于复杂表的拆分
	扩展新功能
	OneToOneField
	确认主从关系，谁声明关系谁就是从表
	底层实现，使用外键实现的，对外键添加了唯一约束
```

```
class Student(models.Model):
    s_name = models.CharField(max_length=32)


class IDCard(models.Model):
    id_num = models.CharField(max_length=18, unique=True)
    id_student = models.OneToOneField(Student, null=True, blank=True, on_delete=models.SET_NULL)
```

###### 添加

```
添加主表数据
          def add_student(request):
              s_name = request.GET.get('name')
              student = Student()
              student.s_name = s_name
              student.save()
              return HttpResponse('添加学生成功')
```

```
添加从表数据
          def add_idcard(request):
              i_card = request.GET.get('card')
              id_card = IdCard()
              id_card.i_card = i_card
              id_card.save()
              return HttpResponse('添加card成功')
```

```
数据绑定
          def bind(request):
              student = Student.objects.last()
              idcard = IdCard.objects.last()
              idcard.i_student = student
              # idcard.i_student = student.id
              idcard.save()
              return HttpResponse('绑定成功')
```

```
思考：
      student是主表  idcard是从表
      1 再添加一个主表数据  然后执行绑定可不可以  可以
      2 再添加一个从表数据  然后执行绑定可不可以  不可以
```

###### 删除

```
主表数据删除/on_delete
                默认  CASECADE
                    默认级联数据被删除
                    从表数据删除，主表不受影响
                    主表数据删除，从表数据直接删除
                models
                    SET_NULL
                        置空
                        前提允许为NULL
                        常用
                    SET_DEFAULT
                        置为默认值
                        前提存在默认值
                    SET
                        自己赋值
                models.PROTECT
                    从表数据受保护的
                    当存在级联数据的时候，删除主表数据，会抛出异常
                    主表不存在级联数据的时候，可以删除
                    开发中为了防止误操作，我们通常会设置为此模式
```

```
django默认是级联删除   删除主表的时候 从表数据都会删除
执行顺序是:从表的数据删除之后  主表的数据跟着删除
      def delete_student(request):
          student = Student.objects.get(pk=1)
          student.delete()
          return HttpResponse('删除成功')
```

```
def delete_idcard(request):
    idcard = IdCard.objects.get(pk=1)
    idcard.delete()
    return HttpResponse('删除成功')
```

```
外键的字段的约束  如果将on_delete修改为models.PROTECT 那么如果有级联关系 删除主表的时候 会抛异常
如果没有级联关系  那么就会直接删除
def deleteprotect_student(request):
    student = Student.objects.get(pk=3)
    student.delete()
    return HttpResponse('删除成功')
```

```
外键的字段的约束  如果将on_delete设置为models.setnull  那么如果有级联关系 会将从表的外键设置为null
主表数据也会删除   如果没有级联关系  会直接删除主表数据
def deletesetnull_student(request):
    student = Student.objects.get(pk=4)
    student.delete()
    return HttpResponse('删除成功')
```

###### 查询

```
查询/获取
	从获取主
		显性属性
			该显性属性会返回一个对象
	主获取从
		隐性属性
		默认就是从表模型名小写
		该表模型名 会返回一个对象
```

```
根据idcard 获取student    显性属性
def get_student(request):
    idcard = IdCard.objects.get(pk=3)
    print(idcard.i_student.s_name)
    return HttpResponse('查询student')
```

```
根据student 获取 idcard
def get_idcard(request):
    student = Student.objects.get(pk=2)
    主查从   获得主表的对象之后 该对象 有一个属性 是隐形属性
    这个属性 是外键那个模型的小写
    print(student.idcard.i_card)
    return HttpResponse('查询idcard')
```

##### (2)一对多

```
class Dept(models.Model):
    d_name = models.CharField(max_length=32,unique=True)

class Emp(models.Model):
    e_name = models.CharField(max_length=32)
    #外键默认不能为空
    e_dept = models.ForeignKey(Dept,null=True,blank=True,on_delete=models.SET_NULL)
```

###### 添加：	

	外键不能为空

```
def add_dept(request):
    d_name = request.GET.get('name')
    dept = Dept()
    dept.d_name = d_name
    dept.save()
    return HttpResponse('插入dept成功')
```

```
def add_emp(request):
    e_name = request.GET.get('name')
    emp = Emp()
    emp.e_name = e_name
    emp.save()
    return HttpResponse('插入emp成功')
```

```
def bind(request):
    dept = Dept.objects.last()
    emp = Emp.objects.last()
    emp.e_dept = dept
    emp.save()
    return HttpResponse('绑定成功')
```

删除：数据删除同一对一一样

	删除主表数据 默认级联从表数据
	修改on_delete属性为models.PROTECT
		有级联数据数据 抛异常
		没有级联数据 可以正常删除
	修改on_delete=models.SET_NULL
		有级联数据 外键值设置为null
		没有级联数据 直接删除
	删除字表数据 不管字表返回得是列表还是单个数据 都可以直接删除  应用场景 多选删除
```
删除默认是级联删除
def deletedept(request):
    dept = Dept.objects.get(pk=2)
    dept.delete()
    return HttpResponse('删除成功')
```

```
删除从表的时候  会将所有符合条件的删除
def deleteemp(request):
    Emp.objects.filter(e_dept_id=1).delete()
    return HttpResponse('删除成功')
```

```
def deleteprotectdept(request):
    dept = Dept.objects.get(pk=3)
    dept.delete()
    return HttpResponse('删除成功')
```

```
def deletesetnulldept(request):
    dept = Dept.objects.get(pk=1)
    dept.delete()
    return HttpResponse('删除成功')
```

查询：级联对象获取

	从获取主
		显性属性
	主获取从
		隐性属性
		默认是 模型小写_set
			该属性得返回值类型是relatedManager类型
			注意relatedManager是一个不可以迭代得对象  所以需要调用Manager得方法
		relatedManager也是Manager的一个子类
			filter
			exclude
			all
			切片
			...
```
def finddept(request):
    emp = Emp.objects.get(pk=7)
    print(emp.e_dept)
    return HttpResponse('查询成功')
```

```
def findemp(request):
    dept = Dept.objects.get(pk=4)
    一对多的时候 如果通过主查从  那么主的对象调用从的模型小写_set   
    xxx_set方法的返回值类型是RelatedManager
    RelatedManager对象可以调用all  fiter exclude。。。。。。
    emps = dept.emp_set
    for emp in emps.all():
        print(emp.e_name)
    return HttpResponse('查询成功')
```

##### （3）多对多

```
ManyToManyField
产生表的时候会产生单独的关系表
关系表中存储关联表的主键，通过多个外键实现的，多个外键联合唯一
会产生额外的关系表
	表中使用多个外键实现
	外键对应关系表的主键
```

```
class Custom(models.Model):
    c_name = models.CharField(max_length=32)

class Goods(models.Model):
    g_name = models.CharField(max_length=32)
    g_custom = models.ManyToManyField(Custom)
```

###### 添加：

	主添加从
		customer.goods_set.add(goods)
			隐性属性
	从添加主
		goods.g_customer.add(customer)
			显性属性
	需要注意的是：关系表中外键的联合唯一
```
def addcustom(request):
    custom = Custom()
    custom.c_name = 'zs1'
    custom.save()
    return HttpResponse('添加成功')
    
def addgoods(request):
    goods = Goods()
    goods.g_name = '小当家1'
    goods.save()
    return HttpResponse('添加成功')
```

```
从 -- 主   从对象.属性.add(主对象)
首先必须有数据才可以插入 该数据必须是查询出来的
def addgoods1(request):
    custom = Custom.objects.get(pk=1)
    goods = Goods.objects.get(pk=1)
    goods.g_custom.add(custom)
    # goods.save() 没有实际作用
    return HttpResponse('添加成功')
```

```
主 -- 从   主对象.从模型名_set.add(从对象)
def addcustom1(request):
    custom = Custom.objects.get(pk=3)
    goods = Goods.objects.get(pk=3)
    custom.goods_set.add(goods)
    return HttpResponse('添加成功')
```

###### 删除：

	goods.g_customer.remove(customer)
		显性属性
	custom.goods_set.remove(goods)
		隐性属性
```
删除  eg：删除用户  那么关系表的数据会不会删除
会删除  默认是级联删除   不建议
def deletecustom(request):
    custom = Custom.objects.get(pk=1)
    custom.delete()
    return HttpResponse('删除成功')
```

```
删除    从 -- 主
def deleterelation(request):
    custom = Custom.objects.get(pk=2)
    goods = Goods.objects.get(pk=2)
    goods.g_custom.remove(custom)
    return HttpResponse('删除成功')
```

```
删除   主 -- 从
def deleterelation1(request):
    custom = Custom.objects.get(pk=3)
    goods = Goods.objects.get(pk=3)
    custom.goods_set.remove(goods)
    return HttpResponse('删除成功')
```

###### 查询：

	customer.goods_set.all()

```
从 -- 主  显性属性
def findrelation(request):
    goods = Goods.objects.get(pk=3)
    gs = goods.g_custom.all()
    print(gs)
    return HttpResponse('查询成功')
```

```
def findrelation1(request):
    custom = Custom.objects.get(pk=3)
    print(custom.goods_set.all())
    return HttpResponse('查询成功')
```

www.pythontutor.com/visualize.html#mode=display