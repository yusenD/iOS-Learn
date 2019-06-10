# Learn Task 3

## Notification

对象间的通信用一种Notification的盲通信方式进行。

### NSNotificationCenter

方法：
```
//订阅广播
-(void)addObserver:(id)observer //想要收听广播的对象
selector:(SEL)methodToInvokeIfSomethingHappens //observer中的方法，当广播出现的时候会调用它
name:(NSString *)name //广播站的名字 
object:(id)sender //表示是否只收听指定对象发出的广播，如果不是用nil

//收到广播调用的方法
-(void)methodToInvokeIfSomethingHappens:(NSNotification *)notification
{
    notification.name //广播站的名字
    notification.object //向你发送这个通知的对象
    notification.userInfo //这是一个ID，取决于广播站，很多时候是一个nil
}

//取消订阅广播，关掉广播
[center removeObserver:self]; 
[center removeObserver:self name:name object:nil];

```

举个例子🌰：
```
//系统通知：字体变动

[[NSNotificationCenter defaultCenter] addObserver:self 
selector:@selector(preferredFontsChanged:) 
name:UIContentSizeCategoryDidChangeNotification 
object:nil];
    
-(void)preferredFontsChanged:(NSNotification *)notification{
    [self usePreferredFonts];
}

-(void) usePreferredFonts{
    self.body.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.header.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
}


```



## 手势识别

UIGestureRecognizer：手势识别器，包括点击、捏合等等，是一个抽象类，无法实例化。

举个例子🌰：

```

- (void)setPannableView:(UIView *)pannableView{
    _pannableView = pannableView;
    UIPanGestureRecongnizer *pangr = [[UIPanGestureRecognizer alloc] initWithTarget:pannableView action:@selector(pan:)];
    [pannableView addGestureRecognizer:pangr];
}

```

### 属性和方法

以UIPanGestureRecognizer为例，提供了三个主要方法：

```
- (CGPoint)translationInView:(UIView *) aView; //触摸移动距离
- (CGPoint)velocityInView:(UIView *) aView; //手指动的速度
- (void)setTranslationg:(CGPoint)translation inView(UIView *)aView; //对移动距离重置
```

继承自UIGestureRecognizer，提供了下面的属性：

```
@property(readonly) UIGestureRecognizerState state; //继承属性，有Began,Changed,Ended等状态，和Android类似
```







## 持久化：NSUserDefaults

与SharedPreference类似。