title: 论RTFM的重要性
date: 2016-02-17 08:00:08
tags:
---

伟大的软件工程师[stormslowly](https://github.com/stormslowly)曾经说过

> 80%的编程问题能通过看文档解决

可是我已经在码农这条路上走了5年了,前天还是因为没有仔细看文档,在mongodb的replica的配置上卡了一个上午.  我本来以为我是一个老司机,可以不用仔细看文档,但是太天真了,`too naive`.

## 之前的错误

- 看文档只看自己认为有用的部分,然后就开始实践.
   * __解决方案__ 对于任何新技术,都需要全篇*浏览*文档,明白总体的架构.不求掌握每个细节,但是要对基础架构有个总体了解,然后再开始操作.因为事先对总体架构有一个了解,那么在实现的过程中碰到问题,也就不会没有头绪,到google上搜索起来也会更加有目的性.

- 碰到问题,急于google
    * __问题分析__ google看起来是解决问题的最直接,简单的方案.但是这不易于自己对架构的理解.
    * __解决方案__ 碰到问题应该按照下面顺序来解决
        1. 搜索文档
        2. Google 搜索
        3. 问人

        如果这个流程走完了,问题还没有解决.那么再次从a开始循环.
