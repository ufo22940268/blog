title: javascript中的属性
date: 2016-01-09 05:00:57
tags:
---

判断一个对象中是否有某个属性。有下面两种方法：

- `in`
- `hasOwnProperty`

### in

`in`会检查对象自有属性和原型链中的属性。所以在使用`for..in`的时候需要特别注意，__千万不要在不必要的时候遍历其原型链上的属性__。

    var triangle = {a:1, b:2, c:3};

    function ColoredTriangle() {
      this.color = "red";
    }

    ColoredTriangle.prototype = triangle;

    var obj = new ColoredTriangle();

    for (var prop in obj) {
        console.log("obj." + prop + " = " + obj[prop]); 
    }

    //Output: a: 1 b:2 c:3 color: red

### hasOwnProperty

`hasOwnProperty`就如名字一样，他只会检查对象自己是否有这个属性。


    var triangle = {a:1, b:2, c:3};

    function ColoredTriangle() {
      this.color = "red";
    }

    ColoredTriangle.prototype = triangle;

    var obj = new ColoredTriangle();

    for (var prop in obj) {
        if (obj.hasOwnProperty(prop)) {
            console.log("obj." + prop + " = " + obj[prop]); 
        }
    }

    //Output: color: red

--------------------------------

也许你会说，还有第三种方法`if (obj.a)`。 
没错，很多人都这么用。但是其实这种用法非常糟糕，javascript里面的布尔转换本来就很容易引发bug。  
比如：
    Boolean([]) //true
    Boolean({}) //true
    Boolean(0) //false
    Boolean(1) //true

所以还是不要偷懒，用`in`和`hasOwnProperty`来检查属性吧。
