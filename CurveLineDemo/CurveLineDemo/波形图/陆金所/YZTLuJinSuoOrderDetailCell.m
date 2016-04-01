//
//  LuJinSuoOrderDetailCell.m
//  CurveLineDemo
//
//  Created by apple on 16/3/3.
//  Copyright © 2016年 MZ. All rights reserved.
//

#import "YZTLuJinSuoOrderDetailCell.h"
#import "Masonry.h"

@implementation YZTLuJinSuoOrderDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [self initSubViews];
    }
    return self;
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
    rightContentLab.text = @"还有90天到期";
    rightContentLab.textAlignment = NSTextAlignmentRight;
    //    rightContentLab.backgroundColor = [UIColor greenColor];
    [self addSubview:rightContentLab];
    
    UILabel *leftLab = [UILabel new];
    leftLab.text = @"投资金额";
    //    leftLab.backgroundColor = [UIColor purpleColor];
    [self addSubview:leftLab];
    
//    UIImageView *imgv = [UIImageView new];
//    imgv.backgroundColor = [UIColor yellowColor];
//    [self addSubview:imgv];
    
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
    
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

@implementation YZTLuJinSuoOtherCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryNone;
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    
    UILabel *leftLab = [UILabel new];
    leftLab.text = @"投资金额";
    leftLab.textAlignment = NSTextAlignmentLeft;
    //    leftLab.backgroundColor = [UIColor redColor];
    [self addSubview:leftLab];
    
    UILabel *contentLab = [UILabel new];
    contentLab.text = @"8,000000";
    contentLab.textAlignment = NSTextAlignmentRight;
    //    contentLab.backgroundColor = [UIColor yellowColor];
    [self addSubview:contentLab];
    
    
    [leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(15);
        make.top.equalTo(self.mas_top).with.offset(15);
        make.size.mas_equalTo(CGSizeMake((self.bounds.size.width-30)/2, 15));
        
    }];
    
    [contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.and.centerY.equalTo(leftLab);
        make.right.mas_equalTo(-20);
        
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

