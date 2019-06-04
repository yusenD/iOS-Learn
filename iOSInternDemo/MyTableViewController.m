//
//  MyTableViewController.m
//  iOSInternDemo
//
//  Created by yuhao on 2019/6/4.
//  Copyright © 2019 jingsong.jn. All rights reserved.
//

#import "MyTableViewController.h"

@interface MyTableViewController ()

@end

@implementation MyTableViewController

- (instancetype) init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:table];
}

//- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
//    <#code#>
//}
//
//- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    <#code#>
//}


@end

