# Day15

## 学习目标

- FBV   前后端分离源码
  - 需要判断请求方式
  - 序列化，反序列化难度大
- CBV  django的前后端分离
  - 不需要判断请求方式
  - 序列化，反序列化难度大
- DRF  djangorestframework
  - 解决序列化，反序列化问题
- FBV+DRF
  - 需要判断请求方式
  - 序列化，反序列化问题解决
- CBV+DRF
  - 不需要判断请求方式
  - 序列化，反序列化问题解决

## 学习课程

#### 1.FBV

```
概念：基于函数的视图函数。（function base view）
使用结构：
		if request.method == 'GET':
			pass
		if request.method == 'POST':
			pass
		if request.method == 'DELETE':
			pass
		if request.method == 'PUT':
			pass	
		if request.method == 'PATCH':
			pass
注意：请求方式必须大写
总结：- 需要判断请求方式
	 - 序列化，反序列化难度大
```

#### 2.CBV

###### （1）view

```
概念：基于类的视图函数。（class base view）
使用步骤：
	①继承自系统的类视图
		class HelloCBV(View)
	②书写请求方式对应的函数， 函数名就是请求方式名字的小写
		注意只能小写
		方法中的参数必须书写request
	③：注册路由  views.类视图.as_view()
		url（r'^index/',views.类名.as_view(),name='index'）
		url(r'^hello/',views.HelloCBV.as_view(),name='hello')
	    注意：as_view默认情况下没有（）  需要手动添加
总结：- 不需要判断请求方式
	 - 序列化，反序列化难度大
```

（2）TemplateView

```
作用：执行类视图然后跳转到指定模板。
TemplateView
	继承TemplateView
			不需要写get方法  因为TemplateView里重写了get方法
	实现方法1  
		在as_view中书写tempate_name属性
		eg:
url(r'^template/', views.HelloTemplateView.as_view(template_name='hello.html'), name='template')
	实现方法2
		在类视图中指定 template_name='hello.html'
		eg：
url(r'^template/', views.HelloTemplateView.as_view(), name='template')
实现原理：
		TemplateView继承了TemplateResponseMixin, ContextMixin, View
		TemplateView类中定义了get方法，该方法调用了TemplateResponseMixin的render_to_response方法
应用场景：单纯的跳转页面 eg：跳转到登陆页面
```

（3）ListView

```
作用：执行类视图然后跳转到指定模板并且传递数据
ListView
	属性
		template_name
		model=模型
		queryset=模型.object.all()
		必须要写model或者queryset写一个
	渲染在模板上
		object_list
		模型_list
	实现原理：
			负责跳转页面
                  ListView继承了MultipleObjectTemplateResponseMixin，
                  MultipleObjectTemplateResponseMixin继承了TemplateResponseMixin，
                  在TemplateResponseMixin中有render_to_response方法
			负责传递参数
                  ListView继承了BaseListView，
                  BaseListView继承了MultipleObjectMixin，
                  MultipleObjectMixin中有model和queryset的属性和get_queryset方法
应用场景：查询 eg：list  分页
```

（4）DetailView

```
作用：执行类视图跳转到指定模板，传递一个数据
DetailView
	渲染在模板上
	template_name
	数据
		model
			model=Animal
		queryset
			queryset = Animal.objects.all()
	单一实例
		pk
			url(r'^single/(?P<pk>\d+)/', views.HeDetailView.as_view(), name='single')
	实现原理：
            负责跳转页面
                  DetailView继承了SingleObjectTemplateResponseMixin，
                  SingleObjectTemplateResponseMixin继承了TemplateResponseMixin，
                  TemplateResponseMixin有一个render_to_response方法
            负责传递参数
            	 DetailView继承了BaseDetailView，
                 BaseDetailView继承了SingleObjectMixin，
                 SingleObjectMixin中有model，queryset，get_queryset方法
	应用场景：修改 点击修改的时候 然后传递id参数 获取到对象 在表单中遍历
```

总结：

​	view适用于前后端分离，方法返回的是json数据              eg:changexxx

​	TemplateView，ListView,DetailView适用全栈开发，

​	TemplateView：跳转页面                           				eg：toLogin

​	ListView：跳转页面，传递数据                  				eg:xxxList

 	DetailView：跳转页面，传递单个数据      				eg:loadxxx

#### 3.Drf

```
实现步骤：
	（1）pip install djangorestframework

    （2）项目 tutorial
    		app quickstart
                  serializers  序列化
                          class UserSerializer(serializers.HyperlinkedModelSerializer):
                              class Meta:
                                  model = User
                                  fields = ['url', 'username', 'email', 'groups']


                          class GroupSerializer(serializers.HyperlinkedModelSerializer):
                              class Meta:
                                  model = Group
                                  fields = ['url', 'name']
    （3） views.py
                    class UserViewSet(viewsets.ModelViewSet):
                        queryset = User.objects.all().order_by('-date_joined')
                        serializer_class = UserSerializer


                    class GroupViewSet(viewsets.ModelViewSet):
                        queryset = Group.objects.all()
                        serializer_class = GroupSerializer

    （4）根路由urls.py
                    router = routers.DefaultRouter()
                    router.register(r'users', views.UserViewSet)
                    router.register(r'groups', views.GroupViewSet)

                    urlpatterns = [
                        url('', include(router.urls)),
                        url('api-auth/', include('rest_framework.urls', namespace='rest_framework'))
            ]
    （5）settings
                    INSTALLED_APPS = [
                        ...
                        'rest_framework',
                    ]
```

#### 4.FBV+DRF

```
实现步骤：
	（1）在app中创建serializers文件 序列化器
                class BookSerializer(serializers.Serializer):
                        id = serializers.IntegerField()
                        b_name = serializers.CharField()
                        b_price = serializers.FloatField()

                def update(self, instance, validated_data):
                    instance.id = validated_data.get('id',instance.id)
                    instance.b_name = validated_data.get('b_name',instance.b_name)
                    instance.b_price = validated_data.get('b_price',instance.b_price)

                    instance.save()
                    return instance

                def create(self, validated_data):
                    return Book.objects.create(**validated_data)
    （2）创建序列化器对象
    		  bookserializer = BookSerializer(序列化对象)
    		  bookserializer.data
```

#### 5.CBV+DRF

```
实现步骤：
	（1）class GameSerializer(serializers.ModelSerializer):
            class Meta:
                model = Game
                fields = ['id','g_name']
         继承serializers.ModelSerializer
         元信息
         		model=序列化的模型类
         		fields=[序列化的字段]
     （2）创建序列化器对象
    		  gameserializer = GameSerializer(序列化对象)
    		  gameserializer.data
    		  
 注意：序列化器默认序列化一个对象 会报错  解决方案：在序列化器实例化的时候添加参数many=True
 	  如果报错safe问题 那么需要在JsonResponse中添加参数safe=False
 	  乱码问题：JsonResponse中添加参数json_dumps_params={'ensure_ascii':False}
```

