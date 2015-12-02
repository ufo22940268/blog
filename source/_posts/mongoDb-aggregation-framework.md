title: 关于MongoDB上的aggregation framework的研究
date: 2015-12-02 08:34:23
tags: mongodb
---

在刚开始接触mongoDb的时候我就常常纠结在生产环境中该不该用aggregation, 会不会有性能的问题、aggregation的用处是什么。 
今天我就稍微总结下。

## 性能问题

aggregation的性能问题主要集中在aggregation能不能像其他操作一样使用index，以及sort操作的时候会不会在memory中进行。  
事实上，里面有两个操作能够使用到index，分别是$match和$sort。但是他们会有一些限制。

### $match

$match操作只有在pipline的开始的地方出现，才能够使用index。

举个栗子：

- Query0

```javascript
db.foo.aggregate([
{$match: {bar: 1}}
])
```

- Query1

```javascript
db.foo.aggregate([
{$group: {_id: $coo}},
{$match: {bar: 1}}
])
```

在上面两个查询中，只有Query0是能够使用到index的。Query1因为在match之前已经进行过一次group操作，所以match的输入已经不是原来的collection了，所以也就没法使用bar的index。

### $sort

$sort操作操作在$project, $unwind, $group这三个操作之前那么就可以使用index。换句话说，我们在使用的时候，应该尽可能吧$sort放在$limit和$match后面。

## 用途

aggregation诞生的主要目的为了分析用户数据。它可以利用pipline把用户数据的分析结果导出到一个collection里面，甚至你可以对导出的collection再次分析来得出新的结果(导出方法看[这里](https://docs.mongodb.org/manual/reference/operator/aggregation/out/))。这样子就能够很有效地避免在分析的时候影响生产环境。  
但是，通过上面关于性能的分析之后，我们可以得出其实aggregation可以用在其他对性能要求较高的领域。只要稍微注意操作符摆放的位置就可以了。
