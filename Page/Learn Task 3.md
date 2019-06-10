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

## 多线程

iOS的多线程里，非常重要的一个概念是队列（queue），队列中的元素是一个个的block。

可以在主队列里面处理点击事件、UI操作等等，我们需要保证主队列不能堵塞，也就说是不能执行特别耗时的操作。 

### 属性和方法

* 执行一个block

```
dispatch_queue_t queue = ....;
dispatch_async(queue,^{});
```

* 获得主队列

```
dispatch_queue_t mainQueue = dispatch_get_main_queue();
NSOperationQueue * mainQueue = [NSOperationQueue mainQueue];
```

* 创建一个Queue

```
dispatch_queue_t otherQueue = dispatch_queue_create("name",NULL);//第一个参数的是Queue的命名，第二个参数表示这个Queue是串行还是并行。
```

* 在主队列调用方法

这个是一个NSObject里面的方法

```
-（void)performSelectorOnMainThread:(SEL)aMethod 
withObject:(id)obj
waitUntilDone:(BOOL)waitUnitDone;

这个方法相当于调用👇下面的方法：
dispatch_async(dispatch_get_main_queue(),^{/*call aMethod*/})
```

举个例子🌰
```
- (void)connect{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://.."]];
    NSURLSessionConfiguration *configuration;
    NSURLSession *session;
    
    //需要注意delegateQueue参数，决定了下面completionHandler处理是在哪个线程
    session = [NSURLSession sessionWithConfiguration:configuration delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL *localfile,NSURLResponse *response,NSError *err){
        //如果上面的delegateQueue，不在主线程
        [self performSelectorOnMainThread:@selector(doUIthings) withObject:nil waitUntilDone:NO];
    }];
    [task resume];
}

```










  

## Animation动画

动画的底层是Core Animation核心动画框架。

### 属性和方法

实现动画效果，下面三个属性比较重要：

* frame 图形
* transform 视图的缩放比例，旋转、移动等
* alpha 透明度，可以淡入淡出

方法：

```
+ (void)animateWithDuration:(NSTimeInterval)duration //这个动画出现在屏幕上的时间。
delay:(NSTimeInterval)delay //等待多长时间再开始执行
options:(UIViewAnimationOptions)options 
animations:(void (^)(void))animations //一个Block，在这里可以修改frame alpha等属性
completion:(void (^)(BOOL finished))completion; //动画完了之后执行

[UIView animateWithDuration:3.0 
delay:0.0 
options:UIViewAnimationOptionBeginFromCurrentState 
animations:^{self.view.alpha=0.0;} 
completion:^(BOOL fin){if(fin) [self.view removeFromSuperview];}];

```

关于options还有很多很多


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


## 持久化

有一个NSUserDefaults，与Android里面的SharedPreference很类似，记得需要进行同步。