#### 1.DjangoDebugToolbar

```
Django调试工具
	1. pip install django-debug-toolbar
	2. install_app
		   debug_toolbar
	3.在主路由下的urls文件中添加
          if settings.DEBUG:
              import debug_toolbar
              urlpatterns = [
                  #path('__debug__/', include(debug_toolbar.urls)),

                  # For django versions before 2.0:
                  url(r'^__debug__/', include(debug_toolbar.urls)),

              ] + urlpatterns
		注意由版本要求
	4.在中间件中添加一个数据
		 'debug_toolbar.middleware.DebugToolbarMiddleware',
	5.settings
		INTERNAL_IPS=('127.0.0.1')
		注意：不能书写localhost
```

```
是在页面中动态注入一个控制面板
                      版本信息
                      设置环境信息
                      请求信息
                      响应信息
                      SQL执行信息
                      中断重定向
                      模板信息
                      静态资源
                      log日志
                      信号信息
```

