# Celery框架

 启动celery 服务：

　　celery -A tasks worker --loglevel=info



需要放到celery中的异步任务一般都是比较耗时的任务

```
import time
from celery import Celery
broker='redis://127.0.0.1:6379/0'
backend='redis://127.0.0.1:6379/0'
app=Celery('my_task',broker=broker,backend=backend)

@app.task             #celery自己定义好的异步装饰器
def add(x,y):
	time.sleep(5)
	return x,y

task为需要运行的py模块    -A为一些异步的东西
celery worker -A task --loglevel==info


函数名.delay(参数)
r=add.delay(77,99)

r.result                 获取结果
```



Celery 异步任务工作流程: Django -> Broker(Redis) <- Celery -> Backend(redis) <-Django



其他Celery的应用场景

1.视频截图             做直播的时候需要每隔20s把图片截下来传到公安局

2.图片剪裁、压缩      用户上传的经常是比较大的文件，实际上你传到微信的所有图片都是有压缩的，原图除外

3.数据库异步存储           以前叫异步洗      先在保存到数据库都是save或者update一下，但是实际上线上那么大流量高并发的情况下，如果你都是实时写入数据库的话，这里一调用接口，用户会等待很多时间， 以前利用缓存   ，所有数据先写缓存，只要缓存有了，这个接口就可以给用户返回，然后通过celery把缓存中的数据保存到数据库中，可以极大的节省数据库保存时的时间消耗。

4.发邮件，发短信

5.耗时的地方，关键是还不需要用户等待的时候，就可以用celery







## celery如何与Django结合

```
mkdir tasks

touch tasks/__init__.py

touch tasks/config.py

#tasks下的
#init.py模块中

import os
from celery import Celery
from tasks import config

os.environ.setdefault('DJANGO_SETTINGSS_MODULE','swiper.settings') #django环境变																			量

celery_app=Celery('async_tasks')
celery_app.config_from_object(config)
celery_app.autodiscover_tasks()

django#     logics.py中

from tasks import celery_app

@celery_app.task            
def upload_avatar(uid, avatar_file):            #上传图片，头像
    filename, filepath = save_avatar(uid, avatar_file)  # 文件保存到本地
    avatar_url = upload_to_qiniu(filename, filepath)  # 文件上传到七牛云
    User.objects.filter(id=uid).update(avatar=avatar_url)  # 保存 URL
    os.remove(filepath)  # 删除本地临时文件

#django  apis中

def upload_avatar(request):
    '''
    头像上传
    1. 保存到本地
    2. 上传到七牛云
    3. 保存 URL
    4. 删除本地文件
    '''
    avatar_file = request.FILES.get('avatar')
    logics.upload_avatar.delay(request.uid, avatar_file)   #需要celery的delay
    return render_json()

#运行celery    app在哪就运行谁



celery  worker -A tasks --loglevel=info

```

### config.py配置

```
broker_url = 'redis://127.0.0.1:6379/5'          5为数据库
broker_pool_limit = 10                           # Borker 连接池, 默认是10

timezone = 'Asia/Shanghai'	
accept_content = ['pickle', 'json']             #数据序列化可选类型，pickle和json
task_serializer = 'pickle'						#pickle

result_backend = 'redis://127.0.0.1:6379/5'

result_serializer = 'pickle'          #为什么要使用pickle或者json，因为有三个系统需要数据交互，django、celery、redis，他要在三者间传递数据，而redis不能识别python的object，所以在传输的时候数据需要转换为中间状态，即字符串状态


result_cache_max = 10000  # 任务结果最大缓存数量 如果超出10000个，前面的会被后面的顶掉
result_expires = 3600  # 任务结果过期时间

worker_redirect_stdouts_level = 'INFO'
~

```

### pickle

```
from pickle import  dumps，loads

k=[1,2,3,4,5,6,7,8,1]

dumps(k)				可以把python的一个对象序列化为一个用来做传输啊什么什么的东西
b'....'                  将k变为二进制数据

n=loads(b'....' )        把k还原成原来的数据
```



### django manage

```
os.environ....                    环境变量加载settings，需要与django对接需要先在									  django中设置DJANGO_SETTINGS_MODULE	



```

### WSGI

web server  gateway interface

web服务器网关接口





















































