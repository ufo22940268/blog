title: 加快Webstorm调试速度
date: 2015-12-21 16:44:22
tags:
---

你是不是已经受不了Webstorm屎一样的调试速度了。我用rmbp13', 发现开始调试需要几十秒时间。然后我想，也许是rmbp太慢了，然后换成imac5k, 结果发现还是一样慢。

不过我今天发现解决方案了。

你只需要在Webstorm里面的按`cmd+shift+a`, 在弹出的对话框中输入`Registry`, 进入注册表修改界面。然后往下找到`js.debugger.v8.use.any.breakpoint`, 然后禁它丫的。然后这时候你就会发现webstorm的调试速度和正常运行速度一样了！

-----------------------------------------------------

最后贴上我找到解决方案的[链接](https://github.com/nodejs/node-v0.x-archive/issues/9125)
