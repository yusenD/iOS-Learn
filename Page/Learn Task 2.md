# Learn Task 2

## UIView

* 包含在UIKit，最基础的视图类，管理屏幕上一定区域内容展示。
* 作为各种视图类型的父类，提供基础的能力。
* 外观、渲染和动画。
* 相应区域内的事件。
* 布局和管理子视图。

### 方法

可以在添加和删除子View：

```
-(void) addSubview:(UIView *)aview;
-(void) removeFromSuperview;
```

在UIViewController里面有一个属性，可以用self.view调用，是UIViewController的顶级UIView，可以看做一个容器，可以在里面增加别的View：
```
@property(nonatomic,strong) UIView *view;
```

在初始化的时候，可以使用`initWithFrame:aRect`方法。



### 一些View坐标

* CGFloat：屏幕上的点等全部用的是这个数字
* CGPoint：有两个值x和y
* CGSize：长和宽
* CGRect：包含CGPoint和CGSize，屏幕的最左上角是(0,0)

> CG是Core Graphics的缩写


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

### 自定义绘制

需要重写`drawRect`方法，但是不要调用，这个是系统进行调用的。如果想要触发重新绘制，可以调用`setNeedsDisplay`方法。

步骤：
* contex
* 创建path，UIBezierPath
* 颜色、线宽
* 填充、描边

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
* viewDidLoad：在 instantiation 和 outlet-setting 之后调用，很适合初始化代码，比init好，整个生命周期内只会被调用一次。但是，不能在这里添加任何关于视图形状的初始化信息。
* viewWillAppear：当视图控制器的视图就要出现在屏幕上之前会调用，适合于视图不可见的时候可能改变的内容进行同步，比如Model等。需要注意，不要再这个方法里面添加一次性初始化内容，当视图重新在屏幕上显示的时候，这个方法会被再次调用。
* viewDidAppear：加载完了之后调用
* viewWillDisappear：当将要消失时候调用，可以停止动画等，停止耗费资源。
* viewDidDisappear
* Dealloc
* viewWillLayoutSubview：比较适合几何的初始化，在第一次viewDidLoad之后或者横屏竖屏切换的时候会调用这个方法。
* didReceviewMemoryWarning：当系统内存空间不足会收到，需要释放一些资源。

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
* 顶部UIViewController变化，UINavigationBar则同步变化，内容由嵌入式MVC的navigationItem决定
* title
* rightBarButtonItems可以放多个button，NSArry
* Back Button
* segue

```

- (void)pushController{
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.navigationItem.title = @"内容";
    
    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右侧标题" style:UIBarButtonItemStylePlain target:self action:nil];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

```

![](https://i.loli.net/2019/06/03/5cf4dfe36900117683.jpg)

### 方法
弹出
`[self.navigationController popViewControllerAnimated:YES]`[]()


## UIWindow

是一个特殊形式的View，可以想象成一个窗口容器，和ViewController一起协同工作，通常屏幕上只存在、展示一个UIWindow。

* 使用storyborad会帮我们自动创建
* 手动创建
  * 创建UIWindow
  * 设置rootViewController
  * makeKeyAndVisible

  
  ![](https://i.loli.net/2019/06/04/5cf5c53f18f3461708.jpg)

## UITabView

* UITableViewCell
* tableHeaderView
* UITableView
* tableFooterView

UITableView作为视图，只负责展示，协助管理，不管理数据，需要开发者为UITableView提供所需要的数据及Cell。

通过delegate的模式，开发者需要实现UITableViewDataSource


 







