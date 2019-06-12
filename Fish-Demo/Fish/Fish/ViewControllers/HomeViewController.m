//
//  HomeViewController.m
//  fish
//
//  Created by yuhao on 2019/6/11.
//  Copyright © 2019 yuhao. All rights reserved.
//

#import "HomeViewController.h"
#import "DetailViewController.h"
#import "../Common/AppConfig.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UISearchBar *searchBar;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleText = [[UILabel alloc] initWithFrame: CGRectMake((ScreenWidth-120)/2, 0, 120, 44)];
    titleText.backgroundColor = [UIColor clearColor];
    titleText.textColor=[UIColor blackColor];
    [titleText setFont:[UIFont systemFontOfSize:19.0]];
    titleText.textAlignment=NSTextAlignmentCenter;
    titleText.text = @"首页";
//    self.navigationItem.titleView=titleText;
    
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake((ScreenWidth-120)/2, 0, 10, 10)];
    self.navigationItem.titleView = searchBar;
    
    UIView *placeHolderBackgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 55, ScreenWidth, 200)];
    placeHolderBackgroundView.backgroundColor = fishColor;
    [self.view addSubview:placeHolderBackgroundView];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 55+200, ScreenWidth, ScreenHeight - 55 - 200)];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    // Do any additional setup after loading the view.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"商品 %@",@(indexPath.row)];
    cell.detailTextLabel.text = @"商品简介...";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    detailVC.title = [NSString stringWithFormat:@"%@",@(indexPath.row)];
    detailVC.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:detailVC animated:YES];
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
