//
//  LuJinSuoOrderCell.m
//  CurveLineDemo
//
//  Created by apple on 16/3/2.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import "YZTLuJinSuoOrderCell.h"
#import "Masonry.h"

@implementation YZTLuJinSuoOrderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryNone;
        [self initSubViews];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)initSubViews {
    UILabel *titleLab = [UILabel new];
    titleLab.text = @"零活宝-14日聚财";
     titleLab.textAlignment = NSTextAlignmentLeft;
//    titleLab.backgroundColor = [UIColor redColor];
    [self addSubview:titleLab];
    
    UILabel *leftContentLab = [UILabel new];
    leftContentLab.text = @"10000";
    leftContentLab.textColor = [UIColor redColor];
//    leftContentLab.backgroundColor = [UIColor blackColor];
    [self addSubview:leftContentLab];
    
    UILabel *rightContentLab = [UILabel new];
    rightContentLab.text = @"申请";
    rightContentLab.textAlignment = NSTextAlignmentRight;
//    rightContentLab.backgroundColor = [UIColor greenColor];
    [self addSubview:rightContentLab];
    
    UILabel *leftLab = [UILabel new];
    leftLab.text = @"投资金额";
//    leftLab.backgroundColor = [UIColor purpleColor];
    [self addSubview:leftLab];
    
    UIImageView *imgv = [UIImageView new];
    imgv.backgroundColor = [UIColor yellowColor];
    [self addSubview:imgv];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [UIColor grayColor];
    [self addSubview:lineView];
    
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(15);//.with
        make.top.equalTo(self.mas_top).offset(15);//.with
        make.size.mas_equalTo(CGSizeMake((self.bounds.size.width-30)/2, 15));
        
    }];

    [leftContentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.height.equalTo(blackView);
        make.size.mas_equalTo(CGSizeMake((self.bounds.size.width-30)/2, 15));
        // 添加上边距约束（上边距 = 黑色view的下边框 + 偏移量20）
        make.top.equalTo(titleLab.mas_bottom).offset(30);
        // 添加左边距（左边距 = 父容器纵轴中心 + 偏移量0）
        make.left.equalTo(self.mas_left).offset(15);
    }];
    
    [leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.and.centerX.equalTo(leftContentLab);
        make.top.equalTo(leftContentLab.mas_bottom).offset(7);
    }];

    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLab.mas_left).offset(0);
        make.top.equalTo(titleLab.mas_bottom).offset(7);
        make.right.equalTo(self.mas_right).offset(-15);
        make.height.mas_equalTo(0.5f);
    } ];

    [rightContentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake((self.bounds.size.width-30)/2, 15));
         make.right.equalTo(self.mas_right).with.offset(-15);
        make.top.equalTo(titleLab);
        
    }];

    [imgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(leftContentLab.mas_centerY).offset(10);
        make.right.equalTo(lineView.mas_right);
        make.size.mas_equalTo(CGSizeMake(20,20));
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
