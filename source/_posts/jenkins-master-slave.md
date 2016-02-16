title: Jenkins分布式部署
date: 2016-02-16 11:15:43
tags: Jenkins
---

Jenkins其实自带分布式特性.他的分布式是`Master/Slave`的模型.在`Master`上分配任务,然后在`Slave`或者`Master`上完成.

## 作用

这个特性带来两个好处
- 能够有效分单主节点上的压力,加快构建速度.
- 能够制定特定的任务在特定的主机上进行.

接下来我着重说下第二特性

比如说我们现在有一个情景,服务器的类型分为: `抓取服务器`, `应用服务器`, `Jenkins服务器`.
这时候,我们需要创建一个Jenkins的任务来完成定期的抓取工作,这时候如果我们在`Jenkins服务器`上创建,那么创建的任务只能够在本地运行.

这时候分布式的优点就体现出来了. 你可以按照下面的流程操作

### 添加ssh秘钥

保证Jenkins服务器能够通过ssh连接到抓取服务器.
在jenkins服务器上执行

    ssh-copy-id user@scraping-server-adddress.com

### 创建节点

进入`Jenkins服务器`后台, 然后`管理节点`-`创建节点`, 勾选`Dumb Server`(~~不勾选不让创建,具体信息可以在下一步填写~~).输入`抓取服务器`的地址,在`启动方法`中选择`Launch slave agents on Unix machines via SSH`.然后保存.

### 创建任务

按照普通的创建任务的方法创建一个Jenkins任务, 但是在`Restrict where this project can be run`中输入刚刚创建的节点的名字.

### 运行任务

点击构建任务.这时候你的任务应该只在`抓取服务器中运行`