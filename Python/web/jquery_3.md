# jquery_3

# 一.each方法

主要功能：遍历jQuery对象

基本语法：

```javascript
jQuery对象.each(callback);

参数说明：

each方法非常简单，只有一个参数callback，其是一个函数，结构如下：

function callback(i,item){

	//Javascript代码

}
```



参数说明：

```
i：每次遍历时，系统会自动将循环下标放入变量i中

item ：每次遍历时，系统会自动将遍历得到的值（dom对象）放入item选项中，

jQuery对象本质是一个DOM对象集合的数据，所以遍历时每个遍历对象都是一个DOM对象，所以item也是一个DOM对象，如果想使用jQuery中属性或方法，需要通过$符号进行封装。
```

## 课堂案例:循环给img添加属性样式

```html
<script type="text/javascript">
			$(function(){
			        $("input[type=button]").click(function(){
			                $("img").each(function(i,item){
			                        $(item).attr('src','image/image_'+(i+1)+'.jpg');
			                        $(item).css('width','300px');
			                });
			        });    
			});
</script>

<body>
      <input type="button" value="给img赋值"/><br/>
      <img />
      <img />
      <img />
      <img />
      <img />
      <img />
</body>
```

# 一、ajax的简介

## 1、什么是ajax

> Asynchronous ：异步

`asyncio`

> JavaScript ：Javascript技术



> And ：和



> XML ：xml

是一种在页面没有刷新的情况下，通过客户端（浏览器）与服务器交互的一种技术。

ajax语言的载体是javascript,最大特点,页面不刷新完成请求。

```python
python和php
1.php是nginx和apache服务器自带的环境php不需要安装
2.php下载好以后,内部自带微型服务器编码(tcp,自带模板)
3.python需要被安装,python的tcp需要自己去封装,还需要封装模板
4.每一个框架中自带一个微型服务器.
```



##### 比如说豆瓣网的电影内容加载

```javascript
https://movie.douban.com/j/search_subjects?type=movie&tag=%E7%83%AD%E9%97%A8&sort=recommend&page_limit=20&page_start=20
```



 ![image_1](images\image_1.png)



## 2、ajax的起源

1998年微软IE5.5浏览器中应用此技术（Outlook小组研发），当时名称为“XMLHTTP”

2005年Google公司真正把Ajax技术应用在Web网页中（Google Map、Google Gmail） 

从此由于ajax的出现，javascript语言被重视。

### 3、原生JS的ajax写法

```
基于IE内核的浏览器（IE8以下版本） 
var  xhr = new ActiveXObject(‘Microsoft.XMLHTTP’);
基于W3C内核的浏览器（IE8以上内核,以及谷歌,火狐,等）
var  xhr = new XMLHttpRequest(); 
```

```html
<script type="text/javascript">
window.onload=function(){
        var obtn = document.getElementById('one');
        //给按钮绑定事件，向服务器端请求数据
        obtn.onclick=function(){
                //具体的请求步骤
                //(1)创建一个ajax对象，
                var xhr = new XMLHttpRequest();
                //(2)设置监听事件，处理回调函数
                xhr.onreadystatechange = function(){
                        //(5)完成请求后的处理
                         if(xhr.readyState==4){
                                var res = xhr.responseText;//返回的数据结果
                                console.log(res);
                         }
                }
                //(3)创建一个http的请求
                xhr.open('get','demo1.php');
                //(4)发送请求
                xhr.send(null);
        }
}
</script>

<style type="text/css">
</style>
</head>
    <body>
    <input type="button" value="获取数据服务器端的数据" id="one" />
    </body>
```

###### demo1.php

```php
<?php
	
	$arr = [
		['name'=>'tom','age'=>18,'sex'=>'male'],
		['name'=>'jack','age'=>19,'sex'=>'male'],
		['name'=>'berry','age'=>20,'sex'=>'female'],
	];
	echo json_encode($arr);
?>
```

# 二、Jquery中的Ajax

## 1、Jquery中的Ajax引用

```html
1）Ajax的底层实现
jQuery.ajax(options) 
$.ajax(); 
2）Ajax的高级实现
$.get(url,[data],[callback]) 
$.post(url,[data],[callback]) 
```

### 2、Ajax的实现

```javascript
基本语法：jQuery.ajax(options)或$.ajax(options) 
参数：options是一个json对象。
参数说明：
ajax方法只有一个参数，要求是一个json对象
async：是否异步，默认其值为true 
cache ：是否缓存，默认其值为true ,get
complete ：当Ajax状态码为4时，所触发的回调函数
contentType：请求头信息，如果是post请求，默认是，application/x-www-form-urlencoded 
data ：发送Ajax时传递的参数，要求是一个字符串或json格式对象。
dataType：期待的返回值类型，常用的是有text,xml,json，默认为text 
success ：当Ajax状态码为4且响应状态码为200时，所触发的回调函数
type：http请求，get与post #get post put patch delete 
url：请求的页面 
```

```html
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript">
$(function(){
        $("input[type=button]").click(function(){
                //写ajax的请求了
                $.ajax({
                    type:'get',
                    url:'demo2.php',
                    success:function(msg){
                    //msg是从服务器端请求回来的数据。
                            $('#res').html(msg);
                    }
                });
        });    
});
</script>

<style type="text/css">
#res{width:300px;height:150px;background:gray;}
</style>

 <body>
       <input type="button" value="获取ajax请求数据"/><br/>
       <div id="res"></div>
 </body>
```

##### demo2.php

```php
<?php
  	echo "大吉大利,今晚吃鸡!";
?>
```

## 课堂案例：使用$.ajax计算两个数的和get和post请求

### （1）使用get请求；

##### 方式一：直接在url里面拼接传递的字符串

```html
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript">
$(function(){
        $("input[type=button]").click(function(){
                //获取输入的两个数的值
                var num1 = $('#num1').val();
                var num2 = $('#num2').val();
                //写ajax的请求了
                //get请求使用方式一，直接在url中拼接字符串。
                $.ajax({
                    type:'get',
                    url:'./demo3.php?num1='+num1+'&num2='+num2,
                    success:function(msg){
                        $('#res').html(msg);
                    }
                });
        });    
});
</script>

<body>
        第一个数：<input type="text" name="num1" id="num1"/><br/>
        第二个数：<input type="text" name="num2" id="num2"/><br/>
        <input type="button" value="计算两个数的和"/><span id="res"></span>
</body>
```

### 方式二：使用data，data是一个字符串的方式。

```html
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript">
$(function(){
        $("input[type=button]").click(function(){
                //获取输入的两个数的值
                var num1 = $('#num1').val();
                var num2 = $('#num2').val();
                //写ajax的请求了
                //get请求使用方式二，使用data拼接的字符串。
                $.ajax({
                    type:'get',
                  	data:'num1='+num1+'&num2='+num2,
                    url:'demo3.php',
                    success:function(msg){
                        $('#res').html(msg);
                    }
                });
        });    
});
</script>

<body>
        第一个数：<input type="text" name="num1" id="num1"/><br/>
        第二个数：<input type="text" name="num2" id="num2"/><br/>
        <input type="button" value="计算两个数的和"/><span id="res"></span>
</body>
```

### 方式三：使用data，data是一个json格式数据。

```html
<script type="text/javascript">
$(function(){
        $("input[type=button]").click(function(){
                //获取输入的两个数的值
                var num1 = $('#num1').val();
                var num2 = $('#num2').val();
                //写ajax的请求了
                //get请求使用方式三，data是一个 json格式的数据。
                $.ajax({
                    type:'get',
                    data:{num1:num1,num2:num2},
                    url:'demo3.php',
                    success:function(msg){
                        $('#res').html(msg);
                    }
                });
        });    
});
</script>

<body>
        第一个数：<input type="text" name="num1" id="num1"/><br/>
        第二个数：<input type="text" name="num2" id="num2"/><br/>
        <input type="button" value="计算两个数的和"/><span id="res"></span>
</body>
```

##### demo3.php

```php
<?php
	echo $_GET['num1'] + $_GET['num2'];
?>
```



### （2）使用post请求；

##### 方式一：使用data，data是一个字符串的方式

```html
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript">
$(function(){
        $("input[type=button]").click(function(){
                //获取输入的两个数的值
                var num1 = $('#num1').val();
                var num2 = $('#num2').val();
                //写ajax的请求了
                //post请求使用方式一，data是一个 字符串格式的数据。
                $.ajax({
                    type:'post',
                    data:'num1='+num1+'&num2='+num2,
                    url:'demo4.php',
                    success:function(msg){
                            $('#res').html(msg);
                    }
                });
        });    
});
</script>

<body>
        第一个数：<input type="text" name="num1" id="num1"/><br/>
        第二个数：<input type="text" name="num2" id="num2"/><br/>
        <input type="button" value="计算两个数的和"/><span id="res"></span>
</body>
```

##### 方式二：使用data，data是一个json格式数据。

```html
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript">
$(function(){
        $("input[type=button]").click(function(){
                //获取输入的两个数的值
                var num1 = $('#num1').val();
                var num2 = $('#num2').val();
                //写ajax的请求了
                //post请求使用方式一，data是一个 字符串格式的数据。
                $.ajax({
                    type:'post',
                    data:{num1:num1,num2:num2},
                    url:'demo4.php',
                    success:function(msg){
                            $('#res').html(msg);
                    }
                });
        });    
});
</script>

<body>
        第一个数：<input type="text" name="num1" id="num1"/><br/>
        第二个数：<input type="text" name="num2" id="num2"/><br/>
        <input type="button" value="计算两个数的和"/><span id="res"></span>
</body>
```





## 3、解决Ajax中缓存问题

当我们在`IE浏览器下使用get`时，系统会存在缓存问题，那么在实际项目开发中，如何解决以上问题呢？

在原生JS的ajax中,实在URL后面添加 `随机数` 或者添加 `时间戳` 火灾添加`If-Modified-Since`来解决缓存问题的.

那么在jquery的ajax中我们可以使用`cache:false`来解决

```html
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript">
$(function(){
        $("input[type=button]").click(function(){
                //获取输入的两个数的值
                var num1 = $('#num1').val();
                var num2 = $('#num2').val();
                //写ajax的请求了
                //post请求使用方式一，data是一个 字符串格式的数据。
                $.ajax({
                    type:'get',
                  	cache:false,
                    data:'num1='+num1+'&num2='+num2,
                    url:'demo6.php',
                    success:function(msg){
                            $('#res').html(msg);
                    }
                });
        });    
});
</script>
```

## 3、XML与JSON

##### （1）Ajax中XML处理大批数据

XML和HTML非常的相似,但是它不是用来做网页结构的,而是一种DTD严格约束型的数据传输格式,在互联网的第三方支付和金融交易中经常使用的一种数据交互格式



目前在互联网中的使用量大约在5%



为什么在金融交易中会使用xml?

```
因为xml可以控制自定义标签中可以输入'值的类型'和'长度'或者其它的约束
```



返回简单xml数据

例1：通过xml数据返回两个的数四则运算

```html
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript">
$(function(){
        $("input[type=button]").click(function(){
                //获取输入的两个数的值
                var num1 = $('#num1').val();
                var num2 = $('#num2').val();
                $.ajax({
                    type:'get',
                    dataType:'xml',
                    url:'demo4.php?num1='+num1+'&num2='+num2,
                    success:function(msg){
                            //处理xml格式数据
                            //原生态的方式处理
                            /*var he = msg.getElementsByTagName('he')[0].childNodes[0].nodeValue;
                            var cha = msg.getElementsByTagName('cha')[0].childNodes[0].nodeValue;
                            var ji = msg.getElementsByTagName('ji')[0].childNodes[0].nodeValue;
                            var shang = msg.getElementsByTagName('shang')[0].childNodes[0].nodeValue;*/
                            var he = $(msg).find('he').text();
                            var cha = $(msg).find('cha').text();
                            var ji = $(msg).find('ji').text();
                            var shang = $(msg).find('shang').text();
                            $("#res").html(he+'-'+cha+'-'+ji+'-'+shang);
                    }
                });   
        });    
});
</script>

<body>
        第一个数：<input type="text" name="num1" id="num1"/><br/>
        第二个数：<input type="text" name="num2" id="num2"/><br/>
        <input type="button" value="计算两个数结果"/><span id="res"></span>
</body>
```



##### demo4.php

```php
<?php
$num1 = $_GET['num1'];
$num2 = $_GET['num2'];
$he = $num1+$num2;
$cha = $num1-$num2;
$ji = $num1*$num2;
$shang = $num1/$num2;
//返回的数据是xml格式
$str=<<<XML
<root>
        <he>$he</he>
        <cha>$cha</cha>
        <ji>$ji</ji>
        <shang>$shang</shang>
</root>
XML;
header('content-type:text/xml;charset=utf-8');
echo $str;
?>
```



##### 返回复杂的xml数据

```html
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript">
$(function(){
        $("input[type=button]").click(function(){
                $.ajax({
                    type:'get',
                    dataType:'xml',
                    url:'demo5.php',
                    success:function(msg){
                          //返回的是复杂的xml数据。
                          var str = '';
                           $(msg).find('book').each(function(i,item){
                                        str+=$(item).find('name').text()+'---'+$(item).find('price').text()+'<br/>';
                           });
                           $('#res').html(str);
                    }
                });   
        });    
});
</script>

<body>
        <input type="button" value="获取数据"/><hr/>
        <div id="res"></div>
</body>
```

##### demo5.php

```php
<?php
header('content-type:text/xml;charset=utf-8');
$str=<<<XML
<root>
        <book>
                <name>javascript从入门到放弃</name>
                <price>123.45</price>
        </book>
        <book>
                <name>神奇的我</name>
                <price>63.45</price>
        </book>
        <book>
                <name>芮栋传</name>
                <price>163.45</price>
        </book>
         <book>
                <name>python从入门到放弃</name>
                <price>56.45</price>
        </book>
</root>
XML;

echo $str;
?>
```

### （2）****Ajax****中****Json****处理大批量数据

**返回简单的json 格式数据**

```html
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript">
$(function(){
        $("input[type=button]").click(function(){
                //获取输入的两个数的值
                var num1 = $('#num1').val();
                var num2 = $('#num2').val();
                $.ajax({
                    type:'get',
                    dataType:'json',
                    data:{num1:num1,num2:num2},
                    url:'demo6.php',
                    success:function(msg){
                           $('#res').html(msg.he+'--'+msg.cha+'--'+msg.ji+'--'+msg.shang);
                    }
                });
        });    
});
</script>

<body>
        第一个数：<input type="text" name="num1" id="num1"/><br/>
        第二个数：<input type="text" name="num2" id="num2"/><br/>
        <input type="button" value="计算两个数结果"/><span id="res"></span>
</body>
```

##### demo6.php

```php
<?php
$num1 = $_GET['num1'];
$num2 = $_GET['num2'];
$he = $num1+$num2;
$cha = $num1-$num2;
$ji = $num1*$num2;
$shang = $num1/$num2;
//返回的数据是json格式
$arr=array('he'=>$he,'cha'=>$cha,'ji'=>$ji,'shang'=>$shang);
echo json_encode($arr);
?>
```

### 返回复杂的json 格式数据

```html
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript">
$(function(){
        $("input[type=button]").click(function(){
                $.ajax({
                    type:'get',
                    dataType:'json',
                    url:'demo7.php',
                    success:function(msg){
                            //处理大批量的json格式数据
                            var str = '';
                            $(msg).each(function(i,item){
                                    str+=item.name+'--'+item.age+'---'+item.address+'<br/>';
                            });
                            $('#res').html(str);
                    }
                });
        });    
});
</script>

 <body>
        <input type="button" value="获取数据"/><hr>
        <div id="res"></div>
 </body>
```

##### demo7.php

```php
<?php
$arr = [
	['name'=>'芮栋','age'=>18,'address'=>'中国'],
	['name'=>'特朗普','age'=>78,'address'=>'星条国'],
	['name'=>'普京','age'=>68,'address'=>'俄国'],
	['name'=>'安倍','age'=>58,'address'=>'倭国']
];
echo json_encode($arr);
?>
```

## 6、Ajax的高级实现

```html
$.get(url,[data],[callback],[dataType])：Ajax中的get请求
$.post(url,[data],[callback],[dataType]])：Ajax中的post请求
参数说明：
url：请求的url地址
[data]：要求格式是一个json对象，也可以是字符串，但是建议使用json对象
[callback]：当Ajax状态码为4且响应状态码为200时所触发的回调函数
[dataType]：期待的返回值类型，text,xml,json 
```

##### （1）$.get请求实现

$.get(url,[data],[callback],[dataType])：Ajax中的get请求

```html
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript">
$(function(){
        $("input[type=button]").click(function(){
                var name = $('input[name=name]').val();
                var pwd = $('input[name=pwd]').val();
                var data = {username:name,password:pwd};
                $.get('demo8.php',data,function(msg){
                        console.log(msg);
                });
        });    
});
</script>

 <body>
        姓名：<input type="text" name="name"/><br/>
        密码：<input type="password" name="pwd"/><br/>
        <input type="button" value="提交"/><hr>
 </body>
```

##### demo8.php

```php
<?php
print_r($_GET);
?>
```

##### （2）post请求

$.post(url,[data],[callback],[dataType]])：Ajax中的post请求

```html
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript">
$(function(){
        $("input[type=button]").click(function(){
                var name = $('input[name=name]').val();
                var pwd = $('input[name=pwd]').val();
                var data = {username:name,password:pwd};
                $.post('demo9.php',data,function(msg){
                        console.log(msg);
                });
        });    
});
</script>

 <body>
        姓名：<input type="text" name="name"/><br/>
        密码：<input type="text" name="pwd"/><br/>
        <input type="button" value="提交"/><hr>
 </body>
```

##### demo9.php

```php
<?php
print_r($_POST);
?>
```



# 三、Ajax中的跨域请求

同源策略:起到保护的作用,不让其它服务器请求.

## 1、提出问题

##### Ajax跨域请求:

```html
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript">
$(function(){
        $("input[type=button]").click(function(){
                var name = $('input[name=name]').val();
                var age = $('input[name=age]').val();
                var data = {name:name,age:age};
                $.post('http://www.hal.com/demo9.php',data,function(msg){
                        console.log(msg);
                });
        });    
});
</script>

<body>
        姓名：<input type="text" name="name"/><br/>
        年龄：<input type="text" name="age"/><br/>
        <input type="button" value="提交"/><hr>
</body>
```

```
2new_file.html?__hbt=1522250043273:1 Failed to load http://www.hal.com/demo8.php: No 'Access-Control-Allow-Origin' header is present on the requested resource. Origin 'http://127.0.0.1:8020' is therefore not allowed access.

//跨域请求被阻止
```

## 2、跨域请求详解

为什么Ajax不允许跨域请求：受到浏览器中的**同源策略**影响，基于**安全考虑**，不允许跨域

  

Ajax技术由于受到浏览器的限制，该方法不允许跨域通信。

同源策略阻止从一个域上加载的脚本获取或操作另一个域上的文档属性。也就是说，受到请求的URL 的域必须与当前Web 页面的域相同。这意味着浏览器隔离来自不同源的内容，以防止它们之间的操作。 

面试题：为什么Ajax不允许跨域请求

答：受到浏览器中的同源策略影响，基于安全考虑，不允许跨域

## 3、通过Jsonp解决跨域请求

```html
（1）json与jsonp技术区别？
json：一组无序数据的集合，主要实现数据的传输与存储，是一种通用的数据传输格式。
jsonp是一种非官方协议，主要用于解决Ajax跨域请求问题。

（2）什么是jsonp 
JSONP是一个非官方的协议，它允许在服务器端集成script tags返回至客户端，通过javascript callback的形式实现跨域访问。
```

## 7、jQuery中解决跨域问题的三种方法

> $.ajax



> $.get



> $.getJSON

##### 注：以上方法都是使用get请求解决跨域问题

### （1）通过$.ajax解决跨域问题

主要是添加两个选项：

一个是：dataType:jsonp’(指定数据传输的类型)   和   jsonp:'fn'（指定回调函数的参数，与后端文件里面介绍函数的参数的名称一致即可）

```html
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript">
$(function(){
        $('#btn').click(function(){
                    $.ajax({
                            type:'get',
                            dataType:'jsonp',
                            jsonp:'fn',
                            url:'http://www.hal.com/demo11.php',
                            success:function(msg){
                                        var str = '';
                                        $(msg).each(function(i,item){
                                                str+=item.name+'--'+item.age+'--'+item.aihao+'<br/>';
                                        });
                                        $('#res').html(str);
                            }
                    });
        });
})
</script>

<body>
        <input type="button" value="获取数据" id="btn"/><hr>
        <div id="res"></div>
</body>
```

##### demo11.php

```php
<?php
$fn = $_GET['fn'];//callback
$arr = [
	['name'=>'芮栋','age'=>18,'address'=>'中国'],
	['name'=>'特朗普','age'=>78,'address'=>'星条国'],
	['name'=>'普京','age'=>68,'address'=>'俄国'],
	['name'=>'安倍','age'=>58,'address'=>'倭国']
];
$json = json_encode($arr);
echo $fn."($json)";
?>
```



### （2）通过$.get方法实现跨域问题

```html
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript">
$(function(){
     $('#btn').click(function(){
        $.get('http://www.hal.com/demo11.php?fn=?',function(msg){
             var str = '';
             $(msg).each(function(i,item){
                  str+=item.name+'--'+item.age+'--'+item.aihao+'<br/>';
             });
             $('#res').html(str);
        },'jsonp');
     });
})
</script>


<body>
        <input type="button" value="获取数据" id="btn"/><hr>
        <div id="res"></div>
</body>
```



### （3）通过$.getJSON方法解决跨域问题

```html
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript">
$(function(){
        $('#btn').click(function(){
            $.getJSON('http://www.hal.com/demo11.php?fn=?',function(msg){
                 var str = '';
                 $(msg).each(function(i,item){
                      str+=item.name+'--'+item.age+'--'+item.aihao+'<br/>';
                 });
                 $('#res').html(str);
            })
        });
})
</script>

<body>
        <input type="button" value="获取数据" id="btn"/><hr>
        <div id="res"></div>
</body>
```



### (4)最通用也是最好的方法

```hrml
nginx允许跨域
apache允许跨域
```

### 点击切换验证码

```javascript
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script src="jquery-1.8.3.js"></script>
		<script>
			$(function(){
				
				var div = $('div');
				div.css({width:'100px',height:'50px',background:'pink'})
				$.ajax({
						url:'http://10.11.52.13/2.php',
						datatype:'json',
						type:'get',
						success:function(vscode){
							div.text(vscode);
						}
					});
				
				div.click(function(){
					$.ajax({
						url:'http://10.11.52.13/2.php',
						datatype:'json',
						type:'get',
						success:function(vscode){
							div.text(vscode);
						}
					});
				});
				
				
				
				$('button').click(function(){
					
					
					var account = $('input[name=account]').val();
					var pwd = $('input[name=pwd]').val();
					var path = 'http://10.11.52.13/1.php';
					//发出请求
					$.ajax({
						url:path,
						datatype:'json',
						type:'post',
						data:{name:account,pwd:pwd},
						success:function(msg){
							
						}
					});
				});
			});
		</script>
	</head>
	<body>
		<table>
			<tr>
				<td>用户名:</td>
				<td><input type='text' name='account' placeholder="用户名/邮箱/手机"/></td>
			</tr>
			<tr>
				<td>密码:</td>
				<td><input type='password' name='pwd' placeholder="密码"/></td>
			</tr>
			<tr>
				<td><button>提交</button></td>
				<td><input type='reset' value='重置'/></td>
			</tr>
		</table>
		<div></div>
	</body>
</html>

```

```php
#1.php
<?php
	header('Access-Control-Allow-Origin:*');
	$res = $_POST;
	
	var_dump($res);
?>
```

```php
#2.php
<?php
	header('Access-Control-Allow-Origin:*');
	echo rand(1000,9999);
?>
```































