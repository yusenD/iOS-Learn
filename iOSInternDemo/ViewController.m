//
//  ViewController.m
//  iOSInternDemo
//
//  Created by jingsong.jn on 2019/5/27.
//  Copyright © 2019 jingsong.jn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (instancetype) init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIView * view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor greenColor];
    view2.frame  = CGRectMake(150, 150, 100, 100);

    [self.view addSubview:view2];

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
    [view2 addGestureRecognizer:tapGesture];
    
    
}

- (void)pushController{
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.navigationItem.title = @"内容";
    
    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右侧标题" style:UIBarButtonItemStylePlain target:self action:nil];
    
    [self.navigationController pushViewController:viewController animated:YES];
}


@end
