//
//  LuJinSuoTableViewCell.m
//  CurveLineDemo
//
//  Created by apple on 16/3/2.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import "LuJinSuoProductCell.h"
#import "Masonry.h"

@implementation LuJinSuoProductCell


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

- (void) initSubViews {
    UILabel *titleLab = [UILabel new];
    titleLab.text = @"零活宝-14日聚财";
//    titleLab.backgroundColor = [UIColor redColor];
    [self addSubview:titleLab];
    
    UILabel *descLab = [UILabel new];
    descLab.text = @"陆金所新客专享";
//    descLab.backgroundColor = [UIColor yellowColor];
    [self addSubview:descLab];
    
    
    UILabel *leftContentLab = [UILabel new];
    leftContentLab.text = @"10.00%";
//    leftContentLab.backgroundColor = [UIColor blackColor];
    [self addSubview:leftContentLab];

    UILabel *middleContentLab = [UILabel new];
    middleContentLab.text = @"12个月";
//    middleContentLab.backgroundColor = [UIColor grayColor];
    [self addSubview:middleContentLab];

    
    UILabel *rightContentLab = [UILabel new];
    rightContentLab.text = @"10000元";
//    rightContentLab.backgroundColor = [UIColor greenColor];
    [self addSubview:rightContentLab];
    
    UILabel *leftLab = [UILabel new];
    leftLab.text = @"年化收益率";
//    leftLab.backgroundColor = [UIColor purpleColor];
    [self addSubview:leftLab];
    
    UILabel *middleLab = [UILabel new];
    middleLab.text = @"理财期限";
//    middleLab.backgroundColor = [UIColor orangeColor];
    [self addSubview:middleLab];
    
    
    UILabel *rightLab = [UILabel new];
    rightLab.text = @"投资起点";
//    rightLab.backgroundColor = [UIColor brownColor];
    [self addSubview:rightLab];


    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(15);
        make.top.equalTo(self.mas_top).with.offset(10);
        make.size.mas_equalTo(CGSizeMake((self.bounds.size.width-30)/2, 15));
        
    }];
    
    [descLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.and.top.equalTo(titleLab);
        make.right.mas_equalTo(-20);
    }];
    
    
    [leftContentLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.equalTo(blackView);
        make.size.mas_equalTo(CGSizeMake((self.bounds.size.width-30)/3, 15));
        // 添加上边距约束（上边距 = 黑色view的下边框 + 偏移量20）
        make.top.equalTo(titleLab.mas_bottom).offset(20);
        // 添加左边距（左边距 = 父容器纵轴中心 + 偏移量0）
        make.left.equalTo(self.mas_left).with.offset(15);
    }];
    
    [middleContentLab mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.size.and.centerY.equalTo(leftContentLab);
        make.centerX.equalTo(self);

    }];
    
    [rightContentLab mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.size.and.centerY.equalTo(leftContentLab);
        make.right.equalTo(descLab);
        
    }];
    
    [leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.size.and.centerX.equalTo(leftContentLab);
        make.top.equalTo(leftContentLab.mas_bottom).offset(10);
    }];
    
    [middleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.and.centerX.equalTo(middleContentLab);
        make.centerY.equalTo(leftLab);

        
    }];
//
    [rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.and.centerX.equalTo(rightContentLab);
        make.centerY.equalTo(leftLab);
        
    }];


    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
