

# jQuery_2

# 一.事件编程

## 1、绑定事件

### （1）bind(type,[data],fn) **：**为元素绑定相关的事件**处理**程序

参数说明：

>type ：事件类型，不带‘on’前缀



>[data]：可选参数，事件发生时所传递的数据（了解）



>fn ：事件的处理程序

案例1：给按钮绑定单击事件。

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){
        $(":button").bind('click',function(){
                    alert('hello python');
        });
         $(":button").bind('click',function(){
                    alert('hello jquery');
        });

});
</script>

<body>
    <input type="button" value="绑定事件"/>
</body>
```

### （2）bind({type:fn,type:fn})：为元素绑定多个事件，要求参数是一个json对象

参数说明：

>type ：事件类型，不带’on’前缀



>fn：事件的处理程序 

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){
        //给div绑定三个事件，一个是鼠标滑过，一个是鼠标离开，一个是单击事件
        $("div").bind({'mouseover':function(){
                               $('span').html('你来了');
            },'mouseout':function(){
                               $('span').html('你走了');
            },'click':function(){
                                $('span').html('你敢点我');
        }});

});
</script>

<style type="text/css">
div{width:400px;height:200px;background:gold;}
</style>

<body>
    <div></div>
    <span></span>
</body>
```

### （3）one(type,[data],fn) ：为元素绑定事件，但事件只触发一次

参数说明：

>type：事件类型



>[data]：事件发生时所传递的数据



>fn ：事件的处理程序 

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){
        //给button绑定一次性单击事件，
        $("input[type=button]").one('click',function(){
                    alert('现在开始考试了，请把手机扔出教室');
        });
});
</script>

<style type="text/css">
	div{width:400px;height:200px;background:gold;}
</style>

<body>
    <input type="button" value="开始考试"/>
</body>
```

### （4）unbind([type])：移除事件

参数说明：

>type ：要移除的事件类型



> 在原生Javascript代码中，如果想进行事件移除，那么必须有一个前提：在事件绑定时，必须为事件的处理程序命名，

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){
        //给div绑定三个事件，一个是鼠标滑过，一个是鼠标离开，一个是单击事件
        $("div").bind({'mouseover':function(){
                               $('span').html('你来了');
            },'mouseout':function(){
                               $('span').html('你走了');
            },'click':function(){
                                $('span').html('你敢点我');
        }});
        $(":button:eq(0)").click(function(){
                    //给div移除单击事件
                    $('div').unbind('click');
        });
        $(":button:eq(1)").click(function(){
                    //给div移除所有事件
                    $('div').unbind();
        });
});
</script>

<style type="text/css">
div{width:400px;height:200px;background:gold;}
</style>

<body>
     <input type="button" value="移除单击事件"/>
     <input type="button" value="移除所有事件"/>
    <div></div>
    <span></span>
</body>
```

## 二、事件绑定中的this对象

在Javascript代码中，事件监听中的this指向：  

> IE5|6 ：指向Window对象

> W3C ：指向当前要操作的DOM对象 

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){
        //可以给表单绑定一个submit事件。
        //原生态方式获取button对象
        var oBtn = document.getElementById('btn');
        console.log(oBtn);
        $("#btn").click(function(){
            console.log(this);
        });
});
</script>

<style type="text/css">
	#one{width:300px;height:200px;background:gold;}
</style>

<body>
    <input type="button" value="单击" id="btn"/>
    <div id="one">西游记,大话西游</div>
</body>
```

 ![image1](images\image1.jpg)



初步测试发现，jquery绑定事件中的this是指dom对象。

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){
        //可以给表单绑定一个submit事件。
        //原生态方式获取button对象
        var oBtn = document.getElementById('btn');
        console.log(oBtn);
        $("#btn").click(function(){
                    console.log(this);
        });
  
       	$('#one').click(function(){
            this.style.backgroundColor = 'green';
            $(this).css('font-size','30px');
     	});
});
</script>

<style type="text/css">
	#one{width:300px;height:200px;background:gold;}
</style>

<body>
    <input type="button" value="单击" id="btn"/>
    <div id="one">西游记,大话西游</div>
</body>
```

 ![image_2](images\image_2.jpg)

通过以上案例证明：在**jQuery**，事件绑定中的**this**指针指向了当前要操作的**DOM**对象



## 1、基本动画

```c++
show()：显示

show(speed,[callback]) ：以动画效果显示

参数说明：

speed：速度（动画的持续时间）

[callback]：可选参数，事件完成时所触发的回调函数



hide()：隐藏

hide(speed,[callback]) ：以动画效果隐藏

参数说明：

speed：速度（动画的持续时间）

[callback]：可选参数，事件完成时所触发的回调函数




toggle() ：切换显示或隐藏

toggle(switch) ：显示或隐藏true：显示false：隐藏

toggle(speed,[callback])：以动画效果切换显示或隐藏

speed:"slow", "normal", "fast"：slow：慢normal：正常fast：快速
```

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){
        //给隐藏按钮绑定事件
        $(":button:eq(0)").bind('click',function(){
                $('img').hide(1000,function(){alert('我走了')});
        });
         //给显示按钮绑定事件
        $(":button:eq(1)").bind('click',function(){
                $('img').show(1000,function(){alert('我来了')});
        });
         //给切换显示隐藏按钮绑定事件
        $(":button:eq(2)").bind('click',function(){
                $('img').toggle(1500);
        });
});
</script>

<body>
    <input type="button" value="隐藏"/><input type="button" value="显示"/>
    <input type="button" value="切换显示隐藏"/><hr/>
     <img src="one.jpg" width="400"/>
</body>
```

## 2、滑动效果

slideDown(speed,[callback]) ：以动画效果向下滑动**显示**

slideUp(speed,[callback]) ：以动画效果向上滑动**隐藏**

slideToggle(speed,[callback]) ：以动画效果滑动**显示或隐藏**

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){
        //给隐藏按钮绑定事件
        $(":button:eq(0)").bind('click',function(){
                $('img').slideUp('normal',function(){alert('我走了')});
        });
         //给显示按钮绑定事件
        $(":button:eq(1)").bind('click',function(){
                $('img').slideDown('normal',function(){alert('我来了')});
        });
         //给切换显示隐藏按钮绑定事件
        $(":button:eq(2)").bind('click',function(){
                $('img').slideToggle('slow');
        });
});
</script>

<body>
    <input type="button" value="隐藏"/><input type="button" value="显示"/>
    <input type="button" value="切换显示隐藏"/><hr/>
     <img src="one.jpg" width="400" height="300"/>
</body>
```

## 3、淡入淡出效果

**fadeIn(speed,[callback])** ：以动画形式淡入（**显示**）

**fadeOut(speed,[callback])** ：以动画形式淡出（**隐藏**）

参数说明：

> speed ：动画的持续时间



> [callback]：动画完成时所触发的回调函数



> fadeToggle()切换淡入淡出

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){
        //给隐藏按钮绑定事件
        $(":button:eq(0)").bind('click',function(){
                $('img').fadeOut(2000);
        });
         //给显示按钮绑定事件
        $(":button:eq(1)").bind('click',function(){
                $('img').fadeIn(2000);
        });
         //给切换显示隐藏按钮绑定事件
        $(":button:eq(2)").bind('click',function(){
                $('img').fadeToggle('slow');
        });
});
</script>

<body>
    <input type="button" value="淡出"/><input type="button" value="淡入"/>
    <input type="button" value="切换淡入淡出"/><hr/>
     <img src="one.jpg" width="400" height="300"/>
</body>
```

##### fadeTo(speed,opacity,[callback]) ：设置元素的透明度 

参数说明；

> speed：动画的持续时间



> opacity ：透明度（0-1） 0 全透明  1不透明



> [callback]：动画完成时所触发的回调函数

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){
        //给隐藏按钮绑定事件
        $(":button:eq(0)").bind('click',function(){
                $('img').fadeTo(2000,0.5);
        });
});
</script>

<body>
    <input type="button" value="透明度设置"/><br/>
     <img src="one.jpg" width="400" height="300"/>
</body>
```

## 课堂案例:图片的淡入淡出效果：

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){
       //考虑给谁加事件，加什么事件，触发什么操作。
       //鼠标滑过事件
        $('ul li').mouseover(function(){
                //让其他的 li元素透明度降低
                //siblings([expr])：查找所有同级兄弟节点（无论上下）
                //stop()，取消动画的排队机制。
                $(this).siblings().stop().fadeTo(500,0.5);
        });
        //鼠标离开事件
         $('ul li').mouseout(function(){
                //让其他的 li元素透明度降低
                //siblings([expr])：查找所有同级兄弟节点（无论上下）
                $(this).siblings().stop().fadeTo(500,1);
        });
        //给img添加事件
        $("li img").click(function(){
                $(this).slideUp().slideDown();
        });
});
</script>

<style type="text/css">
*{margin:0;padding:0;list-style:none}
body{background:black;}
#all{width:630px;border:1px solid green;margin:100px auto;padding:10px 0 0 10px;}
#all ul {overflow:hidden}
#all ul li{width:200px;float:left;margin:0 10px 10px 0;height:186px;}
</style>

<body>
    <div id="all">
        <ul>
                    <li><img src="one.jpg" width="200" height="186"/></li>
                    <li><img src="one.jpg" width="200" height="186"/></li>
                    <li><img src="one.jpg" width="200" height="186"/></li>
                    <li><img src="one.jpg" width="200" height="186"/></li>
                    <li><img src="one.jpg" width="200" height="186"/></li>
                    <li><img src="one.jpg" width="200" height="186"/></li>
        </ul>
    </div>
</body>
```

## 课堂案例：折叠菜单案例;

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){
        //考虑给谁加事件，加什么事件，触发什么操作。
        //把子栏目里面的div全部隐藏
        $(".menus+div").hide();
        //第一个栏目的子栏目显示出来
        $(".menus:first+div").show();
        //给.menus添加事件，添加单击事件，触发的操作是.menus下面的div显示和隐藏。
        $(".menus").click(function(){
                //获取当前div里面的id属性，
                var id = $(this).attr('id');
                $("#"+id+"+div").slideToggle();
        });

});
</script>

<style type="text/css">
*{margin:0;padding:0;list-style:none}
.menus{width:100px;height:40px;line-height:40px;background:green;font-size:20px;}
div{background:gray;width:100px;}
</style>

 <body>
            <div id="m1" class="menus">商品管理</div>
            <div>
                    添加商品<br/>
                    删除商品<br/>
                    修改商品<br/>
                    商品列表
            </div>
             <div id="m2" class="menus">商品管理</div>
            <div>
                    添加商品<br/>
                    删除商品<br/>
                    修改商品<br/>
                    商品列表
            </div>
            <div id="m3" class="menus">商品管理</div>
            <div>
                    添加商品<br/>
                    删除商品<br/>
                    修改商品<br/>
                    商品列表
            </div>
             <div id="m4" class="menus">商品管理</div>
            <div>
                    添加商品<br/>
                    删除商品<br/>
                    修改商品<br/>
                    商品列表
            </div>
    </body>
```

## 4、自定义动画.

>animate(params,[speed])：自定义动画效果



> params **：自定义动画，要求参数是一个**json**格式的数据** 



> [speed]：动画的持续时间 

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){
        //给隐藏按钮绑定事件
        $(":button:eq(0)").bind('click',function(){
                $("#one").animate({
                    'left':'600px'
                },2000);
        });
         $(":button:eq(1)").bind('click',function(){
                $("#one").animate({
                    'left':'400px',
                    'top':'400px'
                },2000);
        });
});
</script>

<style type="text/css">
*{margin:0;padding:0;list-style:none}
#one{width:200px;height:200px;background:red;position:absolute;}
</style>

<body>
    <input type="button" value="向右移动"/>
    <input type="button" value="向右下移动"/><br/>
     <div id="one"><div>
</body>
```

# 三、文档操作

 ![image_3](images\image_3.png)

## 1、在元素内部插入dom元素

### （1）在元素内部后面插入

例：<div>原来的内容 **后面**</div> 

语法：

> A.append(B) ：将B插入到A的内部的后面



> B.appendTo(A) ：将B插入到A的内部的后面 

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){
       $(":button:eq(0)").click(function(){
                //把"大话西游"文本插入到div内部的后面，
                //$("#one").append('大话西游');
                //把原来p标签插入到div内部的后面
                //$("#one").append($('p'));
                //把新建strong标签插入到 div内部的后面
                 $("#one").append($('<strong>三打白骨精</strong>'));
       });
});
</script>

<style type="text/css">
*{margin:0;padding:0;list-style:none}
#one{width:200px;height:200px;background:gray;}
</style>

<body>
    <input type="button" value="在div里面后面添加内容"/>
     <div id="one">西游记之-</div>
     <p>降魔篇</p>
</body>
```

### （2）在元素内部前面插入

例：<div>**前面** 原来的内容</div> 

语法：

> A.prepend(B) ：将B插入到A的内部的前面



> B.prependTo(A) ：将B插入到A的内部的前面

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){
       $(":button:eq(0)").click(function(){
               //把div里面前面添加文本，文本内容是：今天晚上上映
               //$("#one").prepend('今天晚上上映');
               //把p标签添加到div里面前面
               //$("#one").prepend($('p'));或$('p').prependTo($('#one'));
               //新建一个strong标签，添加到div里面的前面。
               $("<strong>今天隆重上映</strong>").prependTo($('#one'));
       });
});
</script>

<style type="text/css">
*{margin:0;padding:0;list-style:none}
#one{width:200px;height:200px;background:gray;}
</style>

<body>
    <input type="button" value="在div里面前面添加内容"/>
     <div id="one"> 《西游记》</div>
     <p>降魔篇</p>
</body>
```

## 2、在元素外部插入dom元素

### （1）在元素外部的后面

例： <div>hello</div>后面

语法：

> A.after(B)：将B插入到A的外面的后面



> B.insertAfter(A)：将B插入到A的外面的后面 

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){
       $(":button:eq(0)").click(function(){
              $("li:first").after('<li>西瓜刀</li>');
       });
       $(":button:eq(1)").click(function(){
              $('<li>指甲剪</li>').insertAfter("li:contains('屠龙刀')");
       });
});
</script>

<body>
    <input type="button" value="在第一个li后面添加一个li标签"/>
    <input type="button" value="在屠龙刀li后面添加一个li标签"/><br/>
    <ul>
            <li>倚天剑</li>
            <li>屠龙刀</li>
            <li>诛仙剑</li>
            <li>捆仙绳</li>
            <li>水果刀</li>
    </ul>
</body>
```

#### （2）在元素外部的前面 

例：**前面**<div>hello</div> 

语法：

> A.before(B)：将B插入到A的外面的前面



> B.insertBefore(A)：将B插入到A的外面的前面

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){
       $(":button:eq(0)").click(function(){
              $("li:first").before('<li>西瓜刀</li>');
       });
        $(":button:eq(1)").click(function(){
              //$("li:contains('屠龙刀')").before('<li>指甲剪</li>');
              $("<li>铅笔刀</li>").insertBefore($( "li:contains('屠龙刀')"));
       });
});
</script>

<body>
    <input type="button" value="在第一个li前面添加一个li标签"/>
    <input type="button" value="在屠龙刀li前面面添加一个li标签"/><br/>
    <ul>
            <li>倚天剑</li>
            <li>屠龙刀</li>
            <li>诛仙剑</li>
            <li>捆仙绳</li>
            <li>水果刀</li>
    </ul>
</body>
```

## 3、删除操作

empty()：清空元素内容

remove()：删除元素节点及内容

```html
<script type="text/javascript" src="script/jquery-1.8.3.js"></script>
<script type="text/javascript">
$(function(){
       $(":button:eq(0)").click(function(){
                $("li:first").empty();
       });
        $(":button:eq(1)").click(function(){
                $("li:first").remove();
       });
});
</script>

<body>
    <input type="button" value="删除第一个li标签的内容"/>
    <input type="button" value="删除第一个li标签"/><br/>
    <ul>
            <li>倚天剑</li>
            <li>屠龙刀</li>
            <li>诛仙剑</li>
            <li>捆仙绳</li>
            <li>水果刀</li>
    </ul>
</body>
```

## 4、复制操作

clone() ：克隆（复制）元素

clone(true)：克隆（复制）元素同时复制元素的事件

```html
<script type="text/javascript">
$(function(){
    
       $(":button:eq(0)").click(function(){
               //$("ul").append($("li:first"));//直接把"li:first"给移动到ul里面最后的位置。
               var new_li = $("li:first").clone(true);
               $("ul:eq(0)").append(new_li);

       });
    $('li:eq(0)').click(function(){
         alert('爱琴海!')
    })
});
</script>

 <body>
    <input type="button" value="复制第一个li,添加到ul的后面"/>
    <ul>
            <li>倚天剑</li>
            <li>屠龙刀</li>
            <li>诛仙剑</li>
            <li>捆仙绳</li>
            <li>水果刀</li>
    </ul>
</body>
```

## 课堂案例:新闻动态显示效果

```html
<script type="text/javascript">
$(function(){
       //使用到setInterval函数，
       //获取第一个li,插入到ul里面，再删除第一个li
       setInterval(function(){
                //克隆第一个li元素
                var new_li = $('li:first').clone();
                //把第一个li元素给删除，
                $('li:first').remove();
                //把克隆的元素的添加到ul里面
                $('ul').append(new_li);
       },1000);
});
</script>

<style type="text/css">
*{list-style:none;margin:0;padding:0;}
div{width:400px;margin:50px auto;}
h1{height:40px;line-height:40px;background:blue;color:white;widht:}
div ul li{height:25px;line-height:25px;border-bottom:1px dashed gray;}
</style>

<body>
  <div>
    <h1>动态新闻显示效果</h1>
    <ul>
      <li>古鸽:一种目前在中国濒临灭绝的鸟类</li>
      <li>身披蓝、黄、红、绿四色羽毛，比家鸽体型稍大</li>
      <li>古鸽具有超强的环境适应 能力</li>
      <li>中国十大神秘部门  路人甲</li>
      <li>国家质量监测局：随着毒牛奶案件的惊天大曝光</li>
      <li>广电总局：应该让广电总局管食品安全</li>
      <li>根据自己的优劣势明确职业定位</li>
    </ul>
  </div>
</body>
```

## 5、替换操作

### 1）值替换：html(); 

```html
<script type="text/javascript">
$(function(){
       $("div").click(function(){
            $(this).html('<h1>大刀关胜</h1>');
       });
});
</script>

<body>
        <div><h2>大刀王五</h2></div>
    	<div><h2>大刀王五</h2></div>
</body>
```

### 2）节点（标签）替换：replaceWith(); 

```html
<script type="text/javascript">
$(function(){
      $(':button:eq(0)').click(function(){
                //$('div').replaceWith($('p'));//把p节点移动到div节点的位置。
                $('div').replaceWith($('<strong>潘金莲</strong>'));//把div节点替换成strong节点
      });
});
</script>

<body>
  <input type="button" value="节点替换操作"/>
  <div>大刀王五</div>
  <p>小李飞刀</p>
</body>
```

## 6、包裹操作

用新的标签把原来的标签给包裹起来。

wrap()：对每个元素进行单独包裹

```html
<script type="text/javascript">
$(function(){
      $(':button:eq(0)').click(function(){
              //$('div').wrap("<strong></strong>");
              //$('div').wrapAll("<strong></strong>");
              $('div').wrapInner("<strong></strong>");
      });
});
</script>

<body>
  <input type="button" value="节点包裹操作"/>
  <div>大刀王五</div>
    <div><a>醉拳张三</a></div>
  <div>小李飞刀</div>
</body>
```

## 7、查找操作

eq(index)：通过元素的索引查找元素，index默认从0开始

filter(expr)：查找与给定元素匹配的元素，expr匹配条件

not(expr)：查找与给定元素不匹配的元素

children([expr])：查找所有子元素

find(expr)：查找所有后代元素

next([expr])：查找紧邻的下一个元素

**nextAll();**查找紧邻的后面的所有元素

prev([expr])：查找紧邻的上一个元素

**prevAll();**查找紧邻的前面的所有元素

parent([expr])：查找当前元素的父元素

siblings([expr])：查找所有同级兄弟节点（无论上下）





## 作业:使用jquery完成

```html

<style type="text/css">
body,ul,li{margin:0px;padding:0px;}
ul,li{list-style:none;}
body{font-size:12px;}
#dome{
	width:200px;
	height:230px;
	overflow:hidden;
	border:1px solid red;
	margin:50px auto;
	padding:0px 10px;
}
#dome li{padding:3px 0px;}
</style>






<script type="text/javascript">
//网页加载完成，调用匿名函数
var dome;
window.onload = function()
{
	//获取三个<div>的元素对象
	    dome = document.getElementById("dome");
	var dome1 = document.getElementById("dome1");
	var dome2 = document.getElementById("dome2");
	//将dome的高度，复制给dome1和dome2
	dome1.style.height = dome.offsetHeight + "px";
	dome2.style.height = dome.offsetHeight + "px";
	//将dome1的内容，复制到dome2中
    //innerHTML = html()
	dome2.innerHTML = dome1.innerHTML;
	//鼠标放上停止滚动，鼠标移开，继续滚动
	dome.onmouseover = function(){
						window.clearInterval(timer);
					  }
	dome.onmouseout = function(){
						timer = window.setInterval("start2()",500);
					   }
	//定时器
	var timer = window.setInterval("start2()",40);
}
function start2()
{
	//如果滚动上去的距离，等于任何一个<div>的高
	if(dome.scrollTop==dome.offsetHeight)
	{
		dome.scrollTop = 0;
	}else
	{
		dome.scrollTop++;
	}
}
</script>

  
  
  

<body>
<div id="dome">
	<div id="dome1">
		<ul>
			<li style="color:red;">2010考研英语大纲到货75折...</li>
			<li>权威定本四大名著（人民文...</li>
			<li>口述历史权威唐德刚先生国...</li>
			<li>袁伟民与体坛风云：实话实...</li>
			<li>我们台湾这些年：轰动两岸...</li>
			<li>畅销教辅推荐：精品套书50...</li>
			<li>2010版法律硕士联考大纲75...</li>
			<li>计算机新书畅销书75折抢购</li>
			<li>2009年孩子最喜欢的书>></li>
			<li>弗洛伊德作品精选集59折</li>
		</ul>
	</div>
	<div id="dome2"></div>
</div>
</body>
```

## 作业:图书商城参考案例,自己写个类似的

```html

<script type="text/javascript">
$(function(){
       //思考：给谁添加事件，添加什么事件，触发什么操作。
           /* $('ul li').mouseover(function(){
                    //触发的操作是，p标签隐藏，img标签显示
                     $(this).children('p').hide();
                     $(this).children('img').show(); 
            });
            $('ul li').mouseout(function(){
                    //触发的操作是，p标签显示，img标签隐藏
                     $(this).children('p').show();
                     $(this).children('img').hide();
            });
            $('ul li').mouseover(function(){
                    //触发的操作是，p标签隐藏，img标签显示
                     $(this).children('p').toggle();
                     $(this).children('img').toggle(); 
            });
            $('ul li').mouseout(function(){
                    //触发的操作是，p标签显示，img标签隐藏
                     $(this).children('p').toggle();
                     $(this).children('img').toggle();
            });
            $('ul li').hover(function(){
                    $(this).children('p').toggle();
                    $(this).children('img').toggle();
            });
            $('ul li').hover(function(){
                    $(this).children('p,img').toggle();
            });*/
             $('ul li').hover(function(){
                    $(this).children().toggle();
            });


});
</script>








<style type="text/css">
*{margin:0;padding:0;list-style:none;}
#all {width:300px;border:1px solid green;margin:50px auto;
padding:50px 0 0 0;
}
#all ul li{width:300px;line-height:30px;text-align:center;font-size:20px;border-bottom:1px dashed gray;}
#all ul li img{display:none;}
</style>









    <body>
        <div id="all">
                <ul>
                    <li>
                            <p>怎样在不为人知的情况 15.10元</p>
                            <img src="one.jpg" width="269" height="108"/>
                    </li>
                    <li>
                            <p>怎样在不为人知的情况 15.10元</p>
                            <img src="one.jpg" width="269" height="108"/>
                    </li>
                    <li>
                            <p>怎样在不为人知的情况 15.10元</p>
                            <img src="one.jpg" width="269" height="108"/>
                    </li>
                    <li>
                            <p>怎样在不为人知的情况 15.10元</p>
                            <img src="one.jpg" width="269" height="108"/>
                    </li>
                    <li>
                            <p>怎样在不为人知的情况 15.10元</p>
                            <img src="one.jpg" width="269" height="108"/>
                    </li>
                    <li>
                            <p>怎样在不为人知的情况 15.10元</p>
                            <img src="one.jpg" width="269" height="108"/>
                    </li>
                    <li>
                            <p>怎样在不为人知的情况 15.10元</p>
                            <img src="one.jpg" width="269" height="108"/>
                    </li>
                    <li>
                            <p>怎样在不为人知的情况 15.10元</p>
                            <img src="one.jpg" width="269" height="108"/>
                    </li>
                    <li>
                            <p>怎样在不为人知的情况 15.10元</p>
                            <img src="one.jpg" width="269" height="108"/>
                    </li>
                    <li>
                            <p>怎样在不为人知的情况 15.10元</p>
                            <img src="one.jpg" width="269" height="108"/>
                    </li>
                </ul>
        </div>
    </body>
```

## 作业:百度导航

```html
<script type="text/javascript">
$(function(){
        $('ul li div').fadeTo(200,0.5);
        //给谁添加事件，添加什么事件，触发什么操作
        $('ul li').mouseover(function(){
                //滑过之后，让p和div显示出来。
                //把li里面的div的透明度降低。
                $(this).children('p,div').stop().animate({'bottom':'0'},200);
        });
         $('ul li').mouseout(function(){
                //滑过之后，让p和div隐藏出来。
                $(this).children('p,div').stop().animate({'bottom':'-25'},200);
        });
});
</script>
  
  
  
  
  
  
  
  
  
<style type="text/css">
*{margin:0;padding:0;list-style:none;}
#all {width:752px;border:1px solid green;margin:50px auto;padding:10px 0 0 10px;}
#all ul {overflow:hidden;}
#all ul li{width:178px;height:125px;float:left;margin:0 10px 10px 0;position:relative;overflow:hidden;}
#all ul li p {width:178px;height:25px;line-height:25px;bottom:-25px;position:absolute;z-index:10;color:white;text-align:center;}
#all ul li div {width:178px;height:25px;bottom:-25px;position:absolute;z-index:9;background:black;}
</style>

  
  
  
  
  
  
  
    <body>
        <div id="all">
                <ul>
                    <li>
                            <img src="one.jpg" width="178" height="125"/>
                            <p>百度一下你就知道</p>
                            <div></div>
                    </li>
                    <li>
                            <img src="one.jpg" width="178" height="125"/>
                            <p>百度一下你就知道</p>
                            <div></div>
                    </li>
                    <li>
                            
                            <img src="one.jpg" width="178" height="125"/>
                            <p>百度一下你就知道</p>
                            <div></div>
                    </li>
                    <li>
                            
                            <img src="one.jpg" width="178" height="125"/>
                            <p>百度一下你就知道</p>
                            <div></div>
                    </li>
                    <li>
                            
                            <img src="one.jpg" width="178" height="125"/>
                            <p>百度一下你就知道</p>
                            <div></div>
                    </li>
                    <li>
                            <img src="one.jpg" width="178" height="125"/>
                            <p>百度一下你就知道</p>
                            <div></div>
                    </li>
                    <li>
                            <img src="one.jpg" width="178" height="125"/>
                            <p>百度一下你就知道</p>
                            <div></div>
                    </li>
                    <li>
                            <img src="one.jpg" width="178" height="125"/>
                            <p>百度一下你就知道</p>
                            <div></div>
                    </li>
                    
                </ul>
        </div>
    </body>
```



https://movie.douban.com/j/search_subjects?type=tv&tag=%E6%97%A5%E5%89%A7&page_limit=50&page_start=0





