//
//  YZTAssetSelectCell.m
//  CurveLineDemo
//
//  Created by apple on 15/9/6.
//  Copyright (c) 2015年 MZ. All rights reserved.
//

#import "YZTAssetSelectCell.h"

@implementation YZTAssetSelectCell
{
    UIImageView *_leftImgView;
    UILabel *_rightlab;

}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self createImageViewAndLab];
    }
    return self;
}
-(void)createImageViewAndLab{
    UIImageView *leftImgView = [[UIImageView alloc] initWithFrame:CGRectMake(14, 7.5, 28, 28)];//kScreenWidth
    leftImgView.backgroundColor = [UIColor redColor];
    [self addSubview:leftImgView];
    
    UILabel *rightlab           = [[UILabel alloc] initWithFrame:CGRectMake(leftImgView.frame.origin.x+leftImgView.frame.size.width+8, 12, 100, 20)];
    rightlab.font               = [UIFont systemFontOfSize:16.0f];
    rightlab.backgroundColor    = [UIColor clearColor];
    rightlab.textColor          = [UIColor blackColor];
    rightlab.text               = @"借记卡";
    _rightlab                      = rightlab;
    [self addSubview:rightlab];
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
