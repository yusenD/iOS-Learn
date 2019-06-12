//
//  PoundViewController.m
//  fish
//
//  Created by yuhao on 2019/6/11.
//  Copyright © 2019 yuhao. All rights reserved.
//

#import "PoundViewController.h"

@interface PoundViewController ()

@end

@implementation PoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"鱼塘";
    self.view.backgroundColor = [UIColor whiteColor];
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:table];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
