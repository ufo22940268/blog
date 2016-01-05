title: 关于Promise串行
date: 2016-01-05 15:07:13
tags:
---

为了避免`Callback hell`, 我在很早的时候就开始用`Promise`。因为现在开发主要还是在es5下进行，所以我选择了一个第三方的Promise实现: [bluebird](bluebirdjs.com/docs/getting-started.html)。

其他用下来都还好，基本上[async](https://github.com/caolan/async)下能完成的任务，bluebird也能比较出色地完成，直到我在做串行执行任务的时候才碰到了问题。

在做网页抓取的时候，我用了bluebird中的[props](http://bluebirdjs.com/docs/api/promise.props.html)。

```javascript
  return pageParser.html(url, {encoding: 'gbk'})
    .then(function ($) {
      return Promise.props({
        title: itemParser.getTitle($),
        markdown: itemParser.getMarkdown($, itemParser.getDescLink),
        purchaseLink: url,
        img: fixImageUrl($('#J_ImgBooth').attr('src')),
        gallery: itemParser.getGallery($).map(fixImageUrl),
        price: itemParser.getPrice($, url),
        originalPrice: itemParser.getOriginalPrice($),
      });
    })
```

其中__itemParser__中的, __getPrice__和__getGallery__方法返回的都是Promise。

这样子写，代码看起来挺好的，除了一个问题,我没办法让__props__串行执行。原因是因为Promise在构建的时候其实就已经开始执行方法体里面的代码了，具体细节可以看[debuggability](https://github.com/petkaantonov/bluebird/blob/master/src/debuggability.js#L182)。

那么这是不是意味着我们永远都没法在Promise里面串行执行了吗？当然不是。

bluebird提供了下面四个方法支持了串行执行:

- __map__ 需要执行concurrency为1. 
- __mapSeries__
- __each__
- __reduce__

例子如下:

```javascript
var Promise = require('bluebird');

var funcs = Promise.resolve([500, 100, 400, 200].map((n) => makeWait(n)));

funcs
  .mapSeries(iterator)  // logs: 500, 100, 400, 200
  .then(console.log)    // logs: [500, 100, 400, 200]

funcs
  .map(iterator, {concurrency: 1})       // logs: 500, 100, 400, 200
  .then(console.log)    // logs: [500, 100, 400, 200]

function iterator(f) {
  return f()
}

function makeWait(time) {
  return function () {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        console.log(time);
        resolve(time);
      }, time);
    });
  };
```

这里非常需要注意的一点是，__map__只有在处理__handler__返回的Promise的时候concurrency才会生效。  
比如说下面这段代码是不会串行执行的:

```javascript
Promise.map([makeWait(1000)(), makeWait(1000)()], function(){});
```
