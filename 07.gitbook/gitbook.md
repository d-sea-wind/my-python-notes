# gitboook

## 1.安装软件

安装node-v6.9.3-x64.msi

![node](.\img\node.png)

## 2.安装gitbook

```
在终端里面输入以下命令：
npm install gitbook-cli -g
```

## 3.目录结构介绍

+ 事先准备(这只是举个例子)

  ```
  1. 创建一个test文件夹
  2. 创建如下图的文件
  	1.创建README.md文件(整体介绍)Introduction
  	2.创建SUMMARY.md文件(目录结构)类似书的目录
  	3.创建chapter01.md
  ```

  test里面整体文件

  ![markdown](.\img\markdown.png)

  SUMMARY.md文件内容

  ![readme](.\img\readme.png)

+ 目录结构

  ```
  SUMMARY.md		目录结构
  README.md		整体介绍
  
  chapter01.md 	第一章
  chapter02.md	第二章
  chapter01		第一章详细(第一节、第二节)
  chapter02		第二章详细(第一节、第二节)
  ```

## 4.生成书

+ 进入目录

  ```
  cd test
  ```

+ 生成书

  ```
  gitbook build --gitbook=2.6.7
  ```

+ 效果样式

  + 在test目录下会生成_book的文件

  + 效果样式图

    ![效果图](.\img\效果图.png)

