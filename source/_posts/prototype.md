title: javascript中的原型链
date: 2016-01-07 17:21:36
tags: javascript
---

今天来总结下javascript中的原型。

## 继承

### 方式一

    util.inherits(Class, SuperClass)

node官方推荐的集成机制。

### 方式二

    function Mamal() {}
    Mamal.prototype = Object.create(Animal.prototype); // 或者 new Animal()
    Mamal.prototype.contructor = Mamal

这里需要注意，`Mamal.prototype.contructor = Mamal`对集成并没有什么影响。只是单纯地保持对父类的一个引用。

### 构造方法

上面两种方法只继承了原型链，如果你希望集成*构造方法*的话,还需要加上下面代码：

    function Mamal() {
        Animal.apply(this, arguments);
    }

如果你是用*方法一*进行集成的话，那么你还可以这么写，因为`inherits`会自动把父类的构造方法赋值给`_super`

    function Mamal() {
        Mamal._super.apply(this, arguments);
    }

## 理解原型链

javascript的object里面有一个保存着一个属性`__prop__`。这个属性指向了父类的原型。  需要注意的是，`__prop__`仅仅为了方便我们理解原型链而存在，在生产环境中不建议使用。

你可以通过[norfish](https://github.com/norfish/blog/wiki/%E6%B7%B1%E5%85%A5%E7%90%86%E8%A7%A3JavaScrip%E9%9D%A2%E5%90%91%E5%AF%B9%E8%B1%A1%E5%92%8C%E5%8E%9F%E5%9E%8B%E7%BB%A7%E6%89%BF)的代码理解

     // 声明 Animal 对象构造器
     function Animal(name) { 
        this.name = name;
     } 
     // 将 Animal 的 prototype 属性指向一个对象，
     // 亦可直接理解为指定 Animal 对象的原型
     Animal.prototype = {
        weight: 0, 
        eat: function() { 
            alert( "Animal is eating!" ); 
        } 
     }
     // 声明 Mammal 对象构造器
     function Mammal() { 
        this.name = "mammal"; 
     } 
     // 指定 Mammal 对象的原型为一个 Animal 对象。
     // 实际上此处便是在创建 Mammal 对象和 Animal 对象之间的原型链
     Mammal.prototype = new Animal("animal"); 
     // 声明 Horse 对象构造器
     function Horse( height, weight ) { 
        this.name = "horse"; 
        this.height = height; 
        this.weight = weight; 
     }
     // 将 Horse 对象的原型指定为一个 Mamal 对象，继续构建 Horse 与 Mammal 之间的原型链
     Horse.prototype = new Mammal(); 
     // 重新指定 eat 方法 , 此方法将覆盖从 Animal 原型继承过来的 eat 方法
     Horse.prototype.eat = function() { 
        alert( "Horse is eating grass!" ); 
     }
     // 验证并理解原型链
     var horse = new Horse( 100, 300 ); 
     console.log( horse.__proto__ === Horse.prototype ); 
     console.log( Horse.prototype.__proto__ === Mammal.prototype ); 
     console.log( Mammal.prototype.__proto__ === Animal.prototype ); 
     //原型链
     Horse-->Mammal的实例
     Mammal-->Animal的实例
     Animal -->Object.prototype

