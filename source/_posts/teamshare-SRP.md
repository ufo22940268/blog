title: teamshare-SRP
date: 2015-10-30 11:56:45
tags:
---

# SRP

SRP is short for single responsible principle. It decribes when we build software, we should make class have only one reason to change. When achived this, it will help us to seprete concern. It doesn't mean a method should do only one thing, but only have one reason to change.

### Code example

```Object-c

@implement Rectangle 
- (void) draw
{
    code
}

- (CGFloat)area
{
    code
}
@end
```

If we change the draw style, the `Rectangle` will be changed. If area calculating algorithm changes, it also will be changed.


Better design:

```Object-c
@implement Rectangle
- (void) draw
{
    code
}
@end

@implent GeometricRectangle
+ (CGFloat)area:(Rectangle *)rect
{
    code
}
@end
```

### What is responsibility

Motive for changing a class. If you can think of more than one motive for changing a class, then that class has more than one responsibilty.

```Object-c
@interface Modem
{
    - (void)dial:(NSString)number;
    - (void)hangup;
    - (void)send:(NSString)singleCharacter;
    - (void)recv;
}
```

We can sperate it into two category. One is connection. So dial and hangup belows to this category. The other is data communication. It contains send and recv.

