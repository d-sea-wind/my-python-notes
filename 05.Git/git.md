# 1. git知识

```python
# 配置自己的账号和邮箱
git config --global user.name 'github账号的名字'
git config --global user.email 'github上的邮箱'
# 我自己的github连接
git config --global user.name 'DHF-code'
git config --global user.email '604197230@qq.com'
# 另一个账号
git config --global user.name 'd-sea-wind'
git config --global user.email '17855370071@163.com'
# git常用命令
git init	# 初始化一个仓库
git add 	# 添加指定的修改过的文件到暂存区
git commit 	# 将暂存区的修改提交到本地仓库
git push 	# 将本地仓库提交推送到远程仓库
git pull 	# 将远程仓库提交拉取到本地仓库，同时将代码与本地仓库合并
git clone 	# 将远程仓库完整下载到本地
git remote 	# 管理与远程仓库的对接方式
git reset	# 将暂存区的内容撤出/重置版本
git checkout# 切换分支/代码还原/代码回滚
git status	# 查看当前代码状态
git branch	# 分支管理
git merge 	# 合并分支
git	log		# 查看提交历史
git config	# 管理本地配置
git diff	# 差异对比
git blame   # 检查每行代码最后一次是谁修改的
git fetch 	# 将远程仓库提交拉取到本地仓库 
# 以下常用命令
git init 仓库名 # 初始化一个仓库
git add .	# 添加指定的修改过的文件到暂存区
git status	# 查看当前代码状态
git checkout -b 分支名 	# 切换分支的时候并把分支创建出来
git push -u origin 分支名	# 推送什么分支就写什么分支名
git merge 分支名			# 合并分支
git branch -D 分支名		# 删除分支
git tag 版本号				# 打标签
git commit -m "项目描述"    # 提交并说明

# 创建要忽略的文件 .gitignore
vim .gitignore
	*.pyc
    *.log
    *.sqlite3
    .DS_Store
    .venv/
    .idea/
    __pycache__/	
# 产生秘钥——公钥和私钥
ssh-keygen	#一路回车不要写（采用非对称的加密）
ls ~/.ssh/id_rsa*
# windows系统中秘钥存放地
/c/Users/Administrator/.ssh/id_rsa		# 私钥 /c/Users/Administrator/.ssh/id_rsa.pub	 # 公钥
# linux系统中秘钥存放地
/home/dh/.ssh/id_rsa  		# 私钥
/home/dh/.ssh/id_rsa.pub	# 公钥

```

# 2. 虚拟化环境创建(linux系统)

```python
1.安装		
	pip install virtualenv
2.创建虚拟环境  
	cd ~/项目文件夹
	virtualenv .xxx
3.激活虚拟环境
	source ~/项目文件夹/.xxx/bin/activate
4.查看虚拟环境
	pip freeze 第三方安装包
	pip list   系统安装包
	虚拟环境迁移
		迁出：pip freeze > requirements.txt
		迁入：pip install -r requirements.txt
5.退出虚拟环境
	deactivate
```



# 3.工作中常用的git命令

```python
# 创建新仓库
git init 	# 在当前目录新建一个Git代码库
git init [project-name]	# 新建一个目录，将其初始化为git代码库

# 克隆远程仓库
git clone [url]	# 克隆一个项目和它的整个代码历史(版本信息)

# 查看分支
git branch 		# 查看当前分支
git branch -a 	# 查看所有分支

# 查看状态
git status	# 查看代码状态,有冲突解决冲突

# 切换分支
git checkout [分支名] # 切换到指定的分支上
git checkout 版本id 	# 回退到指定ID的版本

# 拉取到本地
git pull 	# 将远程仓库提交拉取到本地仓库，同时将代码与本地仓库合并

# 推送到远程
git push 	# 将本地仓库提交推送到远程仓库

# 回退
git reset –hard HEAD ^  	# 回退到上个版本
git reset –hard HEAD ^^		# 回退到上上个版本
git reset 文件名			  # 从暂存区中移除

# 添加到暂存区
git add 	# 添加指定的修改过的文件到暂存区

# 将暂存区的修改提交到本地仓库
git commit -m "提交说明"	# 将暂存区的修改提交到本地仓库

#
```



# 4. 个人总结

> 当matser主分支被别人更新了，我开发的分支拉取master更新部分

```python
# 1. 查看一下master是否更新了
git pull
# 2. 切换到master主分支
git checkout master
# 3. 把远程master仓库拉取到本地
git pull
# 4. 在切换到自己的分支
git checkout 自己分支名
# 5. 在自己分支上合并主分支
git merge master
# 6. 查看一下冲突(最好执行一下)
git status
# 7. 解决冲突部分
xxxxxx
# 8. 把解决的部分添加到暂存区
git add 冲突文件
# 9. 把暂存区更新到本地仓库
git commit -m "本地提交说明"
# 10. 把本地仓库推送到远程仓库
git push
```

> git 修改远程分支名称

```python
1.首先 git branch -m 旧分支名 新分支名

2.其次 git push --delete origin 旧分支名

3.将新分支名推上去 git push origin 新分支名

4.将新本地分支和远程相连 git branch --set-upsteam-to origin/新分支名
```

> git 打tag标签

```python
1.选择所要在哪个分支上打标签
git checkout 分支名
2.查看所有标签
git tag
3.本地打新标签
git tag <tag name>  
// 或者
git tag <tag name> b04b189b8249e74a363b2bec0bfae53ae7441fd7 // 在某个commit上打tag
4.本地推送到远程
git push origin <tag name>	// 推送一个标签到远程
git push origin --tags		// 推送全部未推送的本地标签
====================其他的git命令====================
1.删除本地标签
git tag -d <tag name>
2.并删除远程标签
git push origin :refs/tags/<tag name> //本地tag删除了，在执行该句，删除远程tag
3.附注标签
git tag -a <tag name> -m <message>
eg:git tag -a V1.1.0 -m 'v1.0.0 release' 
```



