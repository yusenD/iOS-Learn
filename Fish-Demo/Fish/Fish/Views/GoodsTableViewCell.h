//
//  GoodsTableViewCell.h
//  fish
//
//  Created by yuhao on 2019/6/12.
//  Copyright © 2019 yuhao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GoodsTableViewCell : UITableViewCell
@property(nonatomic,strong) UILabel *titleLabel;
@property(nonatomic,strong) UILabel *descriptionLabel;
@property(nonatomic,strong) UIImageView *headImageView;
@property(nonatomic,strong) UIImageView *idImageView;
@property(nonatomic,strong) UILabel *idLabel;
@property(nonatomic,strong) UIImageView *creditImageView;
@property(nonatomic,strong) UILabel *creditLabel;
@end

NS_ASSUME_NONNULL_END
