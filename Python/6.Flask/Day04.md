## Day04

### 学习目标

- 分页器的相关方法
- flask-bootstrap
- flask-debugtoolbar
- flask-cache
- 勾子
- 四大内置对象
- 扩展-路径问题
- Json数据

### 学习课件

#### 1.分页器方法

```
分页器
	模型.query.paginate() 方法的返回值类型是Pagination
		page
		per_page
		False
	Pagination的属性
		items         （遍历数据）
		pages         （获取总页数）
		prev_num      （上一页的页码）
		has_prev      （是否有上一页）
		next_num      （下一个页码）
		has_next	  （是否有下一页）
		iter_pages     (上一页和下一页之间的页码)
```

#### 2.flask-bootstrap

```
插件安装
	pip install  flask-bootstrap
ext中初始化
	Bootstrap（app=app）
	
bootstrap案例--bootstrap模板   {% extends ‘bootstrap/base.html’%}
```

#### 3.flask-debugtoolbar

```
辅助调试插件
安装
	pip install flask-debugtoolbar
初始化  ext 
    app.debug = True (最新版本需要添加)
	debugtoolbar = DebugToolBarExtension()
	debugtoolbar.init_app(app=app)
```

#### 4.缓存flask-cache

```
1 缓存目的：
          缓存优化加载，减少数据库的IO操作
2 实现方案
          （1）数据库
          （2）文件
          （3）内存
          （4）内存中的数据库 Redis  最优策略
3 实现流程
          （1）从路由函数进入程序
          （2）路由函数到视图函数
          （3）视图函数去缓存中查找
          （4）缓存中找到，直接进行数据返回
          （5）如果没找到，去数据库中查找
          （6）查找到之后，添加到缓存中
          （7）返回到页面上
4 使用
          （1）安装 flask-cache
				pip  install flask-cache
		 （2）初始化
                 指定使用的缓存方案
                      cache = Cache(config={'CACHE_TYPE':默认是simple/'redis'})
                      cache.init_app(app=app)
          （3）用法
                  ①：装饰器
                      @cache.cached(timeout=xxx)
                      注意：装饰器必须放在视图函数路由的下面
                      eg：
                      	@blue.route('/helloCache/')
                        @cache.cached(timeout=30)
                        def helloCache():
                            print('这么多年总算看到了秋天')
                            return 'helloCache'
                  ②：原生
                      get
                      set
```

#### 5.钩子

```
@blue.before_request
eg:
	  @blue.before_request
      def aop():
         print('i am aop simida')

      @blue.route('/add/')
      def add():
          print('i am add')
          return 'add'

      @blue.route('/delete/')
      def delete():
          print('i am delete')
          return 'delete'
```

#### 6.四大内置对象

```
	(1)request
			 请求的所有信息
	(2)session
			 服务端会话技术的接口
	(3)config
              概念：当前项目的配置信息
              (1)模板中可以直接使用
                  config
                    eg:
                    {% for c in config %}
                      <li>{{ c|lower }}</li>
                    {% endfor %}
    		
              (2)在python代码中
                  current_app.config
              	  eg:
                  for c in current_app.config:
                      print(c)
	(4)g
              global  全局
              可以帮助开发者实现跨函数传递数据
              eg:
                  @blue.route('/g/')
                  def g():
                      g.ip = request.remote_addr
                      return 'ok'

                  @blue.route('/testg1/')
                  def testg1():
                      print(g.ip)
                      return 'ok1'
```

#### 7.路径

```
	BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
	init中app = Flask（__name__,static_folder=static_folder）
		 static_folder=os.path.join(settings.BASE_DIR,'static')
```

#### 8.前后端分离

```
整合网络和软件的一种架构模式
理解
	Representtational
		表现层
	State Transfer
		状态转换
	表现层状态转换
		资源（Resource）
	每一个URI代表一类资源
		对整个数据的操作
		增删改查
RESTful中更推荐使用HTTP的请求谓词（动词）来作为动作标识
	GET
	POST
	PUT
	DELETE
	PATCH
推荐使用json数据传输
```

#### 9.前后端分离-原生实现

概念：

```
概念：就是判断不同的请求方式，实现请求方法
高内聚，低耦合
	高内聚
	相同的数据操作封装在一起
	低耦合
MVC 没有模板--前后端分离
```

get：

```
get
		坑---注意：判断请求方式的时候，请求方式必须大写
		eg：
		@blue.route("/users/<int:id>/", methods=["GET", "POST", "PUT", "DELETE", "PATCH"])
        def users(id):
            if request.method == "GET":
                page = int(request.args.get("page", default=1))
                per_page = int(request.args.get("per_page", default=3))

                users = User.query.paginate(page=page, per_page=per_page, error_out=False).items
                users_dict = []
                for user in users:
                    users_dict.append(user.to_dict())

                data = {
                    "message": "ok",
                    "status": "200",
                    "data": users_dict
                }

                return jsonify(data)
```

post：

```
post
		eg:
            elif request.method == "POST":
                  # 更新或创建
                  username = request.form.get("username")
                  password = request.form.get("password")

                  data = {
                      "message": "ok",
                      "status": "422"
                  }

                  if not username or not password:
                      data["message"] = "参数不正确"
                      return jsonify(data), 422

                  user = User()
                  user.u_name = username
                  user.u_password = generate_password(password=password)

                  try:

                      db.session.add(user)
                      db.session.commit()
                      data["status"] = "201"
                  except Exception as e:
                      data["status"] = "901"
                      data["message"] = str(e)
                      return jsonify(data), 422

                  return jsonify(data), 201
```

put:

```
put
		eg:
			elif request.method == "PUT":
                      username = request.form.get("username")
                      password = request.form.get("password")
                      user = User.query.get(id)

                      user.u_name = username
                      user.u_password = generate_password(password)

                      db.session.add(user)
                      db.session.commit()

                      data = {
                          "message": "update success",
                      }

                      return jsonify(data), 201
```

delete:

```
delete
		eg:
		    elif request.method == "DELETE":
                    user = User.query.get(id)

                    data = {
                        "message": "delete success"
                    }

                    if user:
                        db.session.delete(user)
                        db.session.commit()
                        return jsonify(data), 204
                    else:
                        data["message"] = "指定数据不存在"
                        return jsonify(data)
```

patch:

```

	patch
			eg:
			   elif request.method == "PATCH":
                        password = request.form.get("password")
                        user = User.query.get(id)
                        user.u_password = generate_password(password)

                        data = {
                            "messgage": "update success"
                        }

                        db.session.add(user)
                        db.session.commit()

                        return jsonify(data), 201
```

#### 10.flask-restful

```
框架简化开发
```

##### 使用

```
	（1）安装 
			 pip install flask-restful
	
	（2）初始化 
              创建urls文件
                    1.api = Api()

                    2.def init_urls(app):
                           api.init_app(app=app)
                           注意：在init中调用init_urls

                    3.api.add_resource(Hello, "/hello/")
                           注意：Hello是一个类的名字  hello是路由
              
	（3）apis--基本用法
			创建apis文件夹
                    1.继承自Resource
                          class Hello(Resource):
                    2.实现请求方法对应函数
                          def get(self):
                              return {"msg": "ok"}

                          def post(self):
                              return {"msg": "create success"}
                
     （4）乱码问题：init中app.config['JSON_AS_ASCII'] = False
```

##### 定制输入输出

（1）结构化输出：按照指定的格式输出数据

```
1.@marshal_with()基本使用1
 案例：
                  r1fields={
                      'msg':fields.String(),
                      'resultCode':fields.Integer
                      'resultValue':fields.String(default='dddd'),
                      'status':fields.String(attribute='xxx')
                  }
             
                  @marshal_with(r1fields)
                  def get(self):
                      data = {
                          'msg':'ok',
                          'status':'200',
                          'xxx':'xxx',
                      }
                      return data
 总结：(1)默认返回的数据如果在预定义结构中不存在，数据会被自动过滤
	  (2)如果返回的数据在预定义的结构中存在，数据会正常返回
	  (3)如果返回的数据比预定义结构中的字段少，预定义的字段会呈现一个默认值
                       如果类型是Integer  那么默认值是  0
                       如果类型是String  那么默认值是null
 	 （4）fields后面的类型 可以加（） 可以不加（）
```

说明：

1. fields中的类型约束

   ​	（1）String

   ​	（2）Integer

   ​	（3）Nested    嵌套

   ​	（4）List

2. fields的约束

   ​         （1）attribute(指定连接对应名字)

   ​				attribute=名字

   ​         （2）default(设置默认值)

   ​				default=404

```
2.@marshal_with()基本使用2
案例：
				r1fields = {
                      'msg': fields.String(),
                      'resultCode': fields.Integer,
                  }

                  class Cat4Resource(Resource):

                      def get(self):
                          data = {
                              'msg':'ok',
                              'status':'200'
                          }
                          return marshal(data=data,fields=r1fields)
```

```
3.@marshal_with返回一个类对象
案例：
				catfields = {
                      'id':fields.Integer,
                      'name':fields.String,
                      'color':fields.String
                  }

                  r1fields = {
                      'msg':fields.String,
                      'cat':fields.Nested(catfields)
                  }

                  class CatResource(Resource):
                      @marshal_with(r1fields)
                      def get(self):
                          cat = Cat.query.first()
                          data = {
                              'msg':'ok',
                              'cat':cat
                          }
                          return data
```

```
4.@marshal_with返回一个列表
案例：			
				catfields = {
                      'id':fields.Integer,
                      'name':fields.String,
                      'color':fields.String,
                  }

                  r1fields = {
                      'msg':fields.String,
                      'cats':fields.List(fields.Nested(catfields))
                  }

                  class CatResource(Resource):
                      def get(self):
                          cats = Cat.query.all()
                          data = {
                              'msg':'ok',
                              'cats':cats
                          }

                          return marshal(data=data,fields=r1fields)
```

（2）结构化输入

```
 1.使用步骤：  
 		（1）parser=reqparse.RequestParser()
				
	    （2）parser.add_argument("c_name", type=str,required=True, help="c_name必须填写"）	
             parser.add_argument(name="id", type=int, required=True, help="id必须填写")
        		 	 
		（3）parse = parser.parse_args()
				
		（4）cat_name = parse.get("c_name")
        	 id = parse.get("id")
         	 print(id)
         	 
  总结: 
  		name 		获取请求的参数名字
  		type 		请求参数的类型
  		required     必须填写
  		help         如果没有填写报错  
```

