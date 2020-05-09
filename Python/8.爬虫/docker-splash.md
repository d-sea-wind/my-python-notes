## Docker-splush

#### 1.什么是Docker？

![docker](G:\千峰教育\笔记\Typora\8.爬虫\img\docker.png)

Docker 是一个开源的应用容器引擎，遵从Apache2.0协议开源。

Docker 可以让开发者打包他们的应用以及依赖包到一个轻量级、可移植的容器中，然后发布到任何流行的 Linux 机器上，也可以实现虚拟化。

容器是完全使用沙箱机制，相互之间不会有任何接口（类似 iPhone 的 app）,更重要的是容器性能开销极低。

简单阐述：

```
DocKer一次构建可放在任何地方就可以运行，不需要进行任何改变DocKer 就类似于一个容器。这个容器就好像咱们常用的虚拟机一样，当我们虚拟机里面安装过VS、SQL、浏览器 ......  之后咱们就把虚拟机镜像备份下来、等到下一次需要重新搭一个环境的时候，就可以省去很多事情了，直接把备份的虚拟机运行起来，该有的就都有了，省去了很多事情。
在用DocKer的情况下，咱们可以直接把项目发布在DocKer容器上面进行测试，当项目需要正式上线的时候我们直接可以把做好的DocKer 镜像部署上去就行了，如果测试的好，就不必担心项目上正式版本的时候再出现什么问题了，（比如说 咱们的Confing 配置信息很多项目都是什么测试环境地址，正式环境地址的，但是用过DocKer之后就一个就行了）DocKer可以在 云、Windows、Linux 等环境上进行部署，就单说这一点就省去了我的很多费用、还有项目部署上线的风险,不必每次项目上线都留守一堆人才等着项目报错.
```

#### 2.Docker和虚拟机的区别？

![vm](G:\千峰教育\笔记\Typora\8.爬虫\img\vm.jpg)

![传统虚拟化技术9](G:\千峰教育\笔记\Typora\8.爬虫\img\传统虚拟化技术9.png)

##### （1）从下到上理解上图:

- 基础设施(Infrastructure)。它可以是你的个人电脑，数据中心的服务器，或者是云主机。
- 主操作系统(Host Operating System)。你的个人电脑之上，运行的可能是MacOS，Windows或者某个Linux发行版。
- 虚拟机管理系统(Hypervisor)。利用Hypervisor，可以在主操作系统之上运行多个不同的从操作系统。类型1的Hypervisor有支持MacOS的HyperKit，支持Windows的Hyper-V以及支持Linux的KVM。类型2的Hypervisor有VirtualBox和VMWare。
- 从操作系统(Guest Operating System)。假设你需要运行3个相互隔离的应用，则需要使用Hypervisor启动3个从操作系统，也就是3个虚拟机。这些虚拟机都非常大，也许有700MB，这就意味着它们将占用2.1GB的磁盘空间。更糟糕的是，它们还会消耗很多CPU和内存。
- 各种依赖。每一个从操作系统都需要安装许多依赖。如果你的的应用需要连接PostgreSQL的话，则需要安装libpq-dev；如果你使用Ruby的话，应该需要安装gems；如果使用其他编程语言，比如Python或者Node.js，都会需要安装对应的依赖库。
- 应用。安装依赖之后，就可以在各个从操作系统分别运行应用了，这样各个应用就是相互隔离的。

![docker-vm_20190824_071956](G:\千峰教育\笔记\Typora\8.爬虫\img\docker-vm_20190824_071956.jpg)

![docker虚拟化技术9](G:\千峰教育\笔记\Typora\8.爬虫\img\docker虚拟化技术9.png)

##### （2）从下到上理解上图:

- 基础设施(Infrastructure)。
- 主操作系统(Host Operating System)。所有主流的Linux发行版都可以运行Docker。对于MacOS和Windows，也有一些办法”运行”Docker。
- Docker守护进程(Docker Daemon)。Docker守护进程取代了Hypervisor，它是运行在操作系统之上的后台进程，负责管理Docker容器。
- 各种依赖。对于Docker，应用的所有依赖都打包在Docker镜像中，Docker容器是基于Docker镜像创建的。
- 应用。应用的源代码与它的依赖都打包在Docker镜像中，不同的应用需要不同的Docker镜像。不同的应用运行在不同的Docker容器中，它们是相互隔离的。

##### （3）对比虚拟机与Docker

Docker守护进程可以直接与主操作系统进行通信，为各个Docker容器分配资源；它还可以将容器与主操作系统隔离，并将各个容器互相隔离。虚拟机启动需要数分钟，而Docker容器可以在数毫秒内启动。由于没有臃肿的操作系统，Docker可以节省大量的磁盘空间以及其他系统资源。

说了这么多Docker的优势，大家也没有必要完全否定虚拟机技术，因为两者有不同的使用场景。虚拟机更擅长于彻底隔离整个运行环境。例如，云服务提供商通常采用虚拟机技术隔离不同的用户。而Docker通常用于隔离不同的应用，例如前端，后端以及数据库。

![vm和docker](G:\千峰教育\笔记\Typora\8.爬虫\img\vm和docker.png)

![vm-vs-docker](G:\千峰教育\笔记\Typora\8.爬虫\img\vm-vs-docker.png)

Size：

​	1.虚拟机中ubuntu所占内存：

![虚拟机内存](G:\千峰教育\笔记\Typora\8.爬虫\img\虚拟机内存.png)

 	2.Docker容器中ubuntu镜像文件所占内存：

![docker内存](G:\千峰教育\笔记\Typora\8.爬虫\img\docker内存.png)

Startup：        Docker在宿主机器的操作系统上创建Docker引擎，直接在宿主主机的操作系统上调用硬件资源，而不是虚拟化操作系统和硬件资源，所以操作速度快。        这个其实安装一个ubuntu的虚拟机和拉取一个Docker的ubuntu镜像文件，运行一下就知道了，区别很明显，虚拟机开一下大概得2分多钟，而Docker只需要2秒钟。Integration：        Docker的集成性要比VM好。这里面关于Docker集成的内容写的很好。https://blog.csdn.net/karamos/article/details/80124166

#### 3.Docker的用途？

（1）提供一次性的环境。比如，本地测试他人的软件、持续集成的时候提供单元测试和构建的环境。

（2）提供弹性的云服务。因为 Docker 容器可以随开随关，很适合动态扩容和缩容。

（3）组建微服务架构。通过多个容器，一台机器可以跑多个服务，因此在本机就可以模拟出微服务架构。

#### 4.Docker的安装？

（1）Ubuntu: https://docs.docker.com/install/linux/docker-ce/ubuntu/ 

（2）macOS: https://docs.docker.com/docker-for-mac/install/ 

（3）Windows: https://docs.docker.com/docker-for-windows/install/

#### 5.Docker中的基本概念？

（1）镜像：类似虚拟机镜像 

（2）容器：类似linux系统环境，运行和隔离应用。容器从镜像启动的时候，docker会在镜像的最上一层创建一个可写层，镜像本身是只读的，保持不变。

（3）仓库：每个仓库存放某一类镜像

![仓库](G:\千峰教育\笔记\Typora\8.爬虫\img\仓库.png)

#### 6.镜像，容器，仓库关系

![镜像仓库容器运行图](G:\千峰教育\笔记\Typora\8.爬虫\img\镜像仓库容器运行图.png)

#### 7.Docker的基本操作

1. docker login --help 终端必须是登陆状态

2. docker必须装镜像  docker search ubuntu

3. 下载镜像：docker pull ubuntu  默认docker下安装的是国外源

   安装后里面什么都没有   安全性越好  速度越快 

4. docker images  查看镜像

   docker run  -i -t --rm

   -i提供交互式环境

   -t 终端环境

   --rm  运行完之后自动删除容器

   docker run -it ubuntu

5. 查看当前系统版本

   cat  /etc/issue

6. 查看操作系统里有什么

   ls   ps

7.  apt update  更新

8. apt upgrade  

9. 举例说明安装后系统里有什么 vim  ssh

10. 查看容器   docker  container ls -a

11. history 历史纪录

12. 知名软件的官方镜像

    docker search  python

    docker search  nginx

13. 安装nginx：docker pull  nignx

14. 运行nginx：docker run -it nginx  nginx是直接运行到后台

    链接：1.命令大全（https://www.cnblogs.com/Csir/p/6888474.html）

    ​            2.学习网站（https://yeasy.gitbooks.io/docker_practice/content/）

#### 8.splash

```
服务器响应的数据，有很多都是对js进行解析，难度比较大，所以会使用seleniun进行抓取，但是selenium的执行速度太慢，所以可以使用splash，安装splash的难度非常大，所以需要借助docker
还有一种解析js的方法就是拼接字符串，解析速度快，但是难度比较大
解析速度： js解析 》 splash 》 selenium
使用频率： splash 》 js解析 》 selenium
```

链接: https://splash-cn-doc.readthedocs.io/zh_CN/latest/scrapy-splash-toturial.html


