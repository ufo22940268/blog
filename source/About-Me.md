title: 关于我
date: 2015-12-02 18:24:37
tags: 
---

- 性别: 男
- 学历: 本科
- Email: ufo22940268#gmail.com(s/#/@/)
- [github](https://github.com/ufo22940268)
- [stackoverflow](http://stackoverflow.com/users/674199/ccheng)
- [blog](http://www.bettycc.com/)
- 工具控
- 不翻墙会死星人  

## 技术栈

- 熟练语言: Javascript, Python, Vimscript, java
- 了解语言: Python,C,SHELL
- Web框架: Flask,Tornado,Bottle
- 数据库: Mongodb
- 版本管理: Git, Svn
- 前端框架: Bootstrap,React
- 前端工具: Gulp
- 单元测试: mocha, espresso, unittest
- 开发平台: Mac, Archlinux, 
- 开发工具: Webstorm, Android Studio, vim, emacs


## 工作经历

### 2014 - 2015

在__追书神器__负责Android客户端和服务器端的开发。

__服务器端__

* 服务器采用haproxy -> varnish -> express -> mongodb的设计架构，后端爬虫使用redis作为消息队列。__前端服务器最多的时候每秒钟处理7500个请求，数据库每秒钟处理1500次查询。每天处理请求3.6亿次。服务器正常工作时间99%以上。__
* 服务器监控上采用了New relic和Zabbix一起进行监控。用New relic监控数据库的瓶颈，优化数据的索引。用Zabbix创建自定义监控条目。
* 我为每一个接口都配套了对应的测试用例, 严格按照先写测试，再写代码的流程进行开发。因为原来一些数据库结构比较复杂，我设计了一个数据库自动填充引擎，自动生成数据。
* 我引入了jenkins作为CI，在发布版本的时候，jenkins会先跑完所有测试用例，发现测试用例没有问题之后再把代码上传到8台应用服务器上。无论是上线成功还是失败，都会发邮件到我的邮箱。
* 从async迁移到promise, 让接口更灵活。

__Android客户端__

* 完成界面全面升级，引入`Material Design`设计语言。
* 重构代码，消灭冗余。
* 引入gradle, 大量使用优秀的第三方库加快开发进度。
* 解决一些触发概率极低的bug，比如说万分之一的用户会在数据库版本升级的时候会奔溃。江西某地区服务器因为ISP对我们的服务器GZip进行重新压缩导致我们客户端在那边会显示错误内容。



### 2013 - 2014

在__51信用卡管家__负责Android和Python的开发。

__Android__

负责`51优惠`项目的开发，后来被合并到了`51信用卡管家`中。

__Python__

使用Python, 开发新的`51优惠`的后台来替换原有的基于java的后台。该后台主要完成商户信息的抓取和管理功能。


### 2011-2012

在[__潮流网络__](http://www.grandstream.cn/)负责GXP2200项目的开发。

GXP2200是一款基于Android 2.3上进行定制的SIP电话。我从这款产品的调研开始一直到全球发布。  

在团队中负责了
- UI Framework
- 通讯录
- 通话记录

### 大学

在学校里面参加一些电子商务竞赛，ACM竞赛等一些比赛。
