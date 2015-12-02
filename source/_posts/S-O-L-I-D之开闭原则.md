title: S.O.L.I.D之开闭原则
date: 2015-11-06 11:26:04
tags: [团队分享, CleanCode]
---

## 开闭原则

### 什么是开闭原则

`在面向对象编程领域中，开闭原则规定“软件中的对象（类，模块，函数等等）应该对于扩展是开放的，但是对于修改是封闭的”`

换句话说，开闭原则做了一件很神器的事情：在我们对软件功能修改的时候, 并没有对原来的类进行修改，但是确实对软件的功能进行了修改。


### 如何做到开闭

**模板方法**

在android里面所有的视图类都集成于View。

View的结构如下：

```java
class View {

    void draw(Canvas canvas) {
        //code
        onDraw(canvas);
        //code
    }

    void onDraw(Canvas canvas) {
    }
}
```

这时候你就可以继承View，来绘制你所需要的图形。

```java
class MyView extends View {

    @Override
    void onDraw(Canvas canvas) {
        drawTriangle();
    }
}
```

**装饰者模式**

java中的io类。

如果你需要对一个InputStream加上从文件读取的功能，那么就用FileInputStream进行包装

```java
InputStream stream = new InputStream()
FileInputStream fis = new FileInputStream(stream);
```

inputStream的代码逻辑没有被改写，但是你现在获取到了新的，对文件操作的能力。

### 开闭原则的好处

更好的保证了类的内聚，在修改代码之后不需要对类进行重新编译。

