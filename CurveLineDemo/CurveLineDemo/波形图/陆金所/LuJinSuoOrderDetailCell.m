//
//  LuJinSuoOrderDetailCell.m
//  CurveLineDemo
//
//  Created by apple on 16/3/3.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import "LuJinSuoOrderDetailCell.h"
#import "Masonry.h"

@implementation LuJinSuoOrderDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    UILabel *leftLab = [UILabel new];
    leftLab.text = @"投资金额";
//    leftLab.backgroundColor = [UIColor redColor];
    [self addSubview:leftLab];
    
    UILabel *leftLab2 = [UILabel new];
    leftLab2.text = @"订单状态";
//    leftLab2.backgroundColor = [UIColor yellowColor];
    [self addSubview:leftLab2];
    
    UILabel *leftLab3 = [UILabel new];
    leftLab3.text = @"申请状态";
//    leftLab3.backgroundColor = [UIColor greenColor];
    [self addSubview:leftLab3];
    
    UILabel *leftLab4 = [UILabel new];
    leftLab4.text = @"申请时间";
//    leftLab4.backgroundColor = [UIColor blueColor];
    [self addSubview:leftLab4];
    
    UILabel *rightLab = [UILabel new];
    rightLab.text = @"10000";
    rightLab.textColor = [UIColor redColor];
//    rightLab.backgroundColor = [UIColor purpleColor];
    [self addSubview:rightLab];
    
    UILabel *rightLab2 = [UILabel new];
    rightLab2.text = @"申请";
//    rightLab2.backgroundColor = [UIColor orangeColor];
    [self addSubview:rightLab2];
    
    UILabel *rightLab3 = [UILabel new];
    rightLab3.text = @"申请成功";
//    rightLab3.backgroundColor = [UIColor grayColor];
    [self addSubview:rightLab3];
    
    UILabel *rightLab4 = [UILabel new];
    rightLab4.text = @"2016-03-01";
//    rightLab4.backgroundColor = [UIColor brownColor];
    [self addSubview:rightLab4];
    
    
    [leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(20);
        make.top.equalTo(self.mas_top).with.offset(20);
        make.size.mas_equalTo(CGSizeMake((self.bounds.size.width-40)/2, 15));
    }];

    [leftLab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.centerX.equalTo(leftLab);
        make.top.equalTo(leftLab.mas_bottom).offset(20);
    }];
    
    [leftLab3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.centerX.equalTo(leftLab2);
        make.top.equalTo(leftLab2.mas_bottom).offset(20);
    }];
    
    [leftLab4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.centerX.equalTo(leftLab3);
        make.top.equalTo(leftLab3.mas_bottom).offset(20);
    }];
    
    [rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-20);
        make.size.and.top.equalTo(leftLab);
    }];
    
    [rightLab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.centerX.equalTo(rightLab);
        make.top.equalTo(rightLab.mas_bottom).offset(20);
    }];
    [rightLab3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.centerX.equalTo(rightLab2);
        make.top.equalTo(rightLab2.mas_bottom).offset(20);
    }];
    [rightLab4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.centerX.equalTo(rightLab3);
        make.top.equalTo(rightLab3.mas_bottom).offset(20);
    }];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
