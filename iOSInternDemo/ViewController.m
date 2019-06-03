//
//  ViewController.m
//  iOSInternDemo
//
//  Created by jingsong.jn on 2019/5/27.
//  Copyright © 2019 jingsong.jn. All rights reserved.
//

#import "ViewController.h"

@interface TestView : UIView



@end

@implementation TestView

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


@end


@interface ViewController ()

@end

@implementation ViewController

- (instancetype) init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    UIView * view = [[UIView alloc] init];
//    view.backgroundColor = [UIColor redColor];
//    view.frame  = CGRectMake(100, 100, 100, 100);、
//        [self.view addSubview:view];
    
    TestView * view2 = [[TestView alloc] init];
    view2.backgroundColor = [UIColor greenColor];
    view2.frame  = CGRectMake(150, 150, 100, 100);
    
    [self.view addSubview:view2];

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
    [view2 addGestureRecognizer:tapGesture];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)pushController{
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.navigationItem.title = @"内容";
    
    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右侧标题" style:UIBarButtonItemStylePlain target:self action:nil];
    
    [self.navigationController pushViewController:viewController animated:YES];
}


@end
