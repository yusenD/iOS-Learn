# Learn Task 2

## UIView

* 包含在UIKit，最基础的视图类，管理屏幕上一定区域内容展示。
* 作为各种视图类型的父类，提供基础的能力。
* 外观、渲染和动画。
* 相应区域内的事件。
* 布局和管理子视图。

### 布局

* 设置大小、位置（frame）
* addSubView

使用栈管理全部的子View，位置重叠的时候展示栈顶元素，可以随时调整位置，也可以插入到指定位置。

示例：

```

    UIView * view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    view.frame  = CGRectMake(100, 100, 100, 100);
    
    UIView * view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor greenColor];
    view2.frame  = CGRectMake(150, 150, 100, 100);
    
    [self.view addSubview:view2];
    [self.view addSubview:view];

```

![](https://i.loli.net/2019/06/03/5cf4798291ec298818.jpg)

### 生命周期

```

-(instancetype) init{
    self = [super init];
    if(self){
        
    }
    return self;
}

- (void)willMoveToSuperview:(nullable UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
}

- (void)didMoveToSuperview{
    [super didMoveToSuperview];
}

- (void)willMoveToWindow:(nullable UIWindow *)newWindow{
    [super willMoveToWindow:newWindow];
}

- (void)didMoveToWindow{
    [super didMoveToWindow];
}

```


## UIViewController

视图管理器，管理视图View层级结构。

自身包含了View，可以理解为一个容器：
* 管理View视图的生命周期
* 响应用户操作
* 和APP整体交互，视图切换
* 作为一个container管理多个Controller和动画

![](https://i.loli.net/2019/06/03/5cf47ed987d1e88847.jpg)

### 生命周期

* init：初始化重载函数
* viewDidLoad
* viewWillAppear
* viewDidAppear
* viewWillDisappear
* viewDidDisappear
* Dealloc

### 与UIView一起搭建APP

* UIView负责页面内的内容呈现
* 使用基础的UIViewController管理多个UIView
* UIViewController在管理UIView的同时，负责不同页面的切换

## UITabBarController

* 管理多个ViewController切换，通过点击底部按钮，选中对应需要展示的ViewController。
* 由上面的ViewController和下面的UITabBar组成。


代码实例：
```
    //在AppDelegate.m里面
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    
    UIViewController *controller1 = [[UIViewController alloc] init];
    controller1.view.backgroundColor = [UIColor redColor];
    controller1.tabBarItem.title = @"新闻";
    
    UIViewController *controller2 = [[UIViewController alloc] init];
    controller2.view.backgroundColor = [UIColor blackColor];
    controller2.tabBarItem.title = @"视频";
    
    UIViewController *controller3 = [[UIViewController alloc] init];
    controller3.view.backgroundColor = [UIColor greenColor];
    controller3.tabBarItem.title = @"推荐";
    
    UIViewController *controller4 = [[UIViewController alloc] init];
    controller4.view.backgroundColor = [UIColor whiteColor];
    controller4.tabBarItem.title = @"我的";

    
    [tabbarController setViewControllers:@[controller1,controller2,controller3,controller4]];
    
    self.window.rootViewController = tabbarController;

```

## UINavigationController

* 通过栈管理页面间的跳转
* 通常只展示栈顶页面
* Push/Pop操作
* 由ViewController和UINavigationBar组成

### UINavigationBar

* UINavigationController管理
* 顶部UIViewController变化，UINavigationBar则同步变化

![](https://i.loli.net/2019/06/03/5cf4dfe36900117683.jpg)

 







