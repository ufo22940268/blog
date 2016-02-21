title: Node升级到4.0
date: 2016-01-14 10:23:30
tags: node
---

看到各种开源项目都纷纷用上了`es6`，包括`express`, `mongoose`等等。我感觉也是时候升级公司的项目了。

## 升级Node

直接使用TJ大神的[n](https://www.npmjs.com/package/n)来安装node。  

- 如果你想升级到最新的stable的版本
        n stable 

- 如果你只是想升级到LTS
        n 4.2.4


## 碰到依赖问题

我碰到的是`to-markdown`不能正常`install`,  报的是`gyp-build`的错。

### 解决方案一

放狗去网上搜了一圈之后，发现[node-gyp-install](https://github.com/mafintosh/node-gyp-install)这个库能够解决这个问题。然后按照`README`操作一番，mac上能够正常跑过所有测试用例了。  
但是很遗憾，在服务器上的`CentOS`上还是没法正常install。

### 解决方案二

看了下`to-markdown`的文档，发现其__v2.0__版本能够支持`node 4`。然后升级完成之后服务器上的问题也解决了。


