//
//  GoodsTableViewCell.m
//  fish
//
//  Created by yuhao on 2019/6/12.
//  Copyright © 2019 yuhao. All rights reserved.
//

#import "GoodsTableViewCell.h"
#import "../Common/AppConfig.h"

@implementation GoodsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        float cellWidth = ScreenWidth;
        float cellHeight = 130;
        float padding = 10;
        float originX = 15;
        float originY = 5;
        
        float titleWidth = 100;
        float titleHeight = 30;
        float headImageWidth = 60;
        float headImageHeight = 60;
        float smallImageWidth = 20;
        float smallImageHeight = 20;
        float tintWidth = 100;
        float tintHeight = smallImageHeight;
        float descriptionWidth = cellWidth - padding*5 - headImageWidth;
        float descriptionHeight = titleHeight*2;
        
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, cellWidth, cellHeight)];
        [self.contentView addSubview:bgView];
        
        //标题
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(originX, originY+padding, titleWidth, titleHeight)];
        [bgView addSubview:_titleLabel];
        
        //简介
        _descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(originX, originY+titleHeight, descriptionWidth, descriptionHeight)];
        [bgView addSubview:_descriptionLabel];
        
        //image
        _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(originX+descriptionWidth+padding/2, originY+padding*2, headImageWidth, headImageHeight)];
        [bgView addSubview:_headImageView];
        
        _idImageView = [[UIImageView alloc] initWithFrame:CGRectMake(originX, originY+titleHeight+descriptionHeight, smallImageWidth, smallImageWidth)];
        [bgView addSubview:_idImageView];
        
        _idLabel = [[UILabel alloc] initWithFrame:CGRectMake(originX+smallImageWidth+padding/2, originY+titleHeight+descriptionHeight, tintWidth, tintHeight)];
        [bgView addSubview:_idLabel];
        
        _creditImageView = [[UIImageView alloc] initWithFrame:CGRectMake(originX+smallImageWidth+padding*1.5+tintWidth, originY+titleHeight+descriptionHeight, smallImageWidth, smallImageHeight)];
        [bgView addSubview:_creditImageView];
        
        _creditLabel = [[UILabel alloc] initWithFrame:CGRectMake(originX+smallImageWidth+padding*2+tintWidth+smallImageWidth, originY+titleHeight+descriptionHeight, tintWidth, tintHeight)];
        [bgView addSubview:_creditLabel];
        
        _descriptionLabel.numberOfLines=0;
        
        [_titleLabel setFont:[UIFont boldSystemFontOfSize:16]];
        [_descriptionLabel setFont:[UIFont systemFontOfSize:15]];
        [_idLabel setFont:[UIFont systemFontOfSize:14]];
        [_creditLabel setFont:[UIFont systemFontOfSize:14]];
        
        _headImageView.layer.cornerRadius = 10;
        _headImageView.layer.borderColor = grayColor.CGColor;
        _headImageView.layer.borderWidth=0.2;
        _headImageView.layer.masksToBounds=YES;
        
        bgView.backgroundColor = [UIColor redColor];
        _titleLabel.backgroundColor = [UIColor whiteColor];
        _idImageView.backgroundColor = [UIColor whiteColor];
        _idLabel.backgroundColor = [UIColor whiteColor];
        _headImageView.backgroundColor = [UIColor whiteColor];
        _creditLabel.backgroundColor = [UIColor whiteColor];
        _creditImageView.backgroundColor = [UIColor whiteColor];
        _descriptionLabel.backgroundColor = [UIColor whiteColor];
        
        
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
