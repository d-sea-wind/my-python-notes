# HTML Lesson 3

## [表单介绍]

### 1.表单的概念
`这是京东的登录口`



 ![login_jd](images_3\login_jd.png)
表单主要`用来获取用户数据`的。

### 2、表单的工作原理
表单的制作大致分两个步骤：

```
前端表单页面的制作。
服务器端对表单数据的处理。
```
表单的工作原理:

>填写有表单的网页，单击某个按钮提交表单。
>服务器上有专门的程序(Python程序或者其他PHP语言)，对提交的表单数据进行验证。
>如果验证通过，服务器会返回一个成功的消息。
>如果验证失败，服务器会返回一个失败的消息。

### 3.表单结构

```
<form name="login"  method="post" action="http://www.xxxx.com/path" style='border:1px solid black'>
	<span>用 户 名 : </span><input type="text" name="username"  value="" placeholder='请输入账号'/>
    <br/>
	<span>登录密码:</span><input type="password" name="pwd"  value="" placeholder='请输入密码'/>
    <br/>
	<input type="submit" name="submit"   value="登录" disabled />
</form>
```
<form name="login"  method="post" action="login.php" style='border:1px solid black'>
	<span>用 户 名 : </span><input type="text" name="username"  value="" placeholder='请输入账号'/>
	<br/>
	<span>登录密码:</span><input type="password" name="pwd"  value="" placeholder='请输入密码'/>
	<br/>
	<input type="submit" name="submit"   value="登录" disabled/>
</form>











注意事项：
所有表单数据传给服务器的话，必须要有`<form>`标记。
如果哪一个表单元素的值不想传到服务器的话，可以不写`name`属性。

### 4.form标记——块元素

```
name：表单名称。用来区分不同的表单，JS可以通过name的值，对表单进行前端的验证。
method：表单数据的发送方式，取值：get和post
action：指定表单数据的处理程序。一般是服务器端的脚本程序(PHP/Python)。如果为空，则提交给自己来处理。
enctype：表单数据的一个加密(编码)方式。enctype属性只能在 method = post 的表单中。
	application/x-www-form-urlencoded   所有字符都进行加密，这种方式不能上传附件
	multipart/form-data //只对附件进行加密码(编码)，不对普通字符进行编码，如果上传文件，必须使用该值。
```

### 5.GET方法和POST方法
#### (1)GET提交方法(表单的GET方式不常用)
GET提交的表单，它是把表单中的数据(名称=值)，追加到action处理程序的后面，向服务器发送。
GET提交的表单数据，是在地址栏显示的。

```
https://passport.jd.com/new/login.aspx?ReturnUrl=https%3A%2F%2Fwww.jd.com&username=123&pwd=789;
```
注意事项：
```
action处理程序文件名和表单提交数据之间用“?”隔开。
表单元素名称和元素的值之间用“=”隔开。
多个表单的(名=值对)之间用“&”隔开。
```
`可以手动往地址栏添加参数`


GET提交方法的特点：

```
相对来说不太安全，因为密码不应该显示在地址栏。
不能传递海量数据，因此地址长度有限制。url字符最大长度65535
最大不能超过4kb chrome8k
不能上传附件。
```
注意：`只要是通过地址栏，向服务器传数据的，一定是GET传递方式。`



#### (2)post提交方式
POST方式直接将表单数据发给了服务器，`不会在地址栏显示`。
POST的特点

```
相对来说比较安全。包传递
可以传递海量数据，长度没有限制。
可以上传附件。
```
注意：`POST方式只能用在表单中，其它地方不会用来。`



## [表格和表单的嵌套顺序]


```
<form name="form"  method="post" action="">
	<table width='50%' style='border:1px solid #ccc'>
		<tr>
			<td width='80' align='left'>用户名:</td>
			<td><input type="text" name="username" value="" placeholder='请输入账号'/></td>
		</tr>
		<tr>
			<td align='left'>密码:</td>
			<td><input type="password" name="password" value="" placeholder='请输入密码'/></td>
		</tr>
	</table>
</form>
```

## [表单中的各元素]
### 1.单行文本域：用户名、地址、电话、邮箱等
语法格式：`<input type = “text” 属性 = “属性值” />`
常用属性:

```
type：元素的类型。取值：text、password、radio、checkbox、button、submit、reset等。
name：表单元素的名称。可以包含a-z、A-Z、0-9、_这些符号，但不能以数字开头。
value：元素的值。
size：文本框的长度，以字符为单位。
maxlength：最多可以输入的字符数
readonly：只读属性。如：readonly = “readonly”
disabled：禁用属性。如：disabled = “disabled”
```
注意：`单行文本框是有长度限制的，最多只能输入255个字节`。
```
账号:<input type="text" name="username" value="请输入账号" placeholder='请输入账号'/>
```
账号:<input type="text" name="username" value="请输入账号" placeholder='请输入账号'/>



### 2.单行密码框
语法格式：`<input type = “password” 属性 = “属性值”  />`
常用属性:

```
type：元素的类型。
name：元素的名称
value：元素的值
size：密码框的长度，以字符为单位
maxlength：最多可以输入的字符数
readonly：只读属性。如：readonly = “readonly”
disabled：禁用属性。如：disabled = “disabled”
```

密码:<input type="password" name="password" value="123456" placeholder='请输入密码'/>



### 3.单选按钮
语法格式：`<input  type = “radio” 属性 = “属性值” />`
常用属性:

```
type：元素类型
name：元素名称
value：元素的值
checked：是否默认选中。如：checked = “checked”
```
注意：`单选按钮是一组相互排斥的，名称应该一样，但提交的值只能是其中一个`。



```
性别:<input type="radio" name="sex"  value="1" checked>男&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="sex"  value="0">女
```
性别:<input type="radio" name="sex"  value="1" checked>男&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="sex"  value="0">女



### 4.复选框

语法格式：`<input  type = “checkbox” 属性 = “属性值” />`
常用属性:

```
type：元素类型
name：元素名称
value：元素的值
checked：是否默认选中。如：checked = “checked”
```
注意：`复选框也是一组选项，名称必须一致。可以全选，也可以都不选
```
兴趣爱好:
<input type="checkbox" name="hobby[]"  value="1" checked>打游戏
<input type="checkbox" name="hobby[]"  value="2">看书
<input type="checkbox" name="hobby[]"  value="3">看姑娘
<input type="checkbox" name="hobby[]"  value="4">泡吧
```
兴趣爱好:
<input type="checkbox" name="hobby[]"  value="1" checked>打游戏
<input type="checkbox" name="hobby[]"  value="2">看书
<input type="checkbox" name="hobby[]"  value="3">看姑娘
<input type="checkbox" name="hobby[]"  value="4">泡吧
注意:`复选框的name后面要带[],是一个数组.`



### 5.下拉列表
`<select>`标记的属性

```
name：元素的名称。
```
`<option>`标记的属性

```
value：元素的值
selected：是否默认选中。如：selected = “selected”
```


```
想去什么地方旅游:
<select name="dot">
	<option value="">..请选择</option>
	<option value="1">巴厘岛</option>
	<option value="2">马尔代夫</option>
	<option value="3">巴黎</option>
	<option value="4">悉尼</option>
	<option value="5">千锋</option>
</select>
```
想去什么地方旅游:
<select name="dot">
	<option value="">..请选择</option>
	<option value="1">巴厘岛</option>
	<option value="2">马尔代夫</option>
	<option value="3">巴黎</option>
	<option value="4">悉尼</option>
	<option value="5">千锋</option>
</select>



### 6.文本区域
描述：使用文本区域来存放大段的文本。
语法：`<textarea  属性 = “属性值”></textarea>`
常用属性:

```
name：元素名称
value：元素的值，不能直接给<textarea>元素添加value属性。
cols：宽度，是多少个字符宽。
rows：几行的高度。
```
提示：默认文本内容的应该放在`<textarea>`和`</textarea>`之间。
注意：`你不能直接给<textarea>加一个value属性，不可以。可以通过JS来操作value中的内容`。



```
输入你的留言:<br/>
<textarea name="info" rows="10" cols="50" value="" style='resize: none;'>..请输入你的信息</textarea>
```
输入你的留言:<br/>
<textarea name="info" rows="10" cols="50" value="" style='resize: none;'>..请输入你的信息</textarea>

多学一招:`style='resize: none;'`让文本框不能被拖动;



### 7.隐藏域
描述：看不见的表单元素，可以用它来传递一些值，这些值又不想让客户看见。
语法：`<input  type = “hidden”  name = “”  value = “”  />`

```
<input type='hidden' name='hidden' value='123'>

#CSRF攻击  钓鱼网站
```
注意:`隐藏域是肉眼无法识别的`



### 8.上传文件域
语法格式：`<input  type = “file”  属性 = “属性值”  />`
常用属性:

```
name：元素的名称。
value：元素的值，应该是上传的文件名称。
```
注意：基于安全方面的考滤，value属性是只读属性。
```
<form name="uploadFile" method="post" action="upload.php" enctype="multipart/form-data">
	<input type="file" name="upload"  id="" value=""/>
</form>
```
<form name="uploadFile" method="post" action="upload.php" enctype="multipart/form-data">
	<input type="file" name="upload"  id="" value=""/>
</form>


多学一招:文件上传的方式只能是`post`,`form`表单必须要多加一个属性和值`enctype="multipart/form-data"`



### 9.表单中的各种按钮
提交按钮：提交表单。如：`<input  type = “submit”  value = “提交表单”  />`
重置按钮：重新填写。如：`<input  type = “reset”  value = “重新填写”  />`
图片按钮(不常用)：指定图片的路径，功能也是提交表单。如：`<input type="image" src="images/btn02.png" />`
普通按钮：不具备任何功能，一般要绑定JS程序，来实现各种功能。

```html
<input type='button' name='button' value='按钮' />
<button>按钮</button>
```

```
打印网页：<input type="button" value="打印窗口" onclick="javascript:window.print()" />
弹出一个对话框：<input type="button" value="弹出提示" onclick="javascript:window.alert('你好！')" />
```
打印网页：<input type="button" value="打印窗口" onclick="javascript:window.print()" />
弹出一个对话框：<input type="button" value="弹出提示" onclick="javascript:window.alert('你好！')" />
`onclick`是当鼠标点击时会发生的事件;

```
<input type="submit" id="" value="提交表单">
<input type="reset" value="重置">
<input type="image" src='images_3/button.png' >
```
<input type="submit" name="submit"  id="" value="提交表单">
<input type="reset" value="重置">
<input type="image" src='images_3/button.png' onclick="javascript:window.alert('你点我干嘛???')">

```html
前端代码的测试网站:www.httpbin.org
```







