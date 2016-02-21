title: 前端动态化
date: 2016-02-21 21:58:59
tags: react webpack front-end
---

之前做了了一个管理后台,用的还是那些老掉牙的bootstrap+jquery.交互方式还是以静态的为主,随便改个数据就全局刷新.感觉很 low,不过想想也就我们公司的内部人员用的,所以丑一点也无所谓, `稳定压倒一切嘛`  
直到后面,我发现了这种开发模型的有下面几个弊端

- __复用度不够__ 比如说我们在界面A上开发了一个组件,要在 B上用,就很不方便.
- __全局 CSS__ 可能因为我在移动开发的时候的观念先入为主了,所以我对那种把所有的 css 文件都放在一个`main.css`里面,然后用各种 prefix, postfix 命名来区分不同区域的class 做法总是难以接受.

直到上周末,我们业务发生修改.我想,是时候给前端加一些高级特性了,然后就开始重写整个前端框架.


# 引入 React

没有错,react 一直是我比较喜欢的技术.它在处理前端模块化的时候能起到非常不错的作用.关于 react 基本用法,这里就不说了(~~我也许懂得和你差不多~~).但是这里要着重强调下一个超级牛逼的liverload的[解决方案](https://gaearon.github.io/react-hot-loader/getstarted/),这个解决方案能够避免传统 livereload 的一些 side effect,比如说有的时候文件修改了但是网页没有刷新呀, 重新加载有延迟之类的.

# 引入 React router

有人说

> react是一款很好的开发框架,但是它却没有一个原生的 router.

于是就有了[react-router](https://github.com/reactjs/react-router). 他的做法是通过把后端的 router 转到前端来,从而达到更多的前端代码复用,同事也加快了跳转速度.因为通过 router 跳转,其实仅仅只是替换了Dom tree而已.  

```javascript
ReactDOM.render(
  (
    <Router history={reactRouter.browserHistory}>
      <Route path="/login" component={Login}/>
      <Route path="/" component={App}>
        <IndexRoute component={ReviewList}/>
        <Route path="review/list" component={ReviewList}/>
      </Route>
    </Router>
  ),
  document.getElementById('container')
);
```

看起啦大概是这样子. 但是你可能会困惑,前端路由是怎么保证连接的永久有效呢?  
要做到连接的永久有效,必然需要后端和前端配合起来进行

```javascript
app.get('*', function (request, response) {
  response.render('newIndex');
});
```

加上这个路由之后,就能够保证每次请求,都能够用同一个前端路由进行处理,这样子就保证了地址的永久有效.

# 引入 webpack 

webpack确实是特别帅的模块化工具.各种 loader 把css, json, jsx都转换成 javascript 进行加载.  
所以这之后,你在 javascript 代码里面就能通过这种方式引入 css 文件了

```javascript
import css from 'css/reviewList.css';
```

是不是很酷!更酷的事情是,你如果启用了`css-loader`中的 [module 功能](https://github.com/webpack/css-loader#local-scope),你还能生成局部的 css 命名文件,再也不用担心元素命名冲突了.


