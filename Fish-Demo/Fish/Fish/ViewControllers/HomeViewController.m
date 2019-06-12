//
//  HomeViewController.m
//  fish
//
//  Created by yuhao on 2019/6/11.
//  Copyright © 2019 yuhao. All rights reserved.
//

#import "HomeViewController.h"
#import "DetailViewController.h"
#import "../Views/GoodsTableViewCell.h"
#import "../Common/AppConfig.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UISearchBar *searchBar;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = grayColor;
    
    //标题
    UILabel *titleText = [[UILabel alloc] initWithFrame: CGRectMake((ScreenWidth-120)/2, 0, 120, 44)];
    titleText.backgroundColor = [UIColor clearColor];
    titleText.textColor=[UIColor blackColor];
    [titleText setFont:[UIFont systemFontOfSize:19.0]];
    titleText.textAlignment=NSTextAlignmentCenter;
    titleText.text = @"首页";
//    self.navigationItem.titleView=titleText;
    
    //searchBar
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake((ScreenWidth-120)/2, 0, 10, 10)];
    self.navigationItem.titleView = searchBar;
    
    UIView *placeHolderBackgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 80, ScreenWidth, 190)];
    placeHolderBackgroundView.backgroundColor = fishColor;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:placeHolderBackgroundView.bounds byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(40, 40)];
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.frame = placeHolderBackgroundView.bounds;
    layer.path = path.CGPath;
    placeHolderBackgroundView.layer.mask = layer;
    [self.view addSubview:placeHolderBackgroundView];
    
    UIView *itemContainer = [[UIView alloc] initWithFrame:CGRectMake(20, 100, ScreenWidth-20-20, 150)];
    itemContainer.layer.cornerRadius = 10.0;
    itemContainer.backgroundColor = [UIColor whiteColor];
    
    UIImageView *phoneView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image"]];
    [itemContainer addSubview:phoneView];
    
    [self.view addSubview:itemContainer];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 80+200, ScreenWidth - 10 - 10, ScreenHeight - 55 - 200)];
    tableView.layer.cornerRadius = 10.0;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    self.navigationItem.backBarButtonItem.tintColor = [UIColor blackColor];
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 135;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"id";
    GoodsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(!cell){
        cell = [[GoodsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    cell.titleLabel.text = [NSString stringWithFormat:@"闲鱼商品%@号",@(indexPath.row+1)];
    cell.descriptionLabel.text = [NSString stringWithFormat:@"来闲鱼1234天了，卖出过1234件宝贝。现居山西太原。70后双子座女生。"];
    cell.idLabel.text = [NSString stringWithFormat:@"实人认证已通过"];
    cell.creditLabel.text = [NSString stringWithFormat:@"芝麻信用已授权"];
    cell.headImageView.image = [UIImage imageNamed:@"AppIcon"];
    cell.idImageView.image = [UIImage imageNamed:@"id"];
    cell.creditImageView.image = [UIImage imageNamed:@"credit"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    GoodsModel *model = [[GoodsModel alloc] init];
    model.title = [NSString stringWithFormat:@"闲鱼商品%@号",@(indexPath.row+1)];
    //这里最好是一个NSArray，根据indexPath来获取
    model.goods = [NSString stringWithFormat:@"来闲鱼1234天了，卖出过1234件宝贝。现居山西太原。70后双子座女生。"];
    detailVC.goodsModel = model;
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
