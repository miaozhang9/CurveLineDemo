//
//  LuJinSuoOrderCell.m
//  CurveLineDemo
//
//  Created by apple on 16/3/2.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import "LuJinSuoOrderCell.h"
#import "Masonry.h"

@implementation LuJinSuoOrderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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
//    titleLab.backgroundColor = [UIColor redColor];
    [self addSubview:titleLab];
    
    UILabel *leftContentLab = [UILabel new];
    leftContentLab.text = @"10000";
    leftContentLab.textColor = [UIColor redColor];
//    leftContentLab.backgroundColor = [UIColor blackColor];
    [self addSubview:leftContentLab];
    
    UILabel *rightContentLab = [UILabel new];
    rightContentLab.text = @"申请";
//    rightContentLab.backgroundColor = [UIColor greenColor];
    [self addSubview:rightContentLab];
    
    UILabel *leftLab = [UILabel new];
    leftLab.text = @"投资金额";
//    leftLab.backgroundColor = [UIColor purpleColor];
    [self addSubview:leftLab];
    
    UILabel *rightLab = [UILabel new];
    rightLab.text = @"订单状态";
//    rightLab.backgroundColor = [UIColor brownColor];
    [self addSubview:rightLab];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [UIColor blackColor];
    [self addSubview:lineView];
    
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(15);
        make.top.equalTo(self.mas_top).with.offset(10);
        make.size.mas_equalTo(CGSizeMake((self.bounds.size.width-30)/2, 15));
        
    }];

    [leftContentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.height.equalTo(blackView);
        make.size.mas_equalTo(CGSizeMake((self.bounds.size.width-30)/2, 15));
        // 添加上边距约束（上边距 = 黑色view的下边框 + 偏移量20）
        make.top.equalTo(titleLab.mas_bottom).offset(20);
        // 添加左边距（左边距 = 父容器纵轴中心 + 偏移量0）
        make.left.equalTo(self.mas_left).with.offset(15);
    }];
    
    [leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.and.centerX.equalTo(leftContentLab);
        make.top.equalTo(leftContentLab.mas_bottom).offset(15);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(leftContentLab.mas_right).offset(10);
        make.top.equalTo(leftContentLab);
        make.size.mas_equalTo(CGSizeMake(1.0f, 50.0f));
    } ];
    
    [rightContentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake((self.bounds.size.width-30)/2, 15));
        make.left.equalTo(lineView.mas_right).offset(30);
        make.top.equalTo(leftContentLab);
        
    }];
    
    [rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.centerX.equalTo(rightContentLab);
        make.top.equalTo(rightContentLab.mas_bottom).offset(15);
    }];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
