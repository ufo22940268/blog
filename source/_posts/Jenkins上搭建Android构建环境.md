title: Jenkins上搭建Android构建环境
date: 2015-11-19 08:28:45
tags: CI Jenkins Android
---

每天要打包给别人看实在太麻烦，所以就用jenkins搭了一个Android CI系统。可以用来跑测试用例，可以用来编译项目，然后把生成的包发到相关人员那里去。以后产品上线了，还可以编译各种渠道包。

## 搭建流程

### 搭建jenkins

搭建方法看[这里](https://jenkins-ci.org/), 可以按照官网的做，也可以求省心下一个docker一次搞定。

### 在服务器上搭建android构建环境

首先说明一点，我是使用gradle的方式来打包的，如果你们是用ant或者maven来打包，那么这个教程并不适合你。

- **下载 android sdk**

从[android官网](http://www.android.com/)上下载sdk的zip包, 然后解压到服务器上。

然后执行：

```shell
android update sdk --no-ui 
```

来下载所有sdk相关的信息。

如果你的服务器在国内，那么这个下载过程可能会被墙，这时候你需要在本地搭建一个http代理。因为我只有shadowsocks，所以我通过shadowsocks+privoxy的方式来搭建。  
假如说你的代理的端口是8118（privoxy的默认端口就是这个）, 那么你就可以通过执行下面的命令来使用代理

```shell
android update sdk --no-ui --proxy-host 127.0.0.1 --proxy-port 8118
```

过了很久之后，这时候你的sdk就搭建好了。但是如果你的服务器用的64位的，这时候你应该会碰到aapt没法执行的问题。原因是aapt需要对应的32位的库才能运行。这时候你需要去网上搜怎么在你对应的平台下安装zlib库。

- **安装gradle**

这里需要强调一点，我在网上发现了JakeWarthon大神一个牛逼的[项目](https://github.com/JakeWharton/sdk-manager-plugin)，可以帮你下载gradle中缺少的一些系统级的依赖。应该能够给你在搭建gradle环境中减少不少时间。


### 配置jenkins

- **创建项目**

和一般项目一样，创建一个`自由软件风格`的项目，然后在构建选项里面输入你的构建命令， 比如我就是`gradle assembleProductionDebug`。

- **配置webhook**

如果你需要在你有代码push的时候就执行构建，那么在项目的webhook那一栏输入一个自定义的token。同时这时候jenkins会给你一个url, 你把这个url填入到github或者gitlab的webhook里面去，然后你每次push代码，服务器就能够自动执行构建了。

- **电子邮件**

在编译完成之后，我们希望把生成的apk发送到别人的邮箱里面。这时候需要安装Ext-Email plugin， 然后在plugin的attachment里面填上生成apk文件的地址。   
如果你还希望把你的修改日志也发送在邮件里面，那么可以在content里面加上下面这一段:

```
修改日志:
${CHANGES, showPaths=true, format="%a: %r %p \n--\"%m\"", pathFormat="\n\t- %p"}

$DEFAULT_PRESEND_SCRIPT
```

## 最终效果

下面就是最终用户收到的邮件：

![](/QQ20151119-0@2x.png)

