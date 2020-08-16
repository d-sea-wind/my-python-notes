## Day03

### 学习目标

- 项目拆分
- flask-migrate
- DML
  - 增
  - 删
  - 改
- DQL
  - 查
    - 获取单个数据
    - 获取结果集
    - 数据筛选
    - 分页
    - 逻辑运算
- 数据定义
- 模型关系
  - 一对多
  - 一对一
  - 多对多

### 学习课程

#### 1.项目拆分

```
	（1）开发环境
                开发环境
                测试环境
                演示环境-类似线上环境也叫做预生产环境
                线上环境 也叫做 生产环境
	（2）拆分项目
                规划项目结构
                    manager.py
                        app的创建
                        Manager （flask-script管理对象）
                    App
                        __init__
                            创建Flask对象
                            加载settings文件
                            调用init_ext方法
                            调用init_blue方法
                        settings
                            App运行的环境配置
                            运行环境
                        ext（扩展的，额外的）
                            用来初始化第三方的各种插件
                            Sqlalchemy对象初始化 数据库
                            Session初始化
                        views
                            蓝图
                            创建
                            注册到app上
                        models
                            定义模型
```

#### 2.flask-migrate

```
使用步骤
        （1）安装
            	pip install flask-migrate
        （2）初始化
                1.创建migrate对象
                  需要将app 和 db初始化  	ext
                       migrate = Migrate()
                       migrate.init_app(app=app, db=db)
                2.懒加载初始化
                  结合flask-script使用
                  在manage上添加command (MigrateCommand)
                       manager.add_command("db", MigrateCommand)
        （3）python manager.py db xxx
                1.init     第一次使用
                2.migrate  生成迁移文件
                           不能生成有2种情况
                                （1）模型定义完成从未调用
                                （2）数据库已经有模型记录
                3.upgrade  升级
                4.downgrade 降级
          扩展：
                创建用户文件
                    python manager.py db migrate  --message ‘创建用户’
```

#### 3.DML

```
1.增
	创建对象
		（1）添加一个对象
                  db.session.add()
                         eg:
                         @blue.route("/addperson/")
                          def add_person():
                              p = Person()
                              p.p_name = "小明"
                              p.p_age = 15
                              db.session.add(p)
                              db.session.commit()
                              return "添加成功"
         （2）添加多个对象
                  db.session.add_all()
                          eg:
                          @blue.route("/addpersons/")
                          def app_persons():
                              persons = []
                              for i in range(5):
                                  p = Person()
                                  p.p_name = "猴子请来的救兵%d" % random.randrange(100)
                                  p.p_age = random.randrange(70)
                                  persons.append(p)
                              db.session.add_all(persons)
                              db.session.commit()
                              return "添加成功"
```

```
2.删除
	db.session.delete(对象)
		基于查询
```

```
3.修改
	db.session.add(对象)
		基于查询
```

##### 查

```
1.获取单个数据
	（1）get
            主键值
            获取不到不会抛错
            person = Person.query.get(3)
            db.session.delete(person)
            db.session.commit()
	（2）first
		   person = Person.query.first()
```

```
2.获取结果集
	（1）xxx.query.all
			persons = Person.query.all()
			返回的是列表的类型
	（2）xxx.query.filter_by
			persons = Person.query.filter_by(p_age=15)
			返回的是BaseQuery对象
	（3）xxx.query.filter
			persons = Person.query.filter(Person.p_age < 18)
			persons = Person.query.filter(Person.p_age.__le__(15))
			persons = Person.query.filter(Person.p_name.startswith("小"))
			persons = Person.query.filter(Person.p_name.endswith("1"))
			persons = Person.query.filter(Person.p_name.contains("1"))
			persons = Person.query.filter(Person.p_age.in_([15, 11]))
```

```
3.数据筛选
# select from where group by hanving order_by
	（1）order_by
			persons = Person.query.order_by("-p_age")
			降序：
				persons = Person.query.order_by(db.desc("p_age"))
	（2）limit
			persons = Person.query.limit(5)
	（3）offset
			persons = Person.query.offset(5).order_by("-id")
	（4）offset和limit不区分顺序，offset先生效
			persons = Person.query.order_by("id").limit(5).offset(5)
			persons = Person.query.order_by("id").limit(5)
		 	persons = Person.query.order_by("id").offset(17).limit(5)
	（5）order_by 需要先调用执行
		 	persons = Person.query.order_by("id").offset(17).limit(5)
```

```
4.pagination
	（1）简介：分页器
              需要想要的页码
              每一页显示多少数据
	（2）原生：
		 	 persons = Person.query.offset((page_num - 1) * page_per).limit(page_per)
	（3）封装：
          	 参数（page，page_per,False(是否抛异常）
         	 persons = Person.query.paginate(page_num, page_per, False).items
```

```
5.逻辑运算
	（1）与
		    and_     filter(and_(条件))
			huochelist = kaihuoche.query.filter(and_(kaihuoche.id == 1,kaihuoche.name == 'lc'))

	（2）或
			or_          filter(or_(条件))
			huochelist = kaihuoche.query.filter(or_(kaihuoche.id == 1,kaihuoche.name =='lc'))

	（3）非
			not_         filter(not_(条件))  注意条件只能有一个，导包导sqlalchemy
			huochelist = kaihuoche.query.filter(not_(kaihuoche.id == 1))

	（4）in
		    huochelist = kaihuoche.query.filter(kaihuoche.id.in_([1,2,4]))

```

#### 4.数据定义

```
	（1）字段类型
                Integer
                String
                Date
                Boolean
	（2）约束
		primary_key   （主键）   			
		autoincrement （主键自增长）     			
		unique        （唯一） 			
		default       （默认）   			
		index         （索引）    			
		no't'null     （非空）			
		ForeignKey    （外键）                       
                        用来约束级联数据
                        db.Column( db.Integer, db.ForeignKey(xxx.id) )
                        使用relationship实现级联数据获取
                            声明级联数据
                            backref="表名"
                            lazy=True
```

#### 5.模型关系

##### 1.一对多

```
（1）模型定义
          class Parent(db.Model):
              id=db.Column(db.Integer,primary_key=True,autoincrement=True)
              name=db.Column(db.String(30),unique=True)
              children=db.relationship("Child",backref="parent",lazy=True)
              def __init__(self):
                  name=self.name

          class Child(db.Model):
              id = db.Column(db.Integer, primary_key=True)
              name = db.Column(db.String(30), unique=True)
              parent_id = db.Column(db.Integer, db.ForeignKey('parent.id'))
              def __init__(self):
                  name = self.name
```

```
 （2）参数介绍:
 		 1.relationship函数
                    sqlalchemy对关系之间提供的一种便利的调用方式，关联不同的表；
          2.backref参数
                    对关系提供反向引用的声明，在Address类上声明新属性的简单方法，之后可以在my_address.person来获取这个地址的person；
          3.lazy参数
                    （1）'select'（默认值）
                        SQLAlchemy 会在使用一个标准 select 语句时一次性加载数据；
                    （2）'joined'
                        让 SQLAlchemy 当父级使用 JOIN 语句是，在相同的查询中加载关系；
                    （3）'subquery'
                        类似 'joined' ，但是 SQLAlchemy 会使用子查询；
                    （4）'dynamic'：
                        SQLAlchemy 会返回一个查询对象，在加载这些条目时才进行加载数据，大批量数据查询处理时推荐使用。
          4.ForeignKey参数
                    代表一种关联字段，将两张表进行关联的方式，表示一个person的外键，设定上必须要能在父表中找到对应的id值
```

```
（3）模型的应用
            添加
                eg：@blue.route('/add/')
                    def add():
                        p = Parent()
                        p.name = '张三'
                        c = Child()
                        c.name = '张四'
                        c1 = Child()
                        c1.name = '王五'
                        p.children = [c,c1]

                        db.session.add(p)
                        db.session.commit()

                        return 'add success'
            查
                  eg:
                  主查从 --》 Parent--》Child
                  @blue.route('/getChild/')
                  def getChild():
                      clist = Child.query.filter(Parent.id == 1)
                      for c in clist:
                          print(c.name)
                      return 'welcome to red remonce'
                  从查主
                  @blue.route('/getParent/')
                  def getParent():
                      p = Parent.query.filter(Child.id == 2)
                      print(type(p))
                      print(p[0].name)
                      return '开洗'
```

##### 2.一对一

```
   一对一需要设置relationship中的uselist=Flase，其他数据库操作一样。
```

##### 3.多对多

```
（1）模型定义
          class User(db.Model):
              id = db.Column(db.Integer,primary_key=True,autoincrement=True)
              name = db.Column(db.String(32))
              age = db.Column(db.Integer,default=18)

          class Movie(db.Model):
              id = db.Column(db.Integer,primary_key=True,autoincrement=True)
              name = db.Column(db.String(32))

          class Collection(db.Model):
              id = db.Column(db.Integer,primary_key=True,autoincrement=True)
              u_id = db.Column(db.Integer,db.ForeignKey(User.id))
              m_id = db.Column(db.Integer,db.ForeignKey(Movie.id))
```

```
（2）应用场景
          购物车添加
              @blue.route('/getcollection/')
              def getcollection():
                    u_id = int(request.args.get('u_id'))
                    m_id = int(request.args.get('m_id'))
                    c = Collection.query.filter(Collection.u_id == u_id).filter_by(m_id = m_id)

                    if c.count() > 0:
                        print(c.first().u_id,c.first().m_id)
                        # print(c)
                        # print(type(c))
                        # print('i am if')
                        return '已经添加到了购物车中'
                    else:
                        c1 = Collection()
                        c1.u_id = u_id
                        c1.m_id = m_id
                        db.session.add(c1)
                        db.session.commit()
                        return 'ok'
```

