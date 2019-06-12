//
//  DetailViewController.h
//  fish
//
//  Created by yuhao on 2019/6/11.
//  Copyright © 2019 yuhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Models/GoodsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController
@property(nonatomic,strong) GoodsModel *goodsModel;

@end

NS_ASSUME_NONNULL_END
