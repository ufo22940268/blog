title: mongoose中populate
date: 2015-11-05 10:50:51
tags: Node.js
---

之前一直很想不通mongoose里面的populate到底做了什么事情，然后用populate和自己手动`findById`有什么区别。因为mongodb里面没有join，我一直希望populate能够带来效率上的提升。

### Populate源码

地址在[这里](https://github.com/Automattic/mongoose/blob/c76effbf2c9a6f7f1e6e7cc359a1b7d04a526e14/lib/model.js#L2264)

```javascript
    mod.Model.find(match, select, mod.options.options, next.bind(this, mod.options, assignmentOpts));
  }

  function next(options, assignmentOpts, err, valsFromDb) {
    if (err) return promise.resolve(err);
    vals = vals.concat(valsFromDb);
    if (--_remaining === 0) {
      promise.resolve(err, vals, options, assignmentOpts);
    }
  }
```

我们就看最后的这几行。

从方法体上，我们可以看到pouplate是通过`cb`来进行回调的。但是，由于中间用了promise对`cb`进行了一次封装，所以最终的回调发生在next函数中的`promise.resolve(err, vals, options, assignmentOpts);`

这样子，问题就变得简单了。populate的实现过程是，首先组件好对待populate的信息的查询和排序操作，然后用`mod.Model.find`进行第一次查询，查询成功之后，next方法会被调用到，然后实现数据的填充。

## 结论

populate也就是普通的对每个条目的查询，效率和手动查询，然后再在替换并没有提升。所以以后大家在对mongoose populate和手动populate进行选择的时候就不用纠结了啊。
