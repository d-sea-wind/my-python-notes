# 一、jQuery简介

## 1、什么是jquery

 

jQuery是一个开源的，优秀的javascript函数库(js框架)，他体积小，简化了很多对HTML、CSS、DOM、事件、动画的处理。

使用非常方便

jquery宗旨：

 ![image_1](images\image_1.png)

写的更少，做的更多，吃的少，干得多。

 

###### 什么时候出现?

###### > 2006年 美国纽约

## 2、js优势

为什么学习jquery?

（1）市场占有率高，工作中用到的可能性大。

（2）jquery相比其他的js库，有其鲜明的特点，方便对页面元素节点对象进行查找

（3）插件支持：时间选取器、表单验证等。

（4）完善的ajax支持

（5）高低版本兼容性好

**Jquery**从**2006**年开始发布，但发布后迅速占据市场，成为后起之秀。

Jquery=Javascript+Query(查询),意思是强大的DOM节点查询。





## 3、jQuery下载与部署

> （1）源代码下在：[http://jquery.com/](http://jquery.com/)

 ![image_2](images\image_2.png)

如果项目没有特殊要求，建议大家采用1.8以下版本，jQuery2.0及后续版本将不再支持IE6/7/8浏览器。

> （2）下载软件压缩包，解压如下图所示

 ![image_3](images\image_3.png)

jquery-1.8.3.js ：未经过压缩后的版本，具有可读性（内部有许多注释，空格，回车）

jquery-1.8.3.min.js ：经过压缩后的版本，代表更精简（没有空格和回车）

jquery版本

**两者功能没有区别，大小的区别在于**min**是压缩后的代码** 

**即把空行，空白等压缩掉，把变量名字变短。** 

**而文件比较大的没有压缩的源文件。所以在学习时，使用没有压缩的源文件，但是上线后，在线网站使用压缩版，提供下载速度。**

> （3）使用jQuery

第一步：复制jquery-1.8.3.js到项目js目录中并改名为jquery.js

第二步：通过script代码中的src属性载入jquery源代码到当前页面即可

## 4、初步体验

广告词：写的更少，做的更多

初步体验：

```javascript

// 原生JS
window.onload=function(){
        //选择button按钮
        var oBtn = document.getElementById('btn');
        oBtn.onclick=function(){
                //让id=one的div给隐藏
                document.getElementById('one').style.display='none';
        }
}


//jQuery
$(function(){
        $('#btn').click(function(){
                    $('#one').hide(2000);
        });
});
```



# 二、jQuery中的选择器

要完成DOM的操作，选中元素是第一步，jquery为我们提供了强大，丰富的选择器。

原生代码中使用document.getElementById(id)获取指定id的DOM对象

在jQuery中可以通过$标识符+选择器选择页面中任一元素

## 1、基本选择器

\#id ：根据元素的id属性获取指定的元素

element：根据元素的名称获取指定的元素

selector1,selector2：匹配所有满足条件的元素

.class：根据元素的class属性获取指定的元素

js对象显示出来是一个标签的样式

jquery单个对象显示出来 是init

jquery集合对象显示出来是 init(?),集合中存储的是js的单个对象,通过.get()方法获取标签

```html
<script type="text/javascript" src="../js/jquery/jquery-1.8.3.js"></script>
<script type="text/javascript">
function t1(){
        //选择id=one的元素
        //$("#one").css('background','green');
        //选择span标签,当前页面中所有的span
        //$('span').css('background','pink');
        //选择p和div标签，也就是当前页面中，所有的p和div.
        //$('p,div').css('background','red');
        //选择class=one的元素
        $(".one").css('background','blue');
}
</script>

<body>
    <input type='button' value="基本选择器" onclick="t1()"/><br/>
    <p>今天好天气</p>
    <div>
            <p><span class="one">可以去旅游了</span></p>
            <span id="one">下午可能要下雪了</span>
    </div>
    <span>天气好，可以去减肥</span><br/>
    <span>天气不好，可以去吃大餐</span>
     <p  class="one">中文不吃饭啦</p>
</body>
```



## 2、层级选择器

**ancestor (**空格**) descendant ：选取祖先元素下的所有后代元素(祖先与后代)**

**parent > child**：选择父元素下的所有子元素（父子关系）

**prev + next**：选取同级元素紧邻的下一个元素

**prev~siblings**：选取同级元素所有的同级兄弟元素

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
function t1(){
      //选择div下面的所有的span标签（祖先与后代）
      $("div span").css('background','red');
      //选择div下面的子元素为span的（父子关系）
      $("div>span").css('background','green');
      //选择在div后面的第一个span(兄弟节点，只有一个兄弟)
      $("div + span").css('background','blue');
      //选择与div后面的所有同级的span（同胞选择器）
      $("div ~ span").css('background','pink');
}
</script>

  <body>
    <input type='button' value="层级选择器" onclick="t1()"/><br/>
    <p>今天天气好</p>
    <span>东游记</span>
    <div>
            <p><span class="one">可以去旅游了</span></p>
            <span id="one">下午可能要下雪了</span>
            <div>南游记</div>
            <span>淑女侠</span>
    </div>
    <span>天气好，可以去减肥</span><br/>
    <span>天气不好，可以去吃大餐</span>
     <p  class="one">中文不吃饭啦</p>
     <span>西游记</span>
  </body>
```



## 3、简单选择器

```
:first ：匹配第一个元素

:last ：匹配最后一个元素

:even：匹配所有偶数

:odd ：匹配所有奇数

:eq(index) ：匹配索引为index的元素（默认索引从0开始）

:gt(index)：匹配索引大于index的元素

:lt(index) ：匹配索引小于index的元素

:not(selector)：匹配除指定选择器以外的其他元素
```

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
function t1(){
      //查找当前页面中的第一个li标签
      //$("li:first").css('background','red');
      //查找当前页面中的偶数的li标签
      //$("li:even").css('background','red');
      //查询li的排序大于3的li
      //$('li:gt(3)').css('background','green');
       //查询第4个li标签
       //$('li:eq(3)').css('background','green');
       //查询大于2的li标签排除最后一个li标签。
       $("li:gt(1):not(:last)").css('background','red');
}
</script>

 <body>
    <input type='button' value="简单选择器" onclick="t1()"/><br/>
    <ul>
        <li>西游记</li>
        <li>东游记</li>
        <li>鬼吹灯</li>
        <li>诛仙传</li>
        <li>罗贯中</li>
        <li>李莫愁</li>
    </ul>
 </body>
```



课堂案例:显示与隐藏

```html
<!DOCTYPE html>
<head>

<meta charset="UTF-8">
<title>新建网页</title>
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
//考虑，给p绑定单击事件，如何做到隐藏和显示 ，显示谁，隐藏谁
//显示谁和隐藏谁：大于2的li并排除最后的一个li.
//在p标签里面的内容，是“显示所有内容”的时候，显示
//在p标签里面的内容，是“隐藏所有内容”的时候，隐藏
//取出p标签，绑定事件
window.onload=function(){
            document.getElementsByTagName('p')[0].onclick=function(){
                        //要获取p标签里面的内容$('p').html()  相当于innerHTML
                      if($('p').html()=='隐藏所有内容'){
                            $("li:gt(2):not(:last)").hide(1000);
                            //要改变p标签里面的内容
                            $('p').html('显示所有内容');
                      }else{
                             $("li:gt(2):not(:last)").show(1000);
                            //要改变p标签里面的内容
                            $('p').html('隐藏所有内容');
                      }
            };
}
</script>

<style type="text/css">
*{margin:0;padding:0px;list-style:none;}
#all{width:600px;border:1px solid green;margin:100px auto;padding:10px;}
#all ul {overflow:hidden;}
#all ul li {width:200px;height:24px;line-height:24px;float:left;text-align:center;}
#all p {width:200px;height:24px;line-height:24px;text-align:center;margin-left:200px;border:1px solid black;cursor:pointer;}
</style>
</head>
    <body>
    <div id="all">
            <ul>
                    <li>索尼</li>
                    <li>美光</li>
                    <li>佳能</li>
                    <li>联想</li>
                    <li>锤子</li>
                    <li>尼康</li>
                    <li>小龙</li>
                    <li>其他品牌相机</li>
            </ul>
            <p>隐藏所有内容</p>
    </div>
    </body>
</html>
```



## 4、内容选择器

```
:contains(text)：匹配内容包含指定文本的元素

:empty ：匹配内容为空的元素

:has(selector) ：匹配具有指定选择器的元素

:parent：匹配具有子元素的元素（内容不为空的元素）
```

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
function t1(){
     //选择li元素中包含"记"的li元素
     //$("li:contains('记')").css('background','red');
     //选择li中为空的li元素。
     //$("li:empty").css('background','green');
     //选择li中有span标签的li
     //$("li:has('span')").css('background','blue');
     //选择li中有子元素的li(不为空，自己做了父亲)
     $("li:parent").css('background','pink');
}
</script>
<style type="text/css">
</style>
</head>
    <body>
    <input type='button' value="内容选择器" onclick="t1()"/><br/>
    <ul>
        <li>西游记</li>
        <li>东游记</li>
        <li>鬼吹灯</li>
        <li>诛仙传</li>
        <li><span>罗贯中</span></li>
        <li>李莫愁</li>
        <li></li>
    </ul>
    </body>
```



## 5、可见性选择器

**:hidden**：匹配所有隐藏元素(display:none，input type=’hidden’) 

**:visible**：匹配所有可见元素(display:block) 

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
function t1(){
    //选择隐藏的div,让其显示，并设置样式 
     //$("div:hidden").css('background','red');
     //$("div:hidden").show();
     //选择显示的div,让其隐藏
     $("div:visible").hide();
}
</script>

<style type="text/css">
#one{width:400px;height:200px;background:gray;}
#two{width:400px;height:200px;background:gold;display:none;}
</style>

<body>
    <input type='button' value="可见性选择器" onclick="t1()"/><br/>
    <div id="one">我是显示的</div>
    <div id="two">我是隐藏的</div>
</body>
```

## 6、属性选择器

根据元素里面的属性进行选择。

**[attribute] ：匹配具有指定属性的元素**

**[attribute=value]：匹配属性值等于value的元素**

**[attribute!=value] ：匹配属性值不等于value*的元素**

**[attribute^=value] ：匹配属性值以value开始的元素**

**[attribute$=value] ：匹配属性值以value结尾的元素**

**[attribute\*=value] ：匹配属性值包含value的元素**

**[selectorN]：匹配包含多个属性的元素**

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
function t1(){
    //选择具有name属性的div
    //$('div[name]').css('background','red');
    //选择name属性值为username的div
    //$('div[name=username]').css('background','green');
     //选择name属性值不等于username的div  注意：会选择所有的div的。
    //$('div[name!=username]').css('background','green');
    //选择name属性值以user开头的div
    //$('div[name^=user]').css('background','red');
    //选择name属性值以age结尾的div
    //$('div[name$=age]').css('background','red');
     //选择具有name属性和color属性的div
    $('div[name][color]').html('<p>我的薪水是2300</p>');;
}
</script>
</head>
<body>
    <input type='button' value="属性选择器" onclick="t1()"/><br/>
    <div name="username">程咬金</div>
    <div name="userage">12</div>
    <div name="age">45</div>
    <div name="salary" color="red">23000</div>
</body>
```

## 7、子元素选择器

> :nth-child(index/even/odd) 从1算起：匹配索引为index的指定元素



> :first-child ：匹配第一个子元素



> :last-child ：匹配最后一个子元素



> :only-child：如果当前元素只有唯一子元素，则匹配

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
function t1(){
  //选择ul中的第一个子元素
   //$("ul :first-child").html('一个和尚和一群妖怪的故事');
  //选择ul中只有一个li的li标签
  //$("ul :only-child").css('background','red');
  //选择ul中第2个li元素，注意：索引是从1开始的。
  $('ul :nth-child(2)').css('background','green');
}
</script>

<body>
    <input type='button' value="子元素选择器" onclick="t1()"/><br/>
        <ul>
            <li>西游记</li>
            <li>三国演义</li>
            <li>3个女人和105个男人的故事</li>
            <li>一个男人和大群女人的故事</li>
        </ul>
        <ul><li>煎饼侠</li></ul>
</body>
```

## 8、表单选择器

```
:input ：匹配所有表单元素

:text ：匹配所有文本框

:password：匹配所有密码框

:radio ：匹配所有单选按钮

:checkbox：匹配所有复选框

:submit ：匹配提交按钮

:reset：匹配重置按钮

:image：匹配图像域

:button：匹配按钮

:file：匹配文件域

:hidden：匹配隐藏表单
```

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
function t1(){
        //匹配所有的表单元素
        //$(':input').css('background','yellow');
        //匹配所有的文本框
        //$(":text").css('background','yellow');
        //匹配所有的单选框
         //$(":radio").attr('disabled',true);
          //匹配所有的复选框
         //$(":checkbox").attr('disabled',true);
         //$("input[name=age]").val('请选择你的年龄');
}
</script>

<body>
    <input type='button' value="子元素选择器" onclick="t1()"/><br/>
     <form>
            姓名:<input type="text" name="name"/><br/>
            年龄:<input type="text" name="age"/><br/>
            性别:<input type="radio" name="sex"  value="男"/>男
                   <input type="radio" name="sex" value="女"/>女
                   <input type="radio" name="sex" value="妖"/>妖<br/>
            爱好:
                    <input type="checkbox" name="hobby[]" value="读书"/>读书
                    <input type="checkbox" name="hobby[]" value="写诗"/>写诗
                    <input type="checkbox" name="hobby[]" value="学习"/>学习
                    <input type="checkbox" name="hobby[]"  value="运动"/>运动
                    <input type="checkbox" name="hobby[]" value="唱歌"/>唱歌<br/>
           介绍 ：
                    <textarea cols="20" rows="5"></textarea>
                    <input type="submit" value="提交"/>      
     </form>
</body>
```



**问题：在**jQuery**中使用**`$(":input")与$("input")`**的区别**?

`$(":input")与$("input")` 

答：`$(":input")`匹配所有表单元素，包括select与textarea元素

`$("input")`只能匹配input标签

## 9、表单属性选择器

```
:enabled ：匹配所有可用元素

:disabled ：匹配所有不可用元素

:checked ：匹配复选框单选框所有选中元素(问题多)

:selected ：匹配下拉选框所有选中元素
```

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
  function t1(){
       //把禁用的元素设置为开启状态
       //$(":disabled").attr('disabled',false);
       //把开启的元素设置禁用状态
       $(":enabled").attr('disabled',true);
       //获取单选框里面的值
       alert($(":checked").val());
}
</script>
<body>
    <input type='button' value="子元素选择器" onclick="t1()"/><br/>
     <form>
            姓名:<input type="text" name="name"/><br/>
            年龄:<input type="text" name="age"/><br/>
            性别:<input type="radio" name="sex"  value="男"/>男
                   <input type="radio" name="sex" value="女"/>女
                   <input type="radio" name="sex" value="妖"/>妖<br/>
            爱好:
                    <input type="checkbox" name="hobby[]" value="读书"/>读书
                    <input type="checkbox" name="hobby[]" value="写诗"/>写诗
                    <input type="checkbox" name="hobby[]" value="学习"/>学习
                    <input type="checkbox" name="hobby[]"  value="运动"/>运动
                    <input type="checkbox" name="hobby[]" value="唱歌"/>唱歌<br/>
           介绍 ：
                    <textarea cols="20" rows="5"></textarea>
                    <input type="submit" value="提交"/>      
     </form>
</body>
```

面试题：在表单元素中disabled='true'和readonly='readonly'区别：

答：disabled与readonly虽然都可以限定文本框被编辑，但是两者还是有区别的，主要区别在于readonly可以在python页面接收设置为readonly属性表单的值。而disabled是接收不到任何数据的。



# 三、DOM对象与jQuery对象

## **1、提出问题**

dom对象和jquery对象是否是一回事？答：不是。

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
window.onload=function(){
        var oBtn = document.getElementById('btn');
        oBtn.onclick=function(){
               var oDiv = document.getElementsByTagName('div')[0];
               //oDiv.style.backgroundColor = 'red';//效果正常
               $("div").style.backgroundColor = 'red';//效果不正常
               //说明，dom对象和jquery对象不是同一个对象。
        } 
        /*
        $("#btn").onclick=function(){
                alert('ok');
        }*/
}
</script>

 <body>
    <input type='button' value="单击" id="btn"/><br/>
    <div>你好，welcome to shanghai</div>
 </body>
```



## 2、什么是dom对象

使用document.getElementById或document.getElementsByTagName获取的对象就是dom对象。

## 3、什么是jquery对象

使用$符号选择的元素就是jquery对象。

## 4、query对象与dom对象的关系

 ![image_4](images\image_4.jpg)

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
window.onload=function(){
      console.log(document.getElementsByTagName('div')[0]);
      console.log($('div')[0]);
}
</script>
<style type="text/css">
</style>

<body>
    <div>东游记</div>
    <div>西游记</div>
 
</body>
```

通过上面测试，发现$(‘div’)里面，包含div的dom对象的。jquery对象是对dom对象的重新封装，他们之间是可以相互转换的。



### 相互套用如下 :

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
window.onload=function(){
      console.log(document.getElementsByTagName('div')[0]);
      console.log($('div')[0]);
      document.getElementsByTagName('div')[0].style.fontSize='25px';
      $('div')[0].style.backgroundColor='blue';
}
</script>
```

```html
<body>
    <div>东游记</div>
    <div>西游记</div>
    <p><div>红楼梦</div></p>
</body>
```



## 5、jQuery对象与DOM对象相互转换

### （1）jQuery对象转换成dom对象，

语法：

DOM对象 = jQuery对象[下标]; 

DOM对象 =jQuery对象.get(下标); 

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
function t1(){
        //先获取jquery对象,
        $('div')[1].style.backgroundColor='green';
        $('div').get(2).style.backgroundColor='red';
}
</script>


<body>
    <input type="button" value="单击" id="btn" onclick="t1()"/>
    <div>东游记</div>
    <div>西游记</div>
    <p><div>红楼梦</div></p>
</body>
```

### （2）把dom对象转换成jquery对象。

语法：jQuery对象 = $(DOM对象); 

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
function t1(){
        //先获取对象,
       var div2 = document.getElementsByTagName('div')[2];
       $(div2).css('background','red');
}
</script>


<body>
    <input type="button" value="单击" id="btn" onclick="t1()"/>
    <div>东游记</div>
    <div>西游记</div>
    <p><div>红楼梦</div></p>
</body>
```

jQuery对象的实质就是一个数组，每个数组元素本质就是一个DOM对象



# 四、jQuery中的属性

## 1、attr属性

attr(name)：获取指定元素的属性 

attr(key,value)：设置元素的属性

attr(object)：为元素同时设置多个属性，要求参数是一个json数据

attr(key,fn)：通过函数的返回值设置元素属性

removeAttr(name)：移除元素属性

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
function t1(){
        //获取img的src属性
       //alert($('img').attr('src'));//one.jpg
       //设置img的src属性，
       //$('img').attr('src','two.jpg');
       //设置img的多个属性值属性，
       //$('img').attr({src:'two.jpg',width:'600',height:'200'});
       //属性值，可以是函数的返回值
       //$('img').attr('src',function(){
                //return 'two.jpg';
       //});
       //把img的src属性给移除
       $('img').removeAttr('src');

}
</script>
<style type="text/css">
</style>
</head>
    <body>
    <input type="button" value="获取属性" id="btn" onclick="t1()"/><br/>
    <img src="one.jpg" width="300"/>
    </body>
```

## 课堂案例:复选框的 全选  反选  取消  操作

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
window.onload=function(){
               //全选
              $(":button").get(0).onclick=function(){
                   $(":checkbox").attr('checked',true);
              }
              //取消
             $(":button").get(2).onclick=function(){
                   $(":checkbox").attr('checked',false);
              }
              //反选
             $(":button").get(1).onclick=function(){
                 //each是jquery的循环
                 //i是下标
                 //item是值,是一个dom对象
                 
                   $(":checkbox").each(function(i,item){
                   //参数i是被$符号包装的下标，
                   //参数item是被$符号包装的dom对象。
                    $(item).attr('checked',!$(item).attr('checked'));    
                   });
              }
}
</script>

<body>
  <input type="button" value="全选"/>
  <input type="button" value="反选"/>
  <input type="button" value="取消"/><br/>
  <input type="checkbox"  name="hobby[]" value=""/>读书<br/>
  <input type="checkbox"  name="hobby[]" value=""/>下棋<br/>
  <input type="checkbox"  name="hobby[]" value=""/>游泳<br/>
  <input type="checkbox"  name="hobby[]" value=""/>看报<br/>
  <input type="checkbox"  name="hobby[]" value=""/>吃鸡<br/>
  <input type="checkbox"  name="hobby[]" value=""/>跳舞<br/>
  <input type="checkbox"  name="hobby[]" value=""/>游戏<br/>
  <input type="checkbox"  name="hobby[]" value=""/>撸代码<br/>
</body>
```


## 2、class属性

addClass(class)：为元素添加class属性

removeClass(class)：移除元素的class属性

toggleClass(class)：切换样式，如果元素不存在该属性则添加，否则移除

hasClass(class)：判断元素是否具有某个css类样式

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
function t1(){
        //给div1添加 class属性。
        //$("#one").addClass('one');
        //给div2删除 class属性
        $('#two').removeClass('two');
}
</script>

<style type="text/css">
.one {
        width:100px;
        height:100px;
        background:gray;
}
.two {
        width:100px;
        height:100px;
        background:red;
}
</style>

<body>
    <input type="button" value="class属性操作" onclick="t1()"/>
    <div id="one">第一个div</div>
    <div id="two"class="two">第二个div</div>
</body>
```

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
function t1(){
       //判断div里面是否有off的class属性，如果有，就删除，如果没有就添加
       /*if($("#one").hasClass('off')){
                $('#one').removeClass('off');
       }else{
                $('#one').addClass('off');
       }*/
       //判断div里面是否有off的class属性，如果有，就删除，如果没有就添加
       $("#one").toggleClass('off');
}
</script>

<style type="text/css">
#one{width:109px;height:147px}
.on{background:url('on.jpg')}
.off{background:url('off.jpg')}
</style>

<body>
    <input type="button" value="class切换操作" onclick="t1()"/>
    <div id="one"  class="on"></div>
</body>
```



### 3、css方法

**css(name)**：获取元素样式属性

**css(name,value)**：设置元素样式属性

**css(object)**：同时为元素设置多个样式属性，要求参数是一个**object**数据

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
function t1(){
     //给id=one的div添加高度，宽度，背景颜色
     $("div").css({width:'200px',height:'200px','background':'red'});
}
</script>

<body>
    <input type="button" value="css方法操作" onclick="t1()"/>
    <div id="one"></div>
</body>
```

注意：通过css方法添加的样式是行内样式：

### 作业

```
要使用图片按钮,按下去按钮缩小,放开的时候还原
```



## 4、offset位置

**offset() **：获取元素的位置，返回`json`格式数据，带有**left**与**top**属性

**offset(coordinates)**：设置元素的位置，要求参数是一个**json**数据且必须要拥有**left**与**top**属性。

获取元素的位置：

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
function t1(){
    console.log($("div").offset());//得到Object {top: 34, left: 8} 
}
function t2(){
        //设置div的位置
  		//注意值是json格式的
        $('div').offset({
                top:'200',
                left:'200'
        });
}
</script>

<style type="text/css">
	#one{width:150px;height:150px;border:1px solid red;position:absolute;}
</style>

<body>
    <input type="button" value="获取元素的位置" onclick="t1()"/>
    <input type="button" value="设置元素的位置" onclick="t2()"/>
    <div id="one"></div>
</body>
```



## 5、元素的尺寸

**width()**：获取元素的宽度

**width(value)**：设置元素的宽度

**height()**：获取元素的高度

**height(value)**：设置元素的高度

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
function t1(){
    //获取元素的高度和宽度
    console.log($('#one').width());//250
    console.log($('#one').height());//150
}
function t2(){
    //设置元素的高度和宽度
    $("#one").width(400);
    $("#one").height(300);
}
</script>
<style type="text/css">
#one{width:250px;height:150px;border:1px solid red;position:absolute;}
</style>
</head>
    <body>
    <input type="button" value="获取元素的高度和宽度" onclick="t1()"/>
    <input type="button" value="设置元素的高度和宽度" onclick="t2()"/>
    <div id="one"></div>
    </body>
```

## 6、文本域值

相当于以前的innerHTML属性：

html()：获取元素的值

html(val)：设置元素的值

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
function t1(){
    //获取元素的文本
    console.log($('#one').html());
}
function t2(){
    //设置元素文本
    $("#one").html("<strong>你好</strong>");
}
</script>

<style type="text/css">
#one{width:150px;height:150px;border:1px solid red;}
</style>

<body>
    <input type="button" value="获取元素文本内容" onclick="t1()"/>
    <input type="button" value="设置元素文本内容" onclick="t2()"/>
    <div id="one"><a>今天很暖和</a></div>
</body>
```

相当于以前的value属性：

val()：获取表单元素的值

val(val)：设置表单元素的值

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
function t1(){
    //获取表单域里面的值
   console.log($('input[name=username]').val());
}
function t2(){
    //设置表单域里面的值
  $('input[name=username]').val('请求输入你的姓名')
}
</script>


<body>
    <input type="button" value="获取表单域文本" onclick="t1()"/>
    <input type="button" value="设置表单域文本" onclick="t2()"/>
    <input type="text" name="username"/>
</body>
```

相当于以前的innerText属性

text()：获取元素的值

text(val)：设置元素的值

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
function t1(){
    //获取表单域里面的值
   console.log($('div').text());
   console.log($('div').html());
}
function t2(){
    //获取表单域里面的值
    $("#one").html("<font color='red'>大家好</font>");
    $("#two").text("<font color='red'>大家好</font>");
}
</script>

<body>
    <input type="button" value="获取文本" onclick="t1()"/>
    <input type="button" value="设置文本" onclick="t2()"/>
    <div id="one"><a>你好</a></div>
    <div id="two"></div>
</body>
```

# 六、jQuery中的事件

## 1、页面载入事件

**在原生**Javascript**代码中，我们通过**window.onload**实现页面的载入功能，其主要执行流程如下：**载入**HTML**代码到内存***->***形成**DOM**树***->***载入全部资源（文本、图片、样式）**->**执行**Javascript**脚本。

**通过**jQuery**中的**ready**方法实现页面的载入功能，基本语法：**

**（**1**）语法**1**：**

```javascript
$(document).ready(function(){ 

//事件的处理程序

}); 
```

**（2）语法2：**

```javascript
$(function(){
	//事件的处理程序
});
```

**（3）语法3：**

```javascript
$().ready(function(){ 

	//事件的处理程序

}); 
```

## **2**、**window.onload**与**ready**区别

```javascript
ready方法执行流程如下：载入HTML代码到内存-->形成DOM树结构-->执行jQuery脚本-->载入全部资源（文本、图片、样式）

在原生Javascript代码中，我们通过window.onload实现页面的载入功能，其主要执行流程如下：载入HTML代码到内存-->形成DOM树-->载入全部资源（文本、图片、样式）-->执行Javascript脚本。

通过比较，所以ready方法的执行速度要快于window.onload方法，原因就是两者的执行顺序不同!

快在哪里?
资源的载入是非常大的,需要消耗大量的时间,jquery先执行完脚本以后在载入资源,这是优化的过程.
```



## 3、常用的事件

jQuery中的所有事件都封装成了方法，所以在编写时语法如下：

语法:`jQuery对象.事件(事件的程序); `

```c++
->  blur(fn)：失去焦点时触发   (输入框中突然失去选中状态)
->  change(fn)：状态改变时触发   (输入框每输入一个字符)
=>  click(fn)：点击时触发
dblclick(fn)：双击时触发
focus(fn)：获得焦点时触发
keydown(fn)：键盘按下时触发
keyup(fn)：键盘弹起时触发
->  keypress(fn)：键盘按下时触发
load(fn)：页面载入时触发，功能与ready类似
unload(fn)：页面关闭时触发
->  mousedown(fn)：鼠标按下时触发
mouseup(fn)：鼠标弹起时触发
mousemove(fn)：鼠标移动时触发
->  mouseover(fn)：鼠标悬浮时触发
->  mouseout(fn)：鼠标离开时触发
resize(fn)：调整大小时触发
->  scroll(fn)：滚动时触发
select(fn)：文本选中时触发
submit(fn)：表单提交时触发
```

```python
注意：和原生态的比较，是没有on的，
语法：
jquery对象.事件的类型(function(){
				//处理程序
});
```

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){
       //给图片绑定鼠标滑过事件
       $("img").mouseover(function(){
                $('img').attr('src','1.jpg');
       });
       //给图片绑定鼠标移出事件
       $("img").mouseout(function(){
                $('img').attr('src','2.jpg');
       });
});
</script>

<body>
    <img src="3.jpg" width="400" height="400"/>
</body>
```

## 4、事件切换

```
hover(over,out)：鼠标悬浮与鼠标离开事件

参数说明：

over：鼠标悬浮事件

out：鼠标离开事件 
```

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){
       //给图片绑定鼠标滑过事件
       /*$("img").mouseover(function(){
                $('img').attr('src','two.jpg');
       }).mouseout(function(){
                $('img').attr('src','one.jpg');
       });*/
  
  	   //hover(function,function)
       $('img').hover(function(){
                $('img').attr('src','two.jpg');
       },function(){
            $('img').attr('src','one.jpg');
       });
});
</script>

<body>
    <img src="one.jpg" width="400" height="400"/>
</body>
```

```
toggle() 方法切换元素的可见状态。

参数:

speed:可选。规定元素从可见到隐藏的速度（或者相反）。默认为 "0"。如果设置此参数，则无法使用 				switch 参数。

callback:可选。toggle 函数执行完之后，要执行的函数。
				除非设置了 speed 参数，否则不能设置该参数。
				
switch:可选。布尔值。规定 toggle 是否隐藏或显示所有被选元素。
				True - 显示所有元素
				False - 隐藏所有元素
             如果设置此参数，则无法使用 speed 和 callback 参数
```



```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){
        //单击button时，如果img显示就隐藏，如果隐藏就显示
        $('#btn').click(function(){
                $('img').toggle(1500);
        });
});
</script>


<body>
    <input type="button" value="显示隐藏" id="btn"/><br/>
    <img src="one.jpg" width="400" height="400"/>
</body>
```











