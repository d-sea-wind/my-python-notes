# 1. git知识

```python
# 配置自己的账号和邮箱
git config --global user.name 'github账号的名字'
git config --global user.email 'github上的邮箱'
# 我自己的github连接
git config --global user.name 'DHF-code'
git config --global user.email '604197230@qq.com'
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





