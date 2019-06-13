# Learn Task 4

仿照闲鱼做一个简单的App，功能如下
1. 要有tabViewController
2. 首页是一个UIViewController，View是一个TableView
3. 首页嵌套在一个NavigationController里面
4. 点击首页的tableViewCell，可以在NavigationController里面push另外一个ViewController

## 宏定义

### block使用

在ARC和非ARC环境下，使用block不当会引起循环引用问题，如：某个类将block作为自己的属性变量，然后在block方法体内，又使用了该类本身。

如：

```
@interface ViewController()
@property (nonatomic, copy)myBlock theBlock;
@end

@implementation
__block typeof(self) wSelf = self;
NSLog(@"%@",@(self.retainCount));
myBlock block = ^(void){
    NSLog(@"%@",@(wSelf.retainCount));
    NSLog(@"%@.block init",[wSelf.class description]);
};
self.theBlock = [[block copy] autorelease];

if (self.theBlock) {
    self.theBlock();
}
@end
```


解决方法：

```
#define WEAKSELF typeof(self) __weak weakSelf = self;
//在多线程环境下，block中的wSelf有可能被析构，需要现将self转换成strong指针
//避免运行到某关键步骤的时候self对象被析构
#define STRONGSELF typeof(weakSelf) __strong strongSelf = weakSelf;
```

参考AFNetworking代码
```
__weak __typeof(self)weakSelf = self;
AFNetworkReachabilityStatusBlock callback =  ^(AFNetworkReachabilityStatus status) { 
    __strong __typeof(weakSelf)strongSelf = weakSelf;
    strongSelf.networkReachabilityStatus = status;
    if (strongSelf.networkReachabilityStatusBlock) {
         strongSelf.networkReachabilityStatusBlock(status);
    }
};
```



### pargma mark

`#pragma mark -` 是一个在类内部组织代码并且帮助你分组方法实现的好办法，建议使用来分离：

* 不同功能组的方法
* protocols 的实现
* 对父类方法的重写

例如：
```
#pragma mark - View Lifecycle （View 的生命周期）

- (void)viewDidLoad { /* ... */ }
- (void)viewWillAppear:(BOOL)animated { /* ... */ }
- (void)didReceiveMemoryWarning { /* ... */ }

#pragma mark - Custom Accessors （自定义访问器）

- (void)setCustomProperty:(id)value { /* ... */ }
- (id)customProperty { /* ... */ }

#pragma mark - IBActions  

- (IBAction)submitData:(id)sender { /* ... */ }

#pragma mark - Public 

- (void)publicMethod { /* ... */ }

#pragma mark - Private

- (void)zoc_privateMethod { /* ... */ }

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath { /* ... */ }

#pragma mark - ZOCSuperclass

// ... 重载来自 ZOCSuperclass 的方法

#pragma mark - NSObject

- (NSString *)description { /* ... */ }
```

上面的标记能明显分离和组织代码。你还可以用 cmd+Click 来快速跳转到符号定义地方。


### typedef NS_ENUM

第一个参数用于存储的新类型的类型，默认从0开始，然后递增赋值，也可以手动给元素赋值

```
typedef NS_ENUM(NSInteger, LanguageEntranceType) {
    UserLanguageEntranceType = 0, //0
    RepLanguageEntranceType,    //1
    TrendingLanguageEntranceType, //2
};
```

### typedef NS_OPTIONS

不像 NS_ENUM ，位掩码用 NS_OPTIONS 宏。用简单的OR (|)和AND (&)数学运算即可实现对一个整型值的编码。

```
typedef NS_OPTIONS(NSUInteger, UIViewAutoresizing) {
    UIViewAutoresizingNone                 = 0,
    UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,
    UIViewAutoresizingFlexibleWidth        = 1 << 1,
    UIViewAutoresizingFlexibleRightMargin  = 1 << 2,
};
```

##KVO

Key-Value Observer，简称KVO，是一种观察者模式，观察一个对象的属性，注册一个指定的路径，如果这个对象的属性修改，则KVO会自动通知观察者。

### 注册监听

```
- (void)addObserver:(NSObject *)observer
         forKeyPath:(NSString *)keyPath
            options:(NSKeyValueObservingOptions)options
            context:(void *)context
```

具体解释一下上面的几个属性：
* observer：注册KVO通知的对象，观察者必须实现key-value observing方法
* keyPath：观察者的属性的keypath，相对于接受者，值不能是nil
* options：是`NSKeyValueObservingOptions`的组合，指定了观察通知中包含了什么
* context：上下文声明

#### NSKeyValueObservingOptions

引用一下吧

> * `NSKeyValueObservingOptionNew`: 表明变化的字典应该提供新的属性值，如过可以的话。
* `NSKeyValueObservingOptionOld`: 表明变化的字典应该包含旧的属性值，如过可以的话。
* `NSKeyValueObservingOptionInitial`: 如果被指定，一个通知会立刻发送到观察者，甚至在观察者注册方法之前就返回，改变的字典需要包含一个 NSKeyValueChangeNewKey 入口，如果 NSKeyValueObservingOptionNew 也被指定的话，但从来不会包含一个NSKeyValueChangeOldKey 入口。（在一个 initial notification 里，观察者的当前属性可能是旧的，但对观察者来说是新的），你可以使用这个选项代替显式的调用，同时，代码也会被观察者的 observeValueForKeyPath:ofObject:change:context: 方法调用，当这个选项被用于 addObserver:forKeyPath:options:context:，一个通知将会发送到每个被观察者添加进去的索引对象中。
* `NSKeyValueObservingOptionPrior`:是否各自的通知应该在每个改变前后发送到观察者，而不是在改变之后发送一个单独的通知。一个通知中的可变数组在改变发生之前发送经常包含一个 NSKeyValueChangeNotificationIsPriorKey 入口且它的值是 @YES，但从来不会包含一个 NSKeyValueChangeNewKey 入口。当这个选项被指定，在改变之后发送的通知中的变化的字典包含了一个与在选项没有被指定的情况下应该包含的同一个入口，当观察者自己的键值观察需要它的时候，你可以使用这个选项来调用 -willChange... 方法中的一个来观察它自己的某个属性，那个属性的值依赖于被观察的对象的属性。（在那种情况，调用 -willChange... 来对收到的一个observeValueForKeyPath:ofObject:change:context: 消息做出反应可能就太晚了）

#### 设置Context

context，它可以被用作区分那些绑定同一个 keypath 的不同对象的观察者。
```
static void * XXContext = &XXContext;

```
就是这么简单：一个静态变量存着它自己的指针，这意味着它自己什么也没有，使 <NSKeyValueObserving> 更完美。

### 回调函数

```
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
```


## 代码细节

### dispatch_once

保证block在生命周期之内只运行一次。

```
+ (CoreSpotlightManager *)sharedInstance
{
    static CoreSpotlightManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}
```

